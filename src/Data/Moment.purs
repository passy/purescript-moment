module Data.Moment
  ( Epoch()
  , Unix()
  , Zone()
  , DayOfYear()
  , WeekOfYear()
  , Moment()
  , invalid
  , now
  , isValid
  , format
  , calendar
  , clone
  ) where

import Prelude

import Control.Monad.Eff
import Data.Date (Now())
import Data.Function
import Data.Foreign.OOFFI
import Data.Maybe
import Data.Enum
import Data.Foldable
import Data.Tuple
import Data.Array

-- milliseconds
type Epoch        = Number
-- seconds
type Unix         = Number
-- timezone
type Zone         = Number

type DayOfYear    = Number
type WeekOfYear   = Number

foreign import data Moment :: *

method1' :: forall a. String -> a -> Moment -> Moment
method1' s a m = method1 s (clone m) a

method2' :: forall a b. String -> a -> b -> Moment -> Moment
method2' s a b m = method2 s (clone m) a b

foreign import invalid :: Moment
foreign import now :: forall e. Eff (now :: Now | e) Moment
foreign import max :: Moment -> Moment -> Moment
foreign import min :: Moment -> Moment -> Moment

isValid :: Moment -> Boolean
isValid = method0 "isValid"

isValidAt :: Moment -> String
isValidAt = method0 "isValidAt"

clone :: Moment -> Moment
clone = method0 "clone"

format :: String -> Moment -> String
format = flip $ method1 "format"

calendar :: Moment -> String
calendar = method0 "calendar"

isSame :: Moment -> Moment -> Boolean
isSame = method1 "isSame"

isSameG :: Granularity -> Moment -> Moment -> Boolean
isSameG g m m' = method2 "isSame" m m' $ show g

isAfter :: Moment -> Moment -> Boolean
isAfter = method1 "isAfter"

isBefore :: Moment -> Moment -> Boolean
isBefore = method1 "isBefore"

data Granularity  = Second
                  | Minute
                  | Hour
                  | Day
                  | Week
                  | Quarter
                  | Month
                  | Year

instance eqGranularity :: Eq Granularity where
  eq Second   Second  = true
  eq Minute   Minute  = true
  eq Hour     Hour    = true
  eq Day      Day     = true
  eq Week     Week    = true
  eq Quarter  Quarter = true
  eq Month    Month   = true
  eq Year     Year    = true
  eq _        _       = false

instance ordGranularity :: Ord Granularity where
  compare = compare `on` fromEnum

instance bndGranularity :: Bounded Granularity where
  top = Second
  bottom = Year

instance enmGranularity :: Enum Granularity where
  cardinality  = Cardinality 8

  succ Second  = Just Minute
  succ Minute  = Just Hour
  succ Hour    = Just Day
  succ Day     = Just Week
  succ Week    = Just Month
  succ Month   = Just Quarter
  succ Quarter = Just Year
  succ Year    = Nothing

  pred Second  = Nothing
  pred Minute  = Just Second
  pred Hour    = Just Minute
  pred Day     = Just Hour
  pred Week    = Just Day
  pred Month   = Just Week
  pred Quarter = Just Month
  pred Year    = Just Quarter

  toEnum i = case i of
    0 -> Just Second
    1 -> Just Minute
    2 -> Just Hour
    3 -> Just Day
    4 -> Just Week
    5 -> Just Month
    6 -> Just Quarter
    7 -> Just Year
    _ -> Nothing

  fromEnum e = case e of
    Second -> 0
    Minute -> 1
    Hour -> 2
    Day -> 3
    Week -> 4
    Month -> 5
    Quarter -> 6
    Year -> 7

instance showGranularity :: Show Granularity where
  show Second  = "second"
  show Minute  = "minute"
  show Hour    = "hour"
  show Day     = "day"
  show Week    = "week"
  show Quarter = "quarter"
  show Month   = "month"
  show Year    = "year"

startOf :: Granularity -> Moment -> Moment
startOf g = method1 "startOf" $ show g

endOf :: Granularity -> Moment -> Moment
endOf g   = method1 "endOf"   $ show g

instance eqMoment :: Eq Moment where
  eq = isSame

instance ordMoment :: Ord Moment where
  compare m m' | m == m'         = EQ
  compare m m' | m `isAfter` m'  = GT
  compare m m' | m `isBefore` m' = LT

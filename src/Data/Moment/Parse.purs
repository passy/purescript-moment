module Data.Moment.Parse
  ( parseObj
  , MomentObj()
  , parseUnix
  , parseEpoch
  , parseStringZ
  ) where

import Prelude

import Data.Moment.GetSet(setZone)
import Data.Date hiding (now)
import Data.Enum (fromEnum)
import Data.Time
import Data.Moment
import Data.Maybe
import Data.Function

type MomentObj = {
    years        :: Year,
    months       :: Month,
    days         :: DayOfMonth,
    hours        :: HourOfDay,
    minutes      :: MinuteOfHour,
    seconds      :: SecondOfMinute,
    milliseconds :: MillisecondOfSecond
  }

parseObjImpl  :: { years        :: Int
                 , months       :: Int
                 , days         :: Int
                 , hours        :: Int
                 , minutes      :: Int
                 , seconds      :: Int
                 , milliseconds :: Int } -> Moment
parseObjImpl = unsafeToMoment

parseObj :: MomentObj -> Maybe Moment
parseObj mo = let
    fromYear (Year i) = i
    fromMonth = fromEnum >>> (+1)
    fromDay (DayOfMonth i) = i
    fromHours (HourOfDay i) = i
    fromMinutes (MinuteOfHour i) = i
    fromSeconds (SecondOfMinute i) = i
    fromMilliseconds (MillisecondOfSecond i) = i
    mo' = parseObjImpl mo { years        = fromYear mo.years
                          , months       = fromMonth mo.months
                          , days         = fromDay mo.days
                          , hours        = fromHours mo.hours
                          , minutes      = fromMinutes mo.minutes
                          , seconds      = fromSeconds mo.seconds
                          , milliseconds = fromMilliseconds mo.milliseconds }
  in if isValid mo' then Just mo' else Nothing

foreign import parseUnix :: Unix -> Moment

foreign import parseString_ :: forall a e. Fn5 (Maybe Moment) (a -> Maybe Moment) Boolean (Array String) String (Maybe Moment)
parseString = runFn5 parseString_ Nothing Just true
parseStringForgiving = runFn5 parseString_ Nothing Just false

parseEpoch :: Epoch -> Moment
parseEpoch = unsafeToMoment

-- TODO: Should be in an .Unsafe module.
foreign import unsafeToMoment :: forall a. a -> Moment

parseStringZ :: (Array String) -> String -> Maybe Moment
parseStringZ ss s = setZone s <$> parseString ss s

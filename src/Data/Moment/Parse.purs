module Data.Moment.Parse where

import Prelude

import Data.Moment.GetSet(setZone)
import Data.Moment.Duration
import Data.Moment
import Data.Maybe
import Data.Function

type MomentObj = {
    years       :: Duration,
    months      :: Duration,
    days        :: Duration,
    hours       :: Duration,
    minutes     :: Duration,
    seconds     :: Duration,
    milliseconds:: Duration
  }

parseObjImpl  :: { years        :: Number
                 , months       :: Number
                 , days         :: Number
                 , hours        :: Number
                 , minutes      :: Number
                 , seconds      :: Number
                 , milliseconds :: Number } -> Moment

parseObjImpl = unsafeToMoment

parseObj :: MomentObj -> Maybe Moment
parseObj mo = let
    f   = foldDuration
    mo' = parseObjImpl mo{ years        = f mo.years
                         , months       = f mo.months
                         , days         = f mo.days
                         , hours        = f mo.hours
                         , minutes      = f mo.minutes
                         , seconds      = f mo.seconds
                         , milliseconds = f mo.milliseconds}
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

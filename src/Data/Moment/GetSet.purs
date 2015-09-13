module Data.Moment.GetSet where

import Prelude

import Data.Time
import Data.Date hiding (now)
import Data.Moment
import Data.Foreign.OOFFI
import Data.Maybe
import Data.Enum

milliseconds :: Moment -> Milliseconds
milliseconds = method0 "milliseconds" >>> Milliseconds

setMilliseconds :: Milliseconds -> Moment -> Moment
setMilliseconds (Milliseconds m) = clone >>> method1 "milliseconds" m

seconds :: Moment -> Seconds
seconds = method0 "seconds" >>> Seconds

setSeconds :: Seconds -> Moment -> Moment
setSeconds (Seconds s) = clone >>> method1 "seconds" s

minutes :: Moment -> Minutes
minutes = method0 "minutes" >>> Minutes

setMinutes :: Minutes -> Moment -> Moment
setMinutes (Minutes m) = clone >>> method1 "minutes" m

hours :: Moment -> Hours
hours = method0 "hours" >>> Hours

setHours :: Hours -> Moment -> Moment
setHours (Hours h) = clone >>> method1 "hours" h

dayOfMonth :: Moment -> DayOfMonth
dayOfMonth = method0 "dates"

setDayOfMonth :: DayOfMonth -> Moment -> Moment
setDayOfMonth d m = method1 "dates" d $ clone m

dayOfWeek :: Moment -> Maybe DayOfWeek
dayOfWeek = method0 "days" >>> toEnum

setDayOfWeek :: DayOfWeek -> Moment -> Moment
setDayOfWeek = fromEnum >>> method1 "days"

dayOfWeek' :: Moment -> Maybe DayOfWeek
dayOfWeek' = method0 "weekday" >>> toEnum

setDayOfWeek' :: DayOfWeek -> Moment -> Moment
setDayOfWeek' = fromEnum >>> method1 "weekday"

dayOfYear :: Moment -> DayOfYear
dayOfYear = method0 "dayOfYear"

setDayOfYear :: DayOfYear -> Moment -> Moment
setDayOfYear = method1 "dayOfYear"

weekOfYear :: Moment -> WeekOfYear
weekOfYear = method0 "weeks"

setWeekOfYear :: WeekOfYear -> Moment -> Moment
setWeekOfYear = method1 "weeks"

month :: Moment -> Maybe Month
month = method0 "month" >>> toEnum

setMonth :: Month -> Moment -> Moment
setMonth = fromEnum >>> method1 "month"

quarter :: Moment -> Number
quarter = method0 "quarter"

setQuarter :: Number -> Moment -> Moment
setQuarter = method1 "quarter"

year :: Moment -> Number
year = method0 "year"

setYear :: Number -> Moment -> Moment
setYear = method1 "year"

setZone :: String -> Moment -> Moment
setZone = method1 "zone"

getZone :: Moment -> Zone
getZone = method0 "zone"

valueOf :: Moment -> Epoch
valueOf = method0 "valueOf"

epoch :: Moment -> Epoch
epoch = valueOf

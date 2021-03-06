# Module Documentation

[![Build Status](https://travis-ci.org/CapillarySoftware/purescript-moment.svg?branch=master)](https://travis-ci.org/CapillarySoftware/purescript-moment)
[![Bower version](https://badge.fury.io/bo/purescript-moment.svg)](http://badge.fury.io/bo/purescript-moment)
[![Dependency Status](https://www.versioneye.com/user/projects/547010e481010639bd0006c8/badge.svg?style=flat)](https://www.versioneye.com/user/projects/547010e481010639bd0006c8)

## Module Data.Moment

### Types

    type DayOfMonth  = Number

    type DayOfYear  = Number

    type Epoch  = Number

    data Moment :: *

    data Now :: !

    type Unix  = Number

    type WeekOfYear  = Number

    type Zone  = Number


### Values

    calendar :: Moment -> String

    clone :: Moment -> Moment

    format :: String -> Moment -> String

    initMoment :: Unit

    invalid :: Moment

    isValid :: Moment -> Boolean

    isValidAt :: Moment -> String

    method1' :: forall a. String -> a -> Moment -> Moment

    method2' :: forall a b. String -> a -> b -> Moment -> Moment

    now :: forall e. Eff (now :: Now | e) Moment


## Module Data.Moment.Compare

### Type Class Instances

    instance eqMoment :: Eq Moment

    instance ordMoment :: Ord Moment

    instance showMoment :: Show Moment


### Values

    isAfter :: Moment -> Moment -> Boolean

    isBefore :: Moment -> Moment -> Boolean

    isSame :: Moment -> Moment -> Boolean

    isSameG :: Granularity -> Moment -> Moment -> Boolean

    max :: Moment -> Moment -> Moment

    min :: Moment -> Moment -> Moment


## Module Data.Moment.Duration

### Types

    data Duration where
      Milliseconds :: Number -> Duration
      Seconds :: Number -> Duration
      Minutes :: Number -> Duration
      Hours :: Number -> Duration
      Months :: Number -> Duration
      Weeks :: Number -> Duration
      Years :: Number -> Duration
      Days :: Number -> Duration

    data MDuration :: *


### Type Class Instances

    instance durationSemigroup :: Semigroup Duration

    instance showDuration :: Show Duration


### Values

    asDays :: Duration -> Duration

    asHours :: Duration -> Duration

    asMilliseconds :: Duration -> Duration

    asMilliseconds' :: MDuration -> Duration

    asMinutes :: Duration -> Duration

    asMonths :: Duration -> Duration

    asSeconds :: Duration -> Duration

    asYears :: Duration -> Duration

    durToMDur :: Duration -> MDuration

    durToMDurImpl :: Fn2 Number String MDuration

    foldDuration :: Duration -> Number

    humanize :: Duration -> String

    humanize' :: Duration -> String

    semigroupDurationImpl :: MDuration -> MDuration -> MDuration

    stringDuration :: Duration -> String


## Module Data.Moment.GetSet

### Values

    dayOfMonth :: Moment -> DayOfMonth

    dayOfWeek :: Moment -> Maybe WeekDay

    dayOfWeek' :: Moment -> Maybe WeekDay

    dayOfYear :: Moment -> DayOfYear

    getZone :: Moment -> Zone

    hours :: Moment -> Duration

    milliseconds :: Moment -> Duration

    minutes :: Moment -> Duration

    month :: Moment -> Maybe Month

    quarter :: Moment -> Number

    seconds :: Moment -> Duration

    setDayOfMonth :: DayOfMonth -> Moment -> Moment

    setDayOfWeek :: WeekDay -> Moment -> Moment

    setDayOfWeek' :: WeekDay -> Moment -> Moment

    setDayOfYear :: DayOfYear -> Moment -> Moment

    setHours :: Duration -> Moment -> Moment

    setMilliseconds :: Duration -> Moment -> Moment

    setMinutes :: Duration -> Moment -> Moment

    setMonth :: Month -> Moment -> Moment

    setQuarter :: Number -> Moment -> Moment

    setSeconds :: Duration -> Moment -> Moment

    setWeekOfYear :: WeekOfYear -> Moment -> Moment

    setYear :: Number -> Moment -> Moment

    setZone :: String -> Moment -> Moment

    valueOf :: Moment -> Epoch

    weekOfYear :: Moment -> WeekOfYear

    year :: Moment -> Number


## Module Data.Moment.Manipulate

### Types

    data Granularity where
      Second :: Granularity
      Minute :: Granularity
      Hour :: Granularity
      Day :: Granularity
      Week :: Granularity
      Quarter :: Granularity
      Month :: Granularity
      Year :: Granularity


### Type Class Instances

    instance enmGranularity :: Enum Granularity

    instance eqGranularity :: Eq Granularity

    instance ordGranularity :: Ord Granularity

    instance showGranularity :: Show Granularity


### Values

    add :: Duration -> Moment -> Moment

    endOf :: Granularity -> Moment -> Moment

    startOf :: Granularity -> Moment -> Moment

    subtract :: Duration -> Moment -> Moment


## Module Data.Moment.Month

### Types

    data Month where
      January :: Month
      February :: Month
      March :: Month
      April :: Month
      May :: Month
      June :: Month
      July :: Month
      August :: Month
      September :: Month
      October :: Month
      November :: Month
      December :: Month


### Type Class Instances

    instance enumMonth :: Enum Month

    instance eqMonth :: Eq Month

    instance ordMonth :: Ord Month

    instance showMonth :: Show Month


## Module Data.Moment.Parse

### Types

    type MomentObj  = { milliseconds :: Duration, seconds :: Duration, minutes :: Duration, hours :: Duration, days :: Duration, months :: Duration, years :: Duration }


### Values

    parseEpoch :: Epoch -> Moment

    parseObj :: MomentObj -> Maybe Moment

    parseObjImpl :: { milliseconds :: Number, seconds :: Number, minutes :: Number, hours :: Number, days :: Number, months :: Number, years :: Number } -> Moment

    parseStringZ :: [String] -> String -> Maybe Moment

    parseString_ :: forall a e. Fn5 (Maybe Moment) (a -> Maybe Moment) Boolean [String] String (Maybe Moment)

    parseUnix :: Unix -> Moment

    unsafeToMoment :: forall a. a -> Moment


## Module Data.Moment.WeekDay

### Types

    data WeekDay where
      Sunday :: WeekDay
      Monday :: WeekDay
      Tuesday :: WeekDay
      Wednesday :: WeekDay
      Thursday :: WeekDay
      Friday :: WeekDay
      Saturday :: WeekDay


### Type Class Instances

    instance enumWeekDay :: Enum WeekDay

    instance eqWeekDay :: Eq WeekDay

    instance ordDayOfWeek :: Ord WeekDay

    instance showWeekDay :: Show WeekDay




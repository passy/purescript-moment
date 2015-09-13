## Module Data.Moment.Parse

#### `MomentObj`

``` purescript
type MomentObj = { years :: Year, months :: Month, days :: DayOfMonth, hours :: HourOfDay, minutes :: MinuteOfHour, seconds :: SecondOfMinute, milliseconds :: MillisecondOfSecond }
```

#### `parseObjImpl`

``` purescript
parseObjImpl :: { years :: Int, months :: Int, days :: Int, hours :: Int, minutes :: Int, seconds :: Int, milliseconds :: Int } -> Moment
```

#### `parseObj`

``` purescript
parseObj :: MomentObj -> Maybe Moment
```

#### `parseUnix`

``` purescript
parseUnix :: Unix -> Moment
```

#### `parseString_`

``` purescript
parseString_ :: forall a e. Fn5 (Maybe Moment) (a -> Maybe Moment) Boolean (Array String) String (Maybe Moment)
```

#### `parseEpoch`

``` purescript
parseEpoch :: Epoch -> Moment
```

#### `unsafeToMoment`

``` purescript
unsafeToMoment :: forall a. a -> Moment
```

#### `parseStringZ`

``` purescript
parseStringZ :: Array String -> String -> Maybe Moment
```



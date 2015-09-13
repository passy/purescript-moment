## Module Data.Moment

#### `Epoch`

``` purescript
type Epoch = Number
```

#### `Unix`

``` purescript
type Unix = Number
```

#### `Zone`

``` purescript
type Zone = Number
```

#### `DayOfYear`

``` purescript
type DayOfYear = Number
```

#### `WeekOfYear`

``` purescript
type WeekOfYear = Number
```

#### `Moment`

``` purescript
data Moment :: *
```

##### Instances
``` purescript
instance eqMoment :: Eq Moment
instance ordMoment :: Ord Moment
```

#### `invalid`

``` purescript
invalid :: Moment
```

#### `now`

``` purescript
now :: forall e. Eff (now :: Now | e) Moment
```

#### `isValid`

``` purescript
isValid :: Moment -> Boolean
```

#### `clone`

``` purescript
clone :: Moment -> Moment
```

#### `format`

``` purescript
format :: String -> Moment -> String
```

#### `calendar`

``` purescript
calendar :: Moment -> String
```



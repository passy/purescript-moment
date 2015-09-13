module Data.Moment.Manipulate where

import Prelude hiding (add)

import Data.Moment
import Data.Moment.Duration

import Data.Foreign.OOFFI
import Data.Enum
import Data.Maybe
import Data.Function

add :: Duration -> Moment -> Moment
add t = method2 "add" (foldDuration t) (stringDuration t)

subtract :: Duration -> Moment -> Moment
subtract t = method2 "subtract" (foldDuration t) (stringDuration t)

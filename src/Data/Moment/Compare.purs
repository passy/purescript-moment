module Data.Moment.Compare where

import Prelude hiding (add)

import Data.Moment
import Data.Foreign.OOFFI

foreign import max :: Moment -> Moment -> Moment
foreign import min :: Moment -> Moment -> Moment

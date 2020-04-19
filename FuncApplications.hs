import Control.Monad
import Control.Monad.Trans
import Control.Monad.Trans.Maybe
import Data.Char

{- given a function a -> b , a and b, apply the function
  (f -> a) $ (a) produces (b)
  example:
  greaterThanFive $ 3
  ($) :: (a -> b)
-}

greaterThanFive :: Int -> Bool 
greaterThanFive x = x > 5

greaterThanFive $ 3  -- returns  False :: b


{-
  given a function a -> b, a in context fa , 
  apply the function to a in context to produce b
  <$>  :: (a -> b) -> fa -> fb
-}

fmap greaterThanFive [4]  -- returns [False] :: {(b)}

{-
  function in context f(a -> b), a and b
  convert/lift a into fa
  pure :: a -> fa
  <*> :: f(a -> b) -> fa  -> fb
-}

[greaterThanFive] <*> [3]

{-
  fa -> (a -> fb) -> fb
  (>>=) :: Monad m => m a -> (a -> m b) -> m b
  
  (a -> fb) -> fa -> fb
  (=<<) :: Monad m => (a -> m b) -> m a -> m b
-}

[1,3,6] >>= (\x -> greaterThanFive x : [] )
-- [False,False,True]

{-
  (fa -> b) -> fa -> fb
  easy. apply fa -> b on fa which gives you b, then do pure b
-}

{-
  (fa -> fb) -> fa -> fb  ~=  (x -> y) -> x -> y plain old function the codomain Category
-}

{-
  (fa -> fb) -> a -> b 
  first raise a to fa using pure
  then it is  (fa -> fb) -> fa -> ... but this gives fb, not b

  fmap (+3) :: (Functor f, Num b) => f b -> f b
-}

{-
  (fa -> fb) -> a -> fb 
  see above
-}


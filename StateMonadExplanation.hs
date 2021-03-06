module Main where

newtype State s a = State{ runState :: s -> (a,s) }
-- runState is a function type


-- confusion arises as to why runState has two signatures?
-- consider the following data type
data Person = Person{ 
                      name:: String
                    , age :: Int 
                    }

--name is also an accessor function which takes Person and return String
name :: Person -> String

-- runState is an accessor so we don't have to pattern match the State 
runState :: State s a -> (s -> (a,s))

-- there is no State constructor. 
-- Only way to produce State s a is to run the following function
state :: (s -> (a,s)) ->  State s a

--       Monad     m      where
instance Monad (State s) where
  -- return :: a -> ma
  return :: a -> (State s) a 

  --(>>=) :: ma           -> ( a ->    mb )        ->     mb
  (>>=) :: ((State s) a) ->  ( a-> ((State s) b) ) -> ((State s) b)


p >>= k = q where -- p :: State s a ; k :: a -> (State s b) ; q :: State s b
  p' = runState p    -- p' :: s -> (a,s)
  k' = runState . k  -- k' :: a -> (s -> (b,s))

  q' s0 = (y, s2) where -- work backwards, write 'where' first
  -- q' is a func which takes a state and returns a pari of type-b and type-s as (b,s)
  -- q' :: s -> (b,s) 
    (x, s1) = p' s0 -- s0 :: s ; x :: a ; s1 :: s
    (y, s2) = k' x s1 -- s1 :: s ; x :: a ; s2 :: s ; y :: b


  q = state q' -- q :: State s b  ; q' :: s -> (b,s)


-- alternatively
p >>= k = state $ \s0 ->
  let (x, s1) = runState p s0
  in runState (k x) s1  -- returns (y::b, s2::s) as input to state function
-- state then convert (y,s2) into State s2::s y::b , the output


-- to get the initial state in the first place, the function is
put newState = state $ \_ -> ((), newState)

-- get
get = state $ \s -> (s,s)

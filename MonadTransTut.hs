module Main where
import Control.Monad
import Control.Monad.Trans
import Control.Monad.Trans.Maybe
import Data.Char

main :: IO ()
main = askPassword


askPassword = do
  putStrLn "enter password" -- 
  mayBePassword <- getPassword
  case mayBePassword of
    Just pwd -> putStrLn ("storing password")
    Nothing -> do 
      putStrLn ("Invalid password")

getPassword :: IO (Maybe String)
getPassword = do
  password <- getLine 
  if isValidPwd password
    then return $ Just password
    else return Nothing


isValidPwd :: String -> Bool
isValidPwd s = length s >= 8 && any isAlpha s

askPassword2 :: MaybeT IO ()
askPassword2 = do -- this do is in monad (MaybeT IO)
  lift $ putStrLn "enter password"
  pwd <- getPassword2  -- :: MaybeT IO String
  lift $ putStrLn ("storing " ++ pwd)

getPassword2 :: MaybeT IO String
getPassword2 = do
  s  <- lift getLine -- lift :: ma -> t ma; here m is (MaybeT IO);  
  -- >>= takes care of case - maybe of s and breaks if it is Nothing, next line will not be reached
  guard (isValidPwd s) -- guard :: Bool -> ma
  return s -- :: (MaybeT IO) String

main2 :: IO ()
main2 = do
  runMaybeT askPassword2 -- try running this line only in ghci. last print will be Just()
  return ()
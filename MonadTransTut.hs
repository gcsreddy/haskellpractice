module Main where

import Data.Char

main = do 
  putStrLn "enter password"
  mayBePassword <- getPassword
  case mayBePassword of
    Just pwd -> putStrLn ("storing password")
    Nothing -> do 
      putStrLn ("Invalid password")
      main

getPassword :: IO (Maybe String)
getPassword = do
  password <- getLine 
  if isValidPwd password
    then return $ Just password
    else return Nothing
    


isValidPwd :: String -> Bool
isValidPwd s = length s >= 8 && any isAlpha s

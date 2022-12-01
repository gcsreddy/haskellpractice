module Main where

import Data.List
import Data.List.Split

main :: IO ()
--main = putStrLn "Hello, Haskell!"
main = do
    v <- readFile "./input.txt"
    let x = lines v
    putStrLn . show $ maximum $ sum <$> ((read:: String -> Int) <$>) <$> splitWhen (=="") x
    putStrLn . show $ sum $ take 3 $ reverse . sort $ sum <$> ((read:: String -> Int) <$>) <$> splitWhen (=="") x

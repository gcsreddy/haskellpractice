module Main where

g:: [Char] -> Int
g "A Y" = 8
g "A Z" = 3
g "B Z" = 9
g "B X" = 1
g "C X" = 7
g "C Y" = 2
g "A X" = 4
g "B Y" = 5
g "C Z" = 6

g2:: [Char] -> Int
g2 "A Y" = 4
g2 "A Z" = 8
g2 "B Z" = 9
g2 "B X" = 1
g2 "C X" = 2
g2 "C Y" = 6
g2 "A X" = 3
g2 "B Y" = 5
g2 "C Z" = 7



main :: IO ()
main = do
    v <- readFile "./input.txt"
    let x = lines v
    putStrLn . show $ sum $ g <$> x 
    putStrLn . show $ sum $ g2 <$> x 

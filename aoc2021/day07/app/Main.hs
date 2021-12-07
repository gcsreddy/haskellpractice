module Main where

import Data.List
import Data.List.Split


main :: IO ()
main = do 
    v <- filter ( /= "") <$> splitOneOf ",\n"<$> readFile "./day07input.txt"
    let x = (read:: String -> Int) <$> v

        diffsum from to = div (d*(d+1)) 2 where d = abs (from - to)

    putStrLn . show $ minimum $ (\n -> sum $ abs . subtract n <$> x) <$> [(minimum x)..(maximum x)] -- part 1
    putStrLn . show $ minimum $ (\n -> sum $ diffsum n <$> x) <$> [(minimum x)..(maximum x)] -- part 2

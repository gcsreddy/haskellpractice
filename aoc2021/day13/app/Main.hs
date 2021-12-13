module Main where

import Control.Monad
import Data.Char
import Data.List
import Data.List.Split

foldup fy p = fmap (\(x:y:[]) -> if y > fy then [x,fy-(y-fy)] else [x,y]) p

foldleft fx p = fmap (\(x:y:[]) -> if x > fx then [fx-(x-fx),y] else [x,y]) p

foldxy xy pts = case xy of 
    ("x",x) -> nub $ foldleft x pts 
    ("y",y) -> nub $ foldup y pts

main :: IO ()
main = do
    v <- lines <$> readFile "./input.txt"
    let 
        p = (fmap (read::String -> Int)) <$> splitOn "," <$> takeWhile (not.null) v
        folds = fmap (\(x:y:[]) -> (x,(read::String -> Int) y)) $ fmap (splitOn "=") $ join $ fmap (drop 2) $ fmap words $ drop 1 $ dropWhile (not.null) v
        yfolds = filter ((== "y") . fst)folds
        partOne = length $ nub $ foldleft 655 p
        ans = sort $ fmap (\(a:b:[]) -> (a,b)) $ foldl (flip(foldxy)) p folds

    putStrLn . show $ partOne
    putStrLn . show $ ans
    --todo - print ans on a grid 

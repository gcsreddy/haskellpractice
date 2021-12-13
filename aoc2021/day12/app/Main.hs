module Main where

import Control.Monad
import Data.Char
import Data.List
import Data.List.Split

main :: IO ()
main = do
    v <- lines <$> readFile "./input.txt"
    let
        p = fmap (splitOn "-") v
        q = filter (\(a:b:[]) -> not (b == "start" || a == "end") ) ( p ++ fmap reverse p)
        allCaves = nub $ fmap head q
        neighs a =  filter (\(x:xs) -> x == a) q >>= (\(y:ys) -> ys)
        allSmallCaves = filter (\cave -> all isLower cave) allCaves
        
        noSmallCaveVisitedMoreThanOnce ls = not . any (>1) $ fmap (\cave -> length $ filter(==cave) ls ) allSmallCaves
        func1 ls = filter (noSmallCaveVisitedMoreThanOnce) $ (:) <$> (neighs =<< [head ls]) <*> [ls]
        --res = func1 ["start"] >>= func1 >>= func1 >>= func1 >>= func1 >>= func1 >>= func1
        partOne = length . filter (=="end") . join . join . takeWhile (not . null) $ iterate (>>= func1) (func1 ["start"])

        filterLessTwoAtmostOneTwo vc = (not $ any (>2) vc) && (length $ filter (==2) vc) <=1
        atMostOneSmallCaveVisitedMoreThanOnce ls = filterLessTwoAtmostOneTwo $ fmap (\cave -> length $ filter(==cave) ls) allSmallCaves
        func2 ls = filter (atMostOneSmallCaveVisitedMoreThanOnce) $ (:) <$> (neighs =<< [head ls]) <*> [ls]
        partTwo = length . filter (=="end") . join . join . takeWhile (not . null) $ iterate (>>= func2) (func2 ["start"])
        
    putStrLn . show $ partOne
    putStrLn . show $ partTwo

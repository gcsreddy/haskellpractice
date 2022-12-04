module Main where

import qualified Data.List as L
import qualified Data.List.Split as LS
import qualified Data.Map as M


overlapAll ranges = let xs = fmap (read:: String  -> Int) $ LS.splitOneOf (",-") ranges
  in case xs of 
    w:x:y:z:[] | (w >= y && x <= z) || (w <= y && x >= z) -> True
    otherwise -> False

overlapAny ranges = let xs = fmap (read:: String  -> Int) $ LS.splitOneOf (",-") ranges
  in case xs of 
    w:x:y:z:[] | (x < y) || (z < w ) -> False
    otherwise -> True

main :: IO ()
main = do
    v <- readFile "./input.txt"
    let x = lines v
    putStrLn . show . L.length $ L.filter (==True) $ fmap overlapAll x  -- partone
    putStrLn . show . L.length $ L.filter (==True) $ fmap overlapAny x  -- partTwo



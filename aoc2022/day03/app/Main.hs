module Main where

import qualified Data.List as L
import qualified Data.List.Split as LS
import qualified Data.Map as M

priorityMap = M.fromList $ zip (['a'..'z'] <> ['A'..'Z']) [1..]

splitHalf :: [Char] -> ([Char], [Char]) 
splitHalf l = splitAt ((length l + 1) `div` 2) l

commonLetter str = 
  let (h1,h2) = splitHalf str
  in head [x | x <- h1, y <- h2, x == y] `M.lookup` priorityMap

commonLetter2 (s1:s2:s3:[]) = head [x | x <- s1, y <- s2, z <- s3, x == y && x == z] `M.lookup` priorityMap

main :: IO ()
main = do
    v <- readFile "./input.txt"
    let x = lines v
    putStrLn . show . fmap sum . sequence $ commonLetter <$> x  -- partone
    putStrLn . show . fmap sum . sequence $ commonLetter2 <$> LS.chunksOf 3 x -- parttwo


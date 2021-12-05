module Main where

import Data.Char
import Data.List
import Data.List.Split
import Control.Monad

data Point = Point {x :: Int, y :: Int } deriving (Eq, Ord, Show)

isOrtho :: [Int] -> Bool
isOrtho (a:b:c:d:_) = (a == c) || (b == d) 
isOrtho _ = False


linePointsPartOne (a:b:c:d:_) 
    | a == c && b <= d = fmap (Point a) [b..d]
    | a == c && b >  d = fmap (Point a) [d..b]
    | b == d && a <= c = fmap (flip (Point) b) [a..c]
    | b == d && a >  c = fmap (flip (Point) b) [c..a]

linePointsPartTwo :: [Int] -> [Point]
linePointsPartTwo (a:b:c:d:_) 
    | a == c && b <= d = fmap (Point a) [b..d]
    | a == c && b >  d = fmap (Point a) [d..b]
    | b == d && a <= c = fmap (flip (Point) b) [a..c]
    | b == d && a >  c = fmap (flip (Point) b) [c..a]
    | a < c && b <= d = fmap (\(x,y) -> Point x y) $ zip [a..c] [b..d]
    | a > c && b <= d = fmap (\(x,y) -> Point x y) $ zip (reverse [c..a]) [b..d]
    | a < c && b > d = fmap (\(x,y) -> Point x y) $ zip [a..c] (reverse [d..b])
    | a > c && b > d = fmap (\(x,y) -> Point x y) $ zip (reverse [c..a]) (reverse [d..b])

main :: IO ()
main = do
    x <- lines <$> readFile "./day05input.txt"
    let z =(fmap . fmap) (read::String -> Int) $ (fmap . filter) (/="") $ fmap (splitOneOf " -> ,") x

        grpedpointsPartOne= group $ sort $ join $ fmap linePointsPartOne $ filter isOrtho z
        grpedpointsPartTwo = group $ sort $ join $ fmap linePointsPartTwo z

    putStrLn . show $ length $ filter (>1) $ fmap length grpedpointsPartOne
    putStrLn . show $ length $ filter (>1) $ fmap length grpedpointsPartTwo

        

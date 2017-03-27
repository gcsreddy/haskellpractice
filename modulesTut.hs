import Data.List

numOfUniqs :: (Eq a) => [a] -> Int
numOfUniqs = length . nub

import Control.Monad
import Data.Char
import Data.List

toDecimal :: [Char] -> Int
toDecimal = foldl' (\acc x -> acc * 2 + digitToInt x) 0

bitsAt :: Int -> [[b]] -> [b]
bitsAt index y = fmap (!! index) y

freqOxygenBit l
    | ones > zeros = 1
    | ones < zeros = 0
    | otherwise = 1
    where ones = length (filter (==1) l)
          zeros = length (filter (==0) l)

freqCarbonBit l
    | ones > zeros = 0
    | ones < zeros = 1
    | otherwise = 0
    where ones = length (filter (==1) l)
          zeros = length (filter (==0) l)


newzgen = (\freqBitfun -> (\curz i -> 
    if length curz == 1 then curz 
    else let fb = freqBitfun ( bitsAt i curz ) in filter (\k -> (k !! i) == fb) curz))

main = do
    x <- lines <$> readFile "./day03input.txt"
    let y = (digitToInt <$>) <$> x -- binary nums as list of digits 
    let oxRating = toDecimal . intercalate "" $ fmap show $ join $ foldl (\curz i -> newzgen freqOxygenBit curz i) y [0..11]
    let carbonRating = toDecimal . intercalate "" $ fmap show $ join $ foldl (\curz i -> newzgen freqCarbonBit curz i) y [0..11]
    putStrLn . show $ oxRating * carbonRating


import Data.Char
import Data.List

gammabit g t
    | g > t = 1
    | otherwise = 0

alphabit a t
    | a < t = 1
    | otherwise = 0

toDecimal = foldl' (\acc x -> acc * 2 + digitToInt x) 0

main = do
    x <- lines <$> readFile "./day03input.txt"
    let thres = div (length x) 2
    let b = foldl1 (zipWith (+)) $ (digitToInt <$>) <$> x -- sum all positional digits
    let gamma = toDecimal . intercalate "" $ show <$> gammabit thres <$> b -- get digit sum > inputlen/2 as 1, otherwise 0  
    let alpha = toDecimal . intercalate "" $ show <$> alphabit thres <$> b -- get digit sum < inputlen/2 as 1, otherwise 0 
    putStrLn . show $ gamma * alpha




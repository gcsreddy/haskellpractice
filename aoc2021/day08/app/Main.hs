module Main where
import Control.Monad
import Data.List
import qualified Data.List as L
import Data.List.Split
import Data.Set

func1 :: [[Set Char]] -> Maybe Int
func1 (inputDigits:outDigits:_) = 
    let one = head $ L.filter (\s -> length s == 2) inputDigits
        seven = head $ L.filter (\s -> length s == 3) inputDigits
        four = head $ L.filter (\s -> length s == 4) inputDigits
        eight = head $ L.filter (\s -> length s == 7) inputDigits
        nine = head $ L.filter (\s -> length s == 6 && four `isSubsetOf` s ) inputDigits
        six = head $ L.filter (\s -> length s == 6 && not (four `isSubsetOf` s) && not (one `isSubsetOf` s)) inputDigits 
        zero = head $ L.filter (\s -> length s == 6 && not (four `isSubsetOf` s) && one `isSubsetOf` s) inputDigits
        five = head $ L.filter (\s -> length s == 5 && s `isSubsetOf` six) inputDigits
        three = head $ L.filter (\s -> length s == 5 && not (s `isSubsetOf` six) && s `isSubsetOf` nine ) inputDigits
        two = head $ L.filter (\s -> length s == 5 && not (s `isSubsetOf` six) && not (s `isSubsetOf` nine) ) inputDigits

        r = zip [zero,one,two,three,four,five,six,seven,eight,nine] $ show <$> [0..9]

        in fmap (read::String -> Int) $ fmap concat $ sequenceA $ fmap (\s -> lookup s r) outDigits


main :: IO ()
main = do
    v <- lines <$> readFile "./day08input.txt"
    let w = splitOn "|" <$> v

        part1Ans = length $ L.filter (\n -> if n == 2 || n == 4 || n == 3 || n == 7 then True else False) $ join $ (fmap.fmap) length $ fmap words $ fmap (\(a:b:[]) -> b) w

        part2Ans = fmap sum $ sequenceA $ fmap func1 $ (fmap.fmap.fmap) Data.Set.fromList $ (fmap.fmap) words w

    
    putStrLn . show $ part1Ans
    putStrLn . show $ part2Ans


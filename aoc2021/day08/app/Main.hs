module Main where
import Control.Monad
import Data.List
import qualified Data.List as L
import Data.List.Split
import Data.Set

func1 :: [[Set Char]] -> Maybe Int
func1 (inSegDigits:outSegDigits:_) = 
    let one = head $ L.filter (\s -> length s == 2) inSegDigits
        seven = head $ L.filter (\s -> length s == 3) inSegDigits
        four = head $ L.filter (\s -> length s == 4) inSegDigits
        eight = head $ L.filter (\s -> length s == 7) inSegDigits
        nine = head $ L.filter (\s -> length s == 6 && four `isSubsetOf` s ) inSegDigits
        six = head $ L.filter (\s -> length s == 6 && not (four `isSubsetOf` s) && not (one `isSubsetOf` s)) inSegDigits 
        zero = head $ L.filter (\s -> length s == 6 && not (four `isSubsetOf` s) && one `isSubsetOf` s) inSegDigits
        five = head $ L.filter (\s -> length s == 5 && s `isSubsetOf` six) inSegDigits
        three = head $ L.filter (\s -> length s == 5 && not (s `isSubsetOf` six) && s `isSubsetOf` nine ) inSegDigits
        two = head $ L.filter (\s -> length s == 5 && not (s `isSubsetOf` six) && not (s `isSubsetOf` nine) ) inSegDigits

        r = zip [zero,one,two,three,four,five,six,seven,eight,nine] $ show <$> [0..9]

        in fmap (read::String -> Int) $ fmap concat $ sequenceA $ fmap (\s -> lookup s r) outSegDigits


main :: IO ()
main = do
    v <- lines <$> readFile "./day08input.txt"
    let w = splitOn "|" <$> v

        part1Ans = length $ L.filter (\n -> if n == 2 || n == 4 || n == 3 || n == 7 then True else False) $ join $ (fmap.fmap) length $ fmap words $ fmap (\(a:b:[]) -> b) w

        part2Ans = fmap sum $ sequenceA $ fmap func1 $ (fmap.fmap.fmap) Data.Set.fromList $ (fmap.fmap) words w

    
    putStrLn . show $ part1Ans
    putStrLn . show $ part2Ans


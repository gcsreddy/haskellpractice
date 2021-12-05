module Main where

import Data.Char
import Data.List
import Data.List.Split
import Control.Monad


type BingoState = ([[[Int]]], Int)

data Bingo = Bingo Int | Nah deriving Show

checkBingo :: BingoState -> [Bingo]
checkBingo (bingoState, num) = (\box -> 
    if (any (\r -> sum r == 0) (box ++ Data.List.transpose box)) 
    then Bingo ((sum $ join box) * num) 
    else Nah) <$> bingoState

isBingo :: Bingo -> Bool
isBingo bingo = case bingo of
    Bingo score -> True
    otherwise -> False

applyCurrntNum :: BingoState -> Int -> BingoState
applyCurrntNum currentState currNum = 
    let updatedState = (fmap . fmap . fmap) (\n -> if n /= currNum then n else 0) (fst currentState)
    in (updatedState, currNum)


main :: IO ()

main = do
    x <- lines <$> readFile "./day04input.txt"
    let rnums = fmap (read::String -> Int) $ splitOn "," $ (head x)
        z = splitOn [""] $ drop 2 x
        q = (fmap . fmap) (fmap (read:: String -> Int) .  words) z
        out = fmap checkBingo $ scanl applyCurrntNum (q,0) rnums
        maybeBingos = find (any (isBingo)) $ out
        partOneAns = case maybeBingos of 
            Just ls -> head $ filter (isBingo) ls
            _ -> Nah


        indexOfAllBingo = findIndex (all (isBingo)) $ fmap checkBingo $ scanl applyCurrntNum (q,0) rnums --first all bingo, just 86
        indexOfAllBingoMinusOne = (subtract 1) <$> indexOfAllBingo
        partTwoAns = case indexOfAllBingoMinusOne of
            Just i -> 
                let maybej = findIndex (not . isBingo) $ out !! i -- 85
                in case maybej of
                    Just j -> 
                        case indexOfAllBingo of 
                            Just k -> (out !! k) !! j -- (out !! 86) !! 18
                            _ -> Nah
                    _ -> Nah
            _ -> Nah

    putStrLn . show $ partOneAns
    putStrLn . show $ partTwoAns



    

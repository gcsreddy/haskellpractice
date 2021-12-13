module Main where

import Data.Char
import Data.List
import Data.Maybe

type Stack = [Char]

charPointsMap :: Char -> Int
charPointsMap c = case c of 
     ')' -> 3
     ']' -> 57
     '}' -> 1197
     '>' -> 25137

charPointsPartTwoMap c = case c of 
     ')' -> 1
     ']' -> 2
     '}' -> 3
     '>' -> 4

inchars = "([{<"
outchars = ")]}>"

inoutcharmap ch  = case ch of
    '(' -> ')'
    '[' -> ']'
    '{' -> '}'
    '<' -> '>'

func1 :: (Bool, Stack) -> Char -> (Bool, Stack)
func1 (_,stack) ch
    | ch `elem` inchars = (True, ch:stack) -- add to stack
    | ch `elem` outchars = (inoutcharmap (head stack) == ch, tail stack) 

partTwoScoring :: [Int] -> Int
partTwoScoring ns = case ns of
    [] -> 0
    n:ns -> n + 5 * partTwoScoring ns 

main :: IO ()
main = do
    v <- readFile "./input.txt"
    let x = lines v
        firstIllegalChar chs = fmap (fst) $ find (\(ch,b) -> not b) $ zip chs $ fmap (\(b,s) -> b) $ drop 1 $ scanl func1 (True, "") chs
        illegalChars = fmap firstIllegalChar x
        ansPartOne = sum . catMaybes $ (fmap . fmap) charPointsMap $ illegalChars
        
        --m = "{([(<{}[<>[]}>{[]{[(<()>"
        incompleteLines = fmap (\(a,b) -> a) $ filter(\(a,b) -> b) $ zip x $ fmap isNothing illegalChars
        remainingStack = (fmap.fmap) (charPointsPartTwoMap .inoutcharmap) $ fmap (reverse . snd) $ fmap (foldl func1 (True, "")) incompleteLines
        scores = sort $ fmap partTwoScoring remainingStack
        ansPartTwo = scores !! (div (length scores) 2) 

    putStrLn . show $ ansPartOne
    putStrLn . show $ ansPartTwo


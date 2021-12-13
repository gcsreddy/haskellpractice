module Main where
import Control.Monad
import Data.Char
import Data.List
import qualified Data.List as L
import Data.List.Split
import Data.Set

main :: IO ()
main = do 
    v <- lines <$> readFile "./input.txt"
    let w = (fmap . fmap) digitToInt v
        leftGtRight row = fmap (\(a,b) -> a > b) $  zip (9:row) row
        lessThanLeftNeigh = fmap leftGtRight w
        lessThanRightNeigh = fmap reverse $ fmap (leftGtRight . reverse) w
        lessThanTopNeigh = transpose $ fmap leftGtRight $ transpose w
        lessThanBottomNeigh = transpose $ fmap reverse $ fmap (leftGtRight . reverse ) $ transpose w
        y =  zipWith5 zip5 lessThanLeftNeigh lessThanRightNeigh lessThanTopNeigh lessThanBottomNeigh w
        partOneAns = sum $ (fmap (\(ln,rn,tn,bn,n) -> if ln && rn && tn && bn then n+1 else 0)) =<< y

        p = L.filter (\(a,b) -> L.length b > 0) $ zip [0..] $ fmap (findIndices (\(ln,rn,tn,bn,n) -> ln && rn && tn && bn)) y
        q = (\(a,b) -> fmap (\n -> (a,n)) b) =<< p
        nrows = length y
        ncols = length $ y !! 0

        ns(i,j) = let ln = (i,j-1); rn = (i, j+1); tn = (i-1,j); bn = (i+1,j); rec = y !! i !! j ; rec1 = (\(a,b,c,d,n) -> [a,b,c,d]) rec 
            in  L.filter (\(k,l) ->(\(_,_,_,_,nn) -> nn /= 9) (y !! k !! l) ) $ fmap (\(a,b) -> b) $ L.filter (\(a,b) -> a && (\(m,n) -> m >= 0 && n >=0 && m < nrows && n < ncols) b) $ zip rec1 [ln, rn, tn, bn]
        



    putStrLn . show $ partOneAns


module Main where

import Control.Monad
import Control.Monad.Trans.State
import Data.Char
import Data.List
import Data.List.Split

data Status = Building | Flashed deriving (Eq, Show, Read)
data Position = Position{px::Int, py::Int} deriving (Eq, Show, Read)
type Neighs = [Position]
data Octp = Octp {energy :: Int, status :: Status, position::Position, neighs::Neighs} deriving (Eq, Show, Read)


plusOneEngery matrix = (fmap . fmap) (\(Octp e s p n) -> Octp (e+1) s p n) matrix
updateNeighsEngery matrix (Octp e s p n) = (fmap . fmap) (\(Octp en sn pn nn) -> if (elem pn n) then Octp (en+1) sn pn nn else Octp en sn pn nn) matrix 
getOctpsWithEnergyGt9NotFlashed matrix = (\r -> filter (\(Octp e s p n) -> e > 9 && s /= Flashed) r ) =<< matrix
resetOctpEngeryToZero matrix = (fmap . fmap) (\(Octp e s p n) -> if (s == Flashed) then Octp 0 Building p n else Octp e s p n) matrix 
countFlashes matrix = length $ (\r -> filter (\(Octp e s p n) -> e == 0) r) =<< matrix

-- step 2 : for every octp with energy > 9 && status != Flashed, get neighs, update neigh oct with their energy = energy+1, take matrix and update matrix with neighs 
func1 matrix = 
    let octpsWithEnergyGt9NotFlashed = getOctpsWithEnergyGt9NotFlashed matrix
        s2res = foldl updateNeighsEngery matrix octpsWithEnergyGt9NotFlashed 
        posOfOctpsWithEnergyGt9NotFlashed = fmap(\(Octp e s p n) -> p) octpsWithEnergyGt9NotFlashed
    in
        -- step 3 : for the above posOfOctpsWithEnergyGt9NotFlashed, set these octps to Flashed
        (fmap . fmap) (\(Octp e s p n) -> if elem p posOfOctpsWithEnergyGt9NotFlashed then Octp e Flashed p n else Octp e s p n) s2res

iterateFunc (count, matrix) =
    let 
        --step 1 : +1 on all octps
        s1res = plusOneEngery matrix
        --func1 s1res
        -- repeat step 2 and step 3 until octpsWithEnergyGt9NotFlashed is empty
        -- until :: ([] -> Bool) -> ([] -> [])
        s4res = until (null . getOctpsWithEnergyGt9NotFlashed) func1 s1res 
        -- reset energy to 0 for octps whose status is Flashed and reset status to Building
        s5res = resetOctpEngeryToZero s4res
        -- count 0s
    in
        (countFlashes s5res, s5res)


main :: IO ()
main = do
    v <- lines <$> readFile "./input.txt"
    let w = (fmap . fmap) digitToInt v
        x = fmap (\r -> zip r [0..]) w
        y = transpose $ fmap (\r -> zip r [0..]) $ transpose x
        nrows = length $ x !! 0
        ncols = length x 
        --ns :: Int -> Int -> [(Int, Int)]
        ns i j = filter (\(x,y) -> x>=0 && x<nrows && y>=0 && y<ncols) [(i,j-1),(i,j+1),(i-1,j),(i+1,j),(i+1,j+1),(i-1,j+1),(i-1,j-1),(i+1,j-1)]

        --pns :: Position -> [Position]
        pns p = fmap (\(i,j) -> Position i j) $ ns (px p) (py p)
        m = fmap (\r -> fmap (\((e,x),y) -> Octp e Building (Position x y) (pns (Position x y) )) r ) y

    putStrLn . show $ sum $ take 100 $ drop 1 $ fmap (\(c,mt) -> c) $ iterate iterateFunc (0,m) --partOne
    putStrLn . show $ findIndex(==100) $ fmap (\(c,mt) -> c) $ iterate iterateFunc (0,m) --partTwo





import Day01Input(input)

main :: IO ()
main = 
    let ws = zipWith3 (\a b c -> a + b + c) input (tail input) (tail $ tail input) in 
    putStrLn $ show $ length $ filter (\(a,b) -> a < b) $ zip ws $ tail ws



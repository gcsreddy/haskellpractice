import Day01Input(input)

main :: IO ()
main = putStrLn $ show $ length $ filter (\(a,b) -> a < b) $ zip input $ tail input


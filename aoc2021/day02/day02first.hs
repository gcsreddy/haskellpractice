
g (h, d) c = case c of 
    "forward" : v : _ ->(h+(read v), d)
    "down": v : _ -> (h, d+(read v))
    "up" : v : _ -> (h, d-(read v))

ans (h,d) = h*d

main = do
    x <- readFile "./day02input.txt"
    putStrLn . show . ans . foldl g (0,0) $ words <$> lines x


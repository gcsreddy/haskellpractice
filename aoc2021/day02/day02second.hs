
j (h, a, d) c = case c of 
    "forward" : v : _ -> (h+(read v), a, d+a*(read v))
    "down": v : _ -> (h, a+(read v), d)
    "up" : v : _ -> (h, a-(read v), d)

ans (h,_,d) = h * d

main = do
    x <- readFile "./day02input.txt"
    putStrLn . show . ans . foldl j (0,0,0) $ words <$> lines x

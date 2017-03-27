doubleMe x = x + x

doubleUs x y= doubleMe x + doubleMe y

doubleSmallerNum  x = if x < 100 then 
  2*x
	else
		x

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

lucky :: (Integral a) => a -> String
lucky 7 = "Lucky number seven"
lucky x = "Lucky number is not seven"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial x = x * factorial (x-1)

charName :: Char -> String 
charName 'a' = "At"
charName 'b' = "Bat"
charName 'c' = "Cat"

head' :: [a] -> a
head' [] = error "empty list, no head"
head' (x:_) = x

bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
  | bmi <= skinny = "underweight"
  | bmi <= normal = "normal"
  | bmi <= fat = "over weight"
  | otherwise = "You are a whale!"
  where 
    bmi = weight / height^2 
    skinny = 18
    normal = 25
    fat = 35

cylinder :: (RealFloat a) => a -> a -> a
cylinder r h = 
  let 
    sideArea = 2 * pi * r * h
    topArea =  pi * r^2
  in sideArea + 2 * topArea


maximum' :: (Ord a) => [a] -> a
maximum' [] = error "Empty list"
maximum' [x] = x
maximum' (x:xs)
  | x > maximumOfTail = x
  | otherwise = maximumOfTail
  where maximumOfTail = maximum' xs

replicate' :: (Num a, Ord a) => a -> b -> [b]
replicate' n x
  | n < 0 = []
  | otherwise = x:replicate' (n-1) x


reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

take' :: (Num a, Ord a) => a -> [b] -> [b]
take' n _
  | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x : take' (n-1) xs


--quick sort

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort [x] = [x]
quicksort (x:xs) = 
  let smallersorted = quicksort [y | y <- xs, y <= x]
      biggerSorted = quicksort [y | y <- xs, y > x]
  in smallersorted ++ [x] ++ biggerSorted

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)



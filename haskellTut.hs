
doubleUs x y = doubleMe x + doubleMe y
doubleMe x = x+x
doubleSmallNum x = if x > 100 then x
					else doubleMe x


lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN"
lucky x = "Sorry, you're out of luck, pal!"

sayMe 1 = "One!"

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: "++ 
	show x	++ " and "++ show y
tell (x:y:_) = "This list is longer than two elements"

sum' :: (Num a) => [a]-> a
sum' [] = 0
sum' (x:xs) = x + sum' xs


capital :: String -> String
capital "" = "Empty Strings"
capital all@(x:xs) = "The first legger of "++ all
	++ " is " ++ [x]


--Guards --
{- 
Multi line comment 
-}

bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
	| bmi <= 18.5 = "You are  underweight"
	| bmi <= 25.0 = "You are normal"
	| bmi <=30 = "You are fat"
	| otherwise = "You are a whale"




maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs)
	| x > maxTail = x
	| otherwise = maxTail
	where maxTail = maximum' xs

replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
	| n <= 0 = []
	| otherwise = x:replicate' (n-1) x


applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)


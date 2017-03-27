{-
Haskell is a purly functional programming language.
The only thing a function can do is calcualte
something and return it.
If a function is called twice with same parameters,
it is guaranteed to return the same result.
This is called referential transparency.
You build more complex functions by gluing simple 
functions.
Haskell is lazy. Unless specifically told otherwise,
Haskell won't execute functions and calculate 
result until it is really forced to show you a
result.
Think program as a series of transformations on 
data.
Haskell is statically typed. 5 + "5" is invalid at
compile time.
Haskell has type inference. 
It knows what typeof data
aA = 5 + 4 
you don't have to say aA is a number.

-}

:~/tutorial/haskell$ ghci
GHCi, version 7.8.4: http://www.haskell.org/ghc/
  :? for help
Loading package ghc-prim ... linking ... done.
Loading package integer-gmp ... linking ... done.
Loading package base ... linking ... done.
Prelude> 

--comment--
{-multi line comment
-}

:l -- load
:r -- reload
:t -- type
:m -- module
:!clear --clear screen

Prelude> :set prompt "ghci> "
ghci> 

ghci> 2+5
7
ghci> 2-5
-3
ghci> 2*5
10
ghci> 2/5
0.4
ghci> 2%5

<interactive>:8:2: Not in scope: ‘%’
ghci> 5*(2+4)
30
ghci> 5*2+4
14
ghci> 5 * (-3)
-15
ghci> True && False
False
ghci> True && True
True
ghci> False || True
True
ghci> not False
True
ghci> not True
False
ghci> not (True || False)
False
ghci> 5 == 5
True
ghci> 5 == 4
False
ghci> 5 /= 5
False
ghci> 5 /= 4
True
ghci> "hello" == "hello"
True
ghci> 5 + 4.0
9.0

-- *,/,+,-  etc are infix functions.
-- most functions not on numbers are prefix 
--functions
-- can make an infix function to prefix function
-- by enclosing in brackets ex. (infix) params
ghci> (*) 4 6 
24

-- funtions are called by function name followed by
-- space and params with spaces.
ghci> succ 8
9
ghci> min 8 9
8
ghci> max 8 9
9
ghci> max 8 8
8

-- space has highest precedence.
ghci> succ 9 * 10
100
ghci> succ (9 * 10)
91

-- modulo operator is div
ghci> div 10 9
1
ghci> div 10 4 
2
ghci> div 4 10
0

-- a prefix function can be made infix by 
-- surrounding it with backticks
ghci> 92 `div` 10
9
ghci> 8 `min` 20
8



-- file baby.hs--
doubleMe x = x + x


ghci> :l ~/tutorial/haskell/baby.hs 
{-[1 of 1] Compiling Main            
 ( /home/gcsreddy/tutorial/haskell/baby.hs,
  interpreted )
Ok, modules loaded: Main.
ghci> 
-}

ghci> doubleMe 9
18

ghci> doubleMe 9.3
18.6

-- to file baby.hs add--
doubleUs x y= doubleMe x + doubleMe y

ghci> :r
{-[1 of 1] Compiling Main             
( /home/gcsreddy/tutorial/haskell/baby.hs, 
interpreted )
Ok, modules loaded: Main. -}

ghci> double --+ tab --
doubleMe  doubleUs

ghci> doubleUs  8 10
36
ghci> doubleUs  3 4 + doubleMe 5
24

--Functions doesn't have to be in a particular
--order.

-- to file baby.hs add--
doubleSmallerNum  x = if x < 100 then
	2*x
	else
		x

ghci> :r
ghci> doubleSmallerNum  80
160
ghci> doubleSmallerNum  200
200
-- if statement in haskell is an expression
-- it has to return, so else is mandatory

-- ' is used in function names to denote
-- the function as a strict (not lazy)
-- function or a slight variation of a function.

--lists are homogenous datastructures
-- let keyword to define a name in GHCI
-- same as a = 1 in script and loading it

ghci> let  lostNumbers = [4,8, 13,19,23,27]
ghci> lostNumbers 
[4,8,13,19,23,27]

ghci> "hello"
"hello"
--"hello" is a syntactic sugar of 
--['h','e','l','l','o']
ghci> [1,2,3,4]++[5,6]
[1,2,3,4,5,6]
ghci> "Hello" ++ "world"
"Helloworld"
-- ++ op navigates the entire left list. expensive
ghci> 9: [1,2,3,4]
[9,1,2,3,4]
-- : aka cons operator is instantaneous.
-- prepends an element to list at head

-- [1,2,3] is sugar of 1:2:3:[]
-- [] is empty list
ghci> "Chandra" !! 4 --!! gets an element from list
'd'
ghci> [1,2,3,4,5,6] !! 5
6
ghci> [1,2,3,4,5,6] !! -1

ghci> --lists can also contain lists
ghci> let b = [[1,2,3],[4,5],[6,7,8,9]]
ghci> b !! 1
[4,5]

ghci> [3,2,1] > [3,2]
True
ghci> [3,2,1] >= [3,2,1]
True
ghci> [3,2,1] == [3,2,1]
True
ghci> [3,2,1] == [4,2,1]
False
ghci> [3,2,1] > [1,2,1]
True
ghci> 
ghci> head [3,5,1,4]
3
ghci> tail [3,5,1,4]
[5,1,4]
ghci> last [3,5,1,4]
4
ghci> init [3,5,1,4]
[3,5,1]
ghci> head []
*** Exception: Prelude.head: empty list
ghci> lostNumbers 
[4,8,13,19,23,27]
ghci> length lo -- tab--
log          logBase      lookup       lostNumbers
ghci> length lostNumbers 
6
ghci> 
ghci> null []
True
ghci> null [1,2,3,4]
False
ghci> 
ghci> reverse [1,2,3,4,5,6]
[6,5,4,3,2,1]
ghci> take 3 [1,2,3,4,5,6,7]
[1,2,3]
ghci> take 0 [1,2,3,4]
[]
ghci> drop 3 [2,5,3,1,4]
[1,4]
ghci> drop 0 [2,5,3,1,4]
[2,5,3,1,4]
ghci> maximum [2,5,3,1,4]
5
ghci> minimum [2,5,3,1,-4]
-4
ghci> sum [2,5,3,1,4]
15
ghci> product [2,5,3,1,4]
120
ghci> product [2,5,3,1,4,0]
0
ghci> 
ghci> 4 `elem` [2,5,3,1,4]
True

--Ranges--
ghci> [1..20]
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
ghci> ['a'..'f']
"abcdef"
ghci> ['A'..'G']
"ABCDEFG"
ghci> [2,6..20]
[2,6,10,14,18]
ghci> [20,19..1]
[20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]
ghci> 
ghci> [13,26..24*13]
[13,26,39,52,65,78,91,104,117,130,143,156,169,182,
195,208,221,234,247,260,273,286,299,312]
ghci> take 24 [13,26..]
[13,26,39,52,65,78,91,104,117,130,143,156,169,182,
195,208,221,234,247,260,273,286,299,312]
ghci> 
ghci> take 10 (cycle [1,2,3])
[1,2,3,1,2,3,1,2,3,1]
ghci> take 3 (cycle "lol")
"lol"
ghci> repeat 10 5
ghci> take 10 (repeat 5)
[5,5,5,5,5,5,5,5,5,5]
ghci> replicate 10 5
[5,5,5,5,5,5,5,5,5,5]
ghci> 

-- Set comprehensions:
-- example { 2*x | x belogs N, x <= 10}
-- where x <= 10 is predicate, N is input set
-- is equal to {2,4,6,8,10,12,14,16,18,20}
-- similarly list comprehension
ghci> [2*x | x <- [1..10]]
[2,4,6,8,10,12,14,16,18,20]

ghci> [2*x | x <- [1..10], x > 12]
[]
ghci> [2*x | x <- [1..10], x > 5]
[12,14,16,18,20]
ghci> [2*x | x <- [1..10], 2*x > 15]
[16,18,20]
ghci> 
ghci> let boomBangs xs = [if x < 10 then 
	"BOOM" else "BANG"| x <-xs, odd x]
ghci> boomBangs [7..13]
["BOOM","BOOM","BANG","BANG"]
ghci> [x | x <-[1..15], x/=7, odd x, x/=5]
[1,3,9,11,13,15]
ghci> [x*y | x <-[1,2,3], y <-[4,5,6]]
[4,5,6,8,10,12,12,15,18]
ghci> [x*y | x <-[1,2,3], y <-[4,5,6], x*y >10]
[12,12,15,18]

-- _ means we don't care what we'll draw 
-- from the list anyway, so instead of 
-- writing a variable name that we are not 
-- going to use, we just write _
ghci> let length' xs = sum [1 | _ <- xs]
ghci> length' ['a'..'z']
26
ghci> let removeNonUpperCase st = [c | c <- st, 
c `elem` ['A'..'Z']]
ghci> removeNonUpperCase "IdontLIKEFROGS"
"ILIKEFROGS"

ghci> --nested comprehensions--

ghci> let xxs = [[1,2,3,4],[11,12,13,14],
[101,102,103,104]]
ghci> [ [x | x <- xs , even x] | xs <- xxs]
[[2,4],[12,14],[102,104]]

--tuples--
-- ex (5,'x') (5,6,"ab"), ('a',[2,3]) etc
ghci> fst (4,5)
4
ghci> snd (4,5)
5
ghci> snd ("wow", 6)
6
ghci> fst ("wow", 6)
"wow"
ghci> zip [1,2,3,4] ["one","two", "three", "four"]
[(1,"one"),(2,"two"),(3,"three"),(4,"four")]

ghci> zip [1..]["apple","orange","grape","melon"]
[(1,"apple"),(2,"orange"),(3,"grape"),(4,"melon")]
ghci> 
ghci> let rightTrianglesWithPerimeter24 = [(a,b,c) | 
a <- [1..10],b <- [1..10], c <- [1..10], a+b+c==24, 
a^2+b^2==c^2]
ghci> rightTrianglesWithPerimeter24 
[(6,8,10),(8,6,10)]
ghci> --if side c is hypotenuse--
ghci> let rightTrianglesWithPerimeter24' = [(a,b,c) | 
a <- [1..b],b <- [1..c], c <- [1..10], a+b+c==24, 
a^2+b^2==c^2]

<interactive>:155:70: Not in scope: ‘c’
ghci> let rightTrianglesWithPerimeter24' = [(a,b,c) | 
c <- [1..10],b <- [1..c], a <- [1..b], a+b+c==24, 
a^2+b^2==c^2]
ghci> rightTrianglesWithPerimeter24'
[(6,8,10)]
ghci> 


-- TYPES AND TYPE CLASSES
-- Haskell has a static type: The type of every
-- expression is known at the compile time
-- Haskell has type inference.
-- if we write a number, we don't have to tell
-- haskell that it is a number, haskell can infer
-- that on its own.

-- Type is a label every expression has. It tells
-- in which cateogry of things that expression fits.
-- :t tells the type in ghci

ghci> :t True
True :: Bool
ghci> :t 5
5 :: Num a => a
ghci> :t 5.6
5.6 :: Fractional a => a
ghci> :t "hello"
"hello" :: [Char]
ghci> :t "a"
"a" :: [Char]
ghci> :t 'z'
'z' :: Char
ghci> :t (True,'a',800)
(True,'a',800) :: Num t => (Bool, Char, t)
ghci> 
ghci> :t rightTrianglesWithPerimeter24
rightTrianglesWithPerimeter24
  :: (Num t, Eq t, Enum t) => [(t, t, t)]

--baby.hs--
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

ghci> :r
ghci> addThree  4 5 6
15
ghci> :t addThree 
addThree :: Int -> Int -> Int -> Int

--types start with Capital letter
--Int for integers. bounded.
--Integer for integers, unbounded.
--Float - real values with single precision
--Double - real values with double precision
--Bool - boolean
--Char - character
-- () empty tuple

ghci> :t head
head :: [a] -> a

-- type a? not a type, no capital letter
--a is type variable, meaning it can be any type
-- Functions that has type variables are 
-- polymorphic functions.


-- TYPE CLASSES--
-- type class is like interface that defines
-- some behaviour.
-- if a type is part of a type class, then it
-- supports and implements that behaviour.

-- ==, + ,- ,* etc are all functions
-- if a function has only special chars, then
-- it is an infix function by default.
-- if we want to examine its type, or pass it 
-- as argument to another func or call it as
-- as a prefix function, surround it in paranthesis
ghci> :t (==)
(==) :: Eq a => a -> a -> Bool

-- every thing before ' => ' is class constraint.
-- read as: equality func takes two values of same
-- type and returns a Bool type.
-- The type of those two values must be memeber
-- of Eq class
-- Eq typeclass provies an interface for testing
-- equality
-- Ord is for types that have an ordering
-- To be a memeber of Ord, a type must be a 
-- member of Eq

ghci> :t LT
LT :: Ordering
ghci> :t GT
GT :: Ordering
ghci> :t EQ
EQ :: Ordering
ghci> 
-- Ordering is a type

-- Show is a type of show typeclass
-- its members  are shown as strings
ghci> show 3
"3"
ghci> :t show
show :: Show a => a -> String
ghci> show True
"True"
ghci> 

--Read is opposite to Show

ghci> read "5.3"
*** Exception: Prelude.read: no parse
ghci> read "5"
*** Exception: Prelude.read: no parse
ghci> read "5" ::Int
5
ghci> read "5" :: Float
5.0
ghci> read "(3,True)" :: (Int, Bool)
(3,True)
ghci> 

-- Enum members are sequentially ordered types
-- they can be enumerated
-- succ, pred funcs 
-- types in this class: (),Bool, Char, Int,
-- Integer, Float, Double, Ordering.
ghci> [LT .. GT]
[LT,EQ,GT]
ghci> 

--Bounded members have an upper and lower bound.
ghci> minBound :: Int
-9223372036854775808
ghci> maxBound :: Int
9223372036854775807
ghci> 

-- Num is a numberic typeclass
-- types in it are Int, Integer, Float, Double
--Integral sub typeclass has Int and Integer types
--Floating sub typeclass has Float and Double
ghci> :t fromIntegral 
fromIntegral :: (Num b, Integral a) => a -> b
ghci> 



--=============================================
--SYNTAX IN FUNCTIONS

--PATTERN MATCHING
--When defining functions, you can define 
--separate function bodies for different patterns
--You can pattern match on any data type — 
--numbers, characters, lists, tuples, etc.

lucky :: (Integral a) => a -> String
lucky 7 = "Lucky number seven"
lucky x = "Lucky number is not seven"

ghci> lucky 7
"Lucky number seven"
ghci> lucky 8
"Lucky number is not seven"
ghci> 


factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial x = x * factorial (x-1)

ghci> factorial  0
1
ghci> factorial  5
120

--Pattern matching can also fail. 
--If we define a function like this:
charName :: Char -> String 
charName 'a' = "At"
charName 'b' = "Bat"
charName 'c' = "Cat"

ghci> charName 'a'
"At"
ghci> charName 'h'
"*** Exception: baby.hs:(22,1)-(24,20): 
Non-exhaustive patterns in function charName


--When making patterns, we should always 
--include a catch-all pattern so that our program 
--doesn't crash if we get some unexpected input. 

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)  
addVectors a b = (fst a + fst b, snd a + snd b)

--Let's modify the function so that it uses 
--pattern matching.

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)  
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

--you can also pattern match in list comprehensions
ghci> let xs = [(1,3),(4,3),(2,4),(5,3),(5,6),(3,1)]  
ghci> [a+b | (a,b) <- xs]  
[4,7,6,8,11,4]

--Lists themselves can also be used in pattern 
--matching. You can match with the empty list [] 
--or any pattern that involves : and the empty 
--list. But since [1,2,3] is just syntactic sugar 
--for 1:2:3:[], you can also use the former 
--pattern. A pattern like x:xs will bind the head 
--of the list to x and the rest of it to xs, even 
--if there's only one element so xs ends up being 
--an empty list.
--Note: The x:xs pattern is used a lot, especially 
--with recursive functions. But patterns that 
--have : in them only match against lists of 
--length 1 or more.

--If you want to bind, say, the first three 
--elements to variables and the rest of the 
--list to another variable, you can use something 
--like x:y:z:zs. It will only match against lists 
--that have three elements or more.

head' :: [a] -> a
head' [] = error "empty list, no head"
head' (x:_) = x

ghci> head' []
*** Exception: empty list, no head
ghci> head' [1]
1
ghci> head' [2,4,5,6]
2
ghci> head' "hello"
'h'

tell :: (Show a) => [a] -> String  
tell [] = "The list is empty"  
tell (x:[]) = "The list has one element: " 
	++ show x  
tell (x:y:[]) = "The list has two elements: " 
	++ show x ++ " and " ++ show y  
tell (x:y:_) = "This list is long. The first" 
	++ "two elements are: " ++ show x ++ 
	" and " ++ show y

--length using pattern matching
length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

--sum using pattern matching
sum' :: (Num a) => [a] -> a
sum' [] = 0;
sum' (x:xs) = x + sum' xs

--There's also a thing called as patterns.
--You do that by putting a name and 
--an @ in front of a pattern.
-- xs@(x:y:ys) This pattern will match 
--exactly the same thing as x:y:ys but you 
--can easily get the whole list via xs 
--instead of repeating yourself by typing 
--out x:y:ys in the function body again

capital :: String -> String  
capital "" = "Empty string, whoops!"  
capital all@(x:xs) = "The first letter of " 
++ all ++ " is " ++ [x]  

ghci> capital "Dracula"  
"The first letter of Dracula is D"  

{-Whereas patterns are a way of making sure 
a value conforms to some form and deconstructing 
it, guards are a way of testing whether some 
property of a value (or several of them) are 
true or false. That sounds a lot like an if 
statement and it's very similar. The thing is 
that guards are a lot more readable when you 
have several conditions and they play really 
nicely with patterns.-}

bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
  | bmi <= 18.5 = "underweight"
  | bmi <= 25.0 = "normal"
  | bmi <= 35.0 = "over weight"
  | otherwise = "You are a whale!"

ghci> bmiTell 35
"over weight"
ghci> bmiTell 38
"You are a whale!"
ghci> bmiTell 17.9
"underweight"
ghci> 

--Guards are indicated by pipes that follow 
--a function's name and its parameters
--A guard is basically a boolean expression. 
--If it evaluates to True, then the corresponding 
--function body is used. If it evaluates to False, 
--checking drops through to the next guard and so on
--otherwise is defined simply as 
--otherwise = True and catches everything

{-If all the guards of a function evaluate to 
False (and we haven't provided an otherwise 
catch-all guard), evaluation falls through to 
the next pattern. That's how patterns and guards 
play nicely together. If no suitable guards or 
patterns are found, an error is thrown.-}

bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
  | weight/height^2 <= 18.5 = "underweight"
  | weight/height^2 <= 25.0 = "normal"
  | weight/height^2 <= 35.0 = "over weight"
  | otherwise = "You are a whale!"

--Note that there's no = right after the function 
--name and its parameters, before the first guard.

max' :: (Ord a) => a -> a -> a  
max' a b  
	| a > b     = a  
    | otherwise = b 


max' :: (Ord a) => a -> a -> a 
max' a b | a > b = a | otherwise = b  

--where
bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
  | bmi <= 18.5 = "underweight"
  | bmi <= 25.0 = "normal"
  | bmi <= 35.0 = "over weight"
  | otherwise = "You are a whale!"
  where bmi = weight / height^2

--We put the keyword where after the guards 
--(usually it's best to indent it as much as the 
--pipes are indented) and then we define several 
--names or functions. These names are visible 
--across the guards and give us the advantage 
--of not having to repeat ourselves.

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

ghci> bmiTell 144 6
"underweight"

--where bindings aren't shared across function 
--bodies of different patterns. If you want 
--several patterns of one function to access 
--some shared name, you have to define it globally.

--Just like we've defined constants in where 
--blocks, you can also define functions

calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
calcBmis xs = [bmi w h | (w, h) <- xs]  
    where 
    	bmi weight height = weight / height ^ 2  

--where bindings can also be nested.


{-Very similar to where bindings are let bindings. 
Where bindings are a syntactic construct that 
let you bind to variables at the end of a function 
and the whole function can see them, including all 
the guards. Let bindings let you bind to variables 
anywhere and are expressions themselves, but are 
very local, so they don't span across guards. Just 
like any construct in Haskell that is used to bind 
values to names, let bindings can be used for 
pattern matching.

The form is let <bindings> in <expression>. 
The names that you define in the let part are 
accessible to the expression after the in part. 

The difference is that let bindings are expressions 
themselves. where bindings are just syntactic 
constructs
-}

cylinder :: (RealFloat a) => a -> a -> a
cylinder r h = 
  let 
    sideArea = 2 * pi * r * h
    topArea =  pi * r^2
  in sideArea + 2 * topArea

ghci> cylinder  4 5
226.1946710584651

ghci> 4 * (let a = 9 in a+1) + 2
42

ghci> [let sq x = x * x in (sq 5 , sq 6 ,sq 7)]
[(25,36,49)]

ghci> (let a = 100; b = 200; c = 300 in a*b*c, 
	let foo="Hey "; bar = "there!" in foo ++ bar)  
(6000000,"Hey there!") 

--you can pattern match with let bindings.
ghci> (let (a,b,c) = (1,2,3) in a+b+c) * 100  
600
--You can also put let bindings inside list 
--comprehensions.
calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
calcBmis xs = [bmi | (w, h) <- xs, 
	let bmi = w / h ^ 2, bmi >= 25.0] 

--Case expressions
--pattern matching on parameters in function 
--definitions! Well, that's actually just 
--syntactic sugar for case expressions. These 
--two pieces of code do the same thing and 
--are interchangeable:

head' :: [a] -> a  
head' [] = error "No head for empty lists!"  
head' (x:_) = x  

head' :: [a] -> a
head' xs =  case xs of [] -> error "No head"
						(x:_) -> x

case expression of pattern -> result
					pattern -> result
					pattern -> result
					...
					...

--Whereas pattern matching on function parameters 
--can only be done when defining functions, case 
--expressions can be used pretty much anywhere. 
--For instance:
describeList :: [a] -> String  
describeList xs = "The list is " 
	++ case xs of [] -> "empty."  
                  [x] -> "a singleton list."   
                  xs -> "a longer list."  

--They are useful for pattern matching against 
--something in the middle of an expression. 
--Because pattern matching in function definitions 
--is syntactic sugar for case expressions, we 
--could have also defined this like so:
describeList :: [a] -> String  
describeList xs = "The list is " ++ what xs  
    where what [] = "empty."  
          what [x] = "a singleton list."  
          what xs = "a longer list."  


--RECURSION
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "Empty list"
maximum' [x] = x
maximum' (x:xs)
  | x > maximumOfTail = x
  | otherwise = maximumOfTail
  where maximumOfTail = maximum' xs

ghci> maximum' [3,6,9,2,7]
9
ghci> maximum' []
*** Exception: Empty list
ghci> maximum' [4]
4
ghci> maximum' ['a','t','m']
't'




replicate' :: (Num a, Ord a) => a -> b -> [b]
replicate' n x
  | n < 0 = []
  | otherwise = x:replicate' (n-1) x

ghci> replicate' 5 9
[9,9,9,9,9,9]
ghci> replicate' 5 a

<interactive>:82:14: Not in scope: ‘a’
ghci> replicate' 5 'a'
"aaaaaa"

{-Note: Num is not a subclass of Ord. 
That means that what constitutes for a 
number doesn't really have to adhere to 
an ordering. So that's why we have to 
specify both the Num and Ord class 
constraints when doing addition or 
subtraction and also comparison.-}


reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

ghci> reverse' []
[]
ghci> reverse' [1]
[1]
ghci> reverse' [1,2]
[2,1]

ghci> take' 4 ['a'..'z']
"abcd"
ghci> take' 4 ['a'..'z']
"abcd"

zip' :: [a] -> [b] -> [(a,b)]  
zip' _ [] = []  
zip' [] _ = []  
zip' (x:xs) (y:ys) = (x,y):zip' xs ys  

--quick sort

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort [x] = [x]
quicksort (x:xs) = 
  let smallersorted = quicksort [y | y <- xs, y <= x]
      biggerSorted = quicksort [y | y <- xs, y > x]
  in smallersorted ++ [x] ++ biggerSorted


--HIGHER ORDER FUNCTIONS
--haskell functions can take functions
-- as parameters and return functions as
-- return values
-- A function that does either of those
-- is a higher order function

--CURRIED FUNCTIONS
-- every haskell function takes only
-- one parameter.

ghci> max 4 5
5
ghci> (max 4) 5
5

-- both are equivalent
-- currying
-- putting space between two things is simply
-- function application. space has highes 
-- precedence
max :: (Ord a) => a -> a -> a
max :: (Ord a) => a -> (a -> a)
--read as max takes a and returns a (partially 
--applied)function that takes an a and return an a
ghci> let multTwoWithNine = multThree 9  
ghci> multTwoWithNine 2 3  
54  
ghci> let multWithEighteen = multTwoWithNine 2  
ghci> multWithEighteen 10  
180  

compareWithHundred :: (Num a, Ord a) => a -> Ordering  
compareWithHundred = compare 100  

divideByTen :: (Floating a) => a -> a  
divideByTen = (/10)

--Some higher-orderism is in order
--Functions can take functions as parameters and 
--also return functions. To illustrate this, 
--we're going to make a function that takes a 
--function and then applies it twice to something!

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

ghci> applyTwice  (+5) 4
14

--Maps and Filters
-- map takes a function and a list and applies
-- the function to every element of the list
ghci> map (*3) [3,4]
[9,12]
ghci> map (subtract 3) [5..9] 
[2,3,4,5,6]
ghci> 

--filter is a function that takes a predicate 
--(a predicate is a function that tells whether 
--something is true or not, so in our case, a 
--function that returns a boolean value) and a 
--list and then returns the list of elements 
--that satisfy the predicate.

ghci> filter (==3) [1,2,3,4,5]
[3]
ghci> filter (>=3) [1,2,3,4,5]
[3,4,5]
ghci> filter odd [1..10]
[1,3,5,7,9]

ghci> takeWhile  (/=' ') "elephants know how to party"
"elephants"
--Once an element is found for which the predicate 
--doesn't hold, it stops


--Lambdas are basically anonymous functions that are 
--used because we need some functions only once
ghci> map (\ (a,b) -> a+b)[(1,2),(4,5),(6,3)]
[3,9,9]
ghci> map (\ x -> x+3 )[1..5] 
[4,5,6,7,8]
ghci> map (\ (x) -> x+3 )[1..5] 
[4,5,6,7,8]
ghci> let addThree' = \x -> \y -> \z -> x + y + z
ghci> addThree' 5 6 7
18
ghci> 
ghci> foldl (+) 0 [1..5]
15
ghci> foldl (+) 3 [1..5]
18
ghci> foldl (*) 3 [1..5]
360
ghci> 
--A fold takes a binary function, a starting 
--value (I like to call it the accumulator) 
--and a list to fold up
ghci> foldr subtract  4 [3..6]
-14
ghci> foldl1 (+) [1..5] -- no starting value
15
ghci> foldr1 (+) [1..5]
15

maximum' :: (Ord a) => [a] -> a  
maximum' = 
	foldr1 (\x acc -> if x > acc then x else acc)  
      
reverse' :: [a] -> [a]  
reverse' = foldl (\acc x -> x : acc) []  
      
product' :: (Num a) => [a] -> a  
product' = foldr1 (*)  
      
filter' :: (a -> Bool) -> [a] -> [a]  
filter' p = 
	foldr (\x acc -> if p x then x : acc else acc) []  
      
head' :: [a] -> a  
head' = foldr1 (\x _ -> x)  
      
last' :: [a] -> a  
last' = foldl1 (\_ x -> x)  

--scanl and scanr are like foldl and foldr, only 
--they report all the intermediate accumulator 
--states in the form of a list. There are also 
--scanl1 and scanr1, which are analogous to 
--foldl1 and foldr1.
ghci> scanl (+) 0 [3..7]
[0,3,7,12,18,25]
ghci> scanr (+) 0 [3..7]
[25,22,18,13,7,0]
ghci> scanl1 (*)  [3..7]
[3,12,60,360,2520]
ghci> scanr1 (*)  [3..7]
[2520,840,210,42,7]

--How many elements does it take for the sum of 
--the squares of all natural numbers to exceed 
--10000? 

ghci> length (takeWhile (\x -> x<= 10000) 
	(scanl1 (+) (map (\x -> x^2)[1..])) )
30
ghci> length (takeWhile (<= 10000) 
	(scanl1 (+) (map (^2)[1..])) )
30
ghci>


--$ function, also called function application
--the $ function has the lowest precedence. 
--Function application with a space is 
--left-associative (so f a b c is the same 
--as ((f a) b) c)), function application with $ 
--is right-associative.

($) :: (a -> b) -> a -> b  
f $ x = f x 

--sqrt ( 2+3+4) is same as sqrt $ 2 + 3 + 4

--Function composition--
--We do function composition with the . function
(.) :: (b -> c) -> (a -> b) -> a -> c  
f . g = \x -> f (g x) 

--The expression negate . (* 3) returns a function 
--that takes a number, multiplies it by 3 and 
--then negates it.
ghci> let negate' = negate . (* 3) 
ghci> negate' 5
-15
ghci> (negate . (* 3)) 5
-15

fn x = ceiling (negate (tan (cos (max 50 x))))
fn = ceiling . negate . tan . cos . max 50

oddSquareSum :: Integer  
oddSquareSum = sum . takeWhile (<10000) . 
    	filter odd . map (^2) $ [1..]  


--module : collection of functions, types and 
--typeclasses. main module loads other modules.
-- default module is Prelude module.
ghci> import Data.List

ghci> :m + Data.List --gchi
ghci> :m + Data.List Data.Map Data.Set --milti imports 
import Data.List (nub, sort) -- only nub, sort
import Data.List hiding (nub) -- except nub 
import qualified Data.Map -- filter from this module
-- can be accessed  as Data.Map.filter.
import qualified Data.Map as M
-- M.filter

ghci> nub [2,4,3,4,2,6]
[2,4,3,6]
ghci> intersperse '.' "MONKEY"
"M.O.N.K.E.Y"
ghci> intercalate " " ["hey", "there", "guys"]
"hey there guys"
ghci> transpose[[1,2,3],[4,5,6],[7,8,9]]
[[1,4,7],[2,5,8],[3,6,9]]
ghci> foldl' [1..5]
ghci> foldl' (+) 0  [1..5] -- non lazy--
15
ghci> foldl1' ( + )  [1..5] -- non lazy--
15
ghci> concat ["foo","bar","car"]
"foobarcar"
ghci> concat [[1,2,3],[2,3,4],[5,6]]
[1,2,3,2,3,4,5,6]

ghci> concatMap (replicate 4) [1..3]
[1,1,1,1,2,2,2,2,3,3,3,3]

--and, or takes a list of boolean values
ghci> and $ map (>4) [5..9]
True
ghci> and $ map (>4) [4,5..9]
False
ghci> or $ map (>4) [1..4]
False
--any and all take a predicate and then check
ghci> any (==4) [1..9]
True
ghci> all (>4) [5..10]
True
ghci> take 10 $ iterate (*2) 1
[1,2,4,8,16,32,64,128,256,512]
ghci> take 3 $ iterate (++ "ha") "ha"
["ha","haha","hahaha"]
ghci> splitAt 3 "Hello"
("Hel","lo")
ghci> splitAt 100 "Hello"
("Hello","")
ghci> splitAt (-3) "Hello"
("","Hello")
ghci> let (a,b) = splitAt 3 "foobar" in b ++ a
"barfoo"
ghci> takeWhile (>3) [6,5,4,3,2,1,2,3,4,5,6,7]
[6,5,4]
ghci> takeWhile (/=' ') "Elephants are cool"
"Elephants"
ghci> dropWhile (/=' ') "Elephants are cool"
" are cool"
ghci> break (==4) [1..7]
([1,2,3],[4,5,6,7])
ghci> span (/=4) [1..7]
([1,2,3],[4,5,6,7])
ghci> sort [4,2,0,9,4,1,5,3]
[0,1,2,3,4,4,5,9]
--group takes a list and groups adjacent elements 
--into sublists if they are equal.
ghci> group [1,2,4,4,9,8,2,8,1,5,2,3]
[[1],[2],[4,4],[9],[8],[2],[8],[1],[5],[2],[3]]
ghci> group [1,2,4,4,9,8,8,4,4,4,9,9,1,1,3]
[[1],[2],[4,4],[9],[8,8],[4,4,4],[9,9],[1,1],[3]]
ghci> inits "w00t"  
["","w","w0","w00","w00t"]  
ghci> tails "w00t"  
["w00t","00t","0t","t",""] 
ghci> "cat" `isInfixOf` "A cat in the room"
True
ghci> "cat" `isPrefixOf` "Cat is dangerous"
False
ghci> "cat" `isSuffixOf` "Rat and a cat"
True
ghci> "cat" `isPrefixOf` "cat is dangerous"
True
ghci> 'c' `elem` "cat"
True
ghci> 'd' `notElem` "cat"
True
ghci> partition (>3) [1,4,7,2,1,6,3,9]
([4,7,6,9],[1,2,1,3])
ghci> span (>3) [1,4,7,2,1,6,3,9]
([],[1,4,7,2,1,6,3,9])
ghci> span (>3) [5,4,7,2,1,6,3,9]
([5,4,7],[2,1,6,3,9])
ghci> partition (>3) [5,4,7,2,1,6,3,9]
([5,4,7,6,9],[2,1,3])
ghci> find (>4) [1,2,3,4,5,6,7]
Just 5
ghci> find (>9) [1,2,3,4,5,6,7]
Nothing
--Maybe value can either be Just 
--something or Nothing.
ghci> elemIndex 4 [1,2,3,4,5,6]
Just 3
ghci> elemIndex 10 [1,2,3,4,5,6]
Nothing
ghci> elemIndices 4 [1,2,3,4,5,6,4,3,2,1]
[3,6]
ghci> elemIndices 10 [1,2,3,4,5,6,4,3,2,1]
[]
ghci> findIndex  (==4) [1,2,3,4,5,6,5,4,3,2,1]
Just 3
ghci> findIndices  (==4) [1,2,3,4,5,6,5,4,3,2,1]
[3,7]
ghci> zip3 [1,2] [3,4,5] [6,7,8]
[(1,3,6),(2,4,7)]
ghci> zip3 [1,2,9] [3,4,5] [6,7,8] --sameline--
[(1,3,6),(2,4,7),(9,5,8)]
ghci> zipWith3 (\x y z -> x+y+z) --sameline--
	[1,2,9] [3,4,5] [6,7,8]
[10,13,22]
ghci> zipWith3 (\x y z -> 2*x+y+z) --sameline--
	[1,2,9] [3,4,5] [6,7,8]
[11,15,31]
ghci> zipWith3 (\x y z -> 2*(x+y+z)) 
	[1,2,9] [3,4,5] [6,7,8]
[20,26,44]
ghci> lines "first line\nsecond line\nthirdline"
["first line","second line","thirdline"]
ghci> unlines $ lines --sameline-
	"first line\nsecond line\nthirdline"
"first line\nsecond line\nthirdline\n"
ghci> words "India is my country"
["India","is","my","country"]
ghci> unwords ["India","is","my","country"]
"India is my country"
ghci> nub [1,2,3,4,5,3,2,1,4,3,5]
[1,2,3,4,5]
ghci> delete 1 [1,2,3,4,1,2,3,4,5]
[2,3,4,1,2,3,4,5]
ghci> -- \\ list difference function--
ghci> [1..10] \\ [3..5]
[1,2,6,7,8,9,10]
ghci> [1..10] \\ [-3,-2..5]
[6,7,8,9,10]
ghci> union [1..5] [3..7]
[1,2,3,4,5,6,7]
ghci> intersect [1..5] [3..7]
[3,4,5]
ghci> insert 4 [3,5,1,2,6,7]
[3,4,5,1,2,6,7]
ghci> insert 4 [1,1,2,3,4,4,5,6]
[1,1,2,3,4,4,4,5,6]

--(==) `on` (> 0) returns an equality function 
--that looks like \x y -> (x > 0) == (y > 0)
-- compare `on` length  is the equivalent 
-- of \x y -> length x `compare` length y

--Data.Char exports a bunch of predicates 
-- over characters

ghci> isControl 'a'
False
ghci> isSpace ' '
True
ghci> isLower 'a'
True
ghci> isUpper 'A'
True
ghci> isAlpha '9'
False
ghci> isAlpha 'a'
True
ghci> isDigit '9'
True
ghci> isDigit 'a'
False
ghci> isOctDigit '9'
False
ghci> isOctDigit '8'
False
ghci> isOctDigit '7'
True
ghci> isAlphaNum '9'
True
ghci> isPrint '*'
True
ghci> isLetter 'i'
True
ghci> isMark '`'
False
ghci> isMark '~'
False
ghci> isNumber '5'
True
ghci> isPunctuation ','
True
ghci> isSymbol '$'
True
ghci> isSeparator ' '
True
ghci> isAscii 'a'
True
ghci> isAsciiUpper 'A'
True
ghci> isAsciiLower 'A'
False
ghci> all isAlphaNum "mission25"
True
ghci> all isNumber "345a"
False
ghci> import Data.Function
ghci> groupBy ((==) `on` isSpace ) "Hey guys its me"
["Hey"," ","guys"," ","its"," ","me"]
ghci> map generalCategory " \tnA9?|"
[Space,Control,LowercaseLetter,UppercaseLetter,
DecimalNumber,OtherPunctuation,MathSymbol]

ghci> map  toUpper "Hello World!"
"HELLO WORLD!"
ghci> map toLower "Hello World!"
"hello world!"
ghci> map toTitle "Hello World!"
"HELLO WORLD!"
ghci> map digitToInt "234513"
[2,3,4,5,1,3]
ghci> map digitToInt "FA3B"
[15,10,3,11]
ghci>  intToDigit 4
'4'
ghci>  intToDigit 15
'f'
ghci> Map.empty 
fromList []
ghci> Map.insert 3 100 Map.empty 
fromList [(3,100)]

ghci> Map.insert 5 500 . Map.insert 3 100 $ Map.empty 
fromList [(3,100),(5,500)]
ghci> Map.null Map.empty
True
ghci> Map.si
Map.singleton  Map.size
ghci> Map.size $ Map.fromList [(2,4),(3,6),(4,8)]
3
ghci> Map.singleton 3 9
fromList [(3,9)]
ghci> Map.lookup 2 $ Map.fromList[(2,4),(3,6)]
Just 4
ghci> Map.member 2 $ Map.fromList[(2,4),(3,6)]
True
ghci> Map.map (*2) $ Map.fromList[(2,4),(3,6)]
fromList [(2,8),(3,12)]
ghci> Map.filter (==2) $ Map.fromList[(2,4),(3,6)]
fromList []
ghci> Map.filter (==6) $ Map.fromList[(2,4),(3,6)]
fromList [(3,6)]
ghci> Map.keys $ Map.fromList[(2,4),(3,6)]
[2,3]
ghci> Map.elems $ Map.fromList[(2,4),(3,6)]
[4,6]
ghci> Map.lookup 2  $ Map.fromList[(2,4),(3,6)]
Just 4
ghci> Map.fromListWith max [(2,4),(2,8),(3,9)]
fromList [(2,8),(3,9)]


--Set--
ghci> import qualified Data.Set as Set
ghci> Set.fromList "The mountain water"
fromList " Taehimnortuw"

ghci> let set1 = Set.fromList "The mountain water"
ghci> let set2 = Set.fromList "The spring water"

ghci> set1
fromList " Taehimnortuw"
ghci> set2
fromList " Taeghinprstw"
ghci> Set.intersection set1 set2
fromList " Taehinrtw"
ghci> Set.difference set1 set2
fromList "mou"
ghci> Set.difference  set2 set1
fromList "gps"
ghci> Set.union set1 set2
fromList " Taeghimnoprstuw"
ghci> Set.null Set.empty 
True
ghci> Set.null $ Set.fromList [1,2,3,4,3,2]
False
ghci> Set.size $ Set.fromList [1,2,3,4,3,2]
4
ghci> Set.singleton 9
fromList [9]
ghci> Set.insert 5 $ Set.fromList [1,2,3,4,3,2]
fromList [1,2,3,4,5]
ghci> Set.delete 5 $ Set.fromList [1,2,3,4,3,2]
fromList [1,2,3,4]
ghci> Set.fromList [2,3,4] `Set.isSubsetOf` 
	Set.fromList [1,2,3,4,5] 
True
ghci> Set.fromList [2,3,4] `Set.isProperSubsetOf` 
	Set.fromList [1,2,3,4,5]
True
ghci> Set.fromList [2,3,4,6] `Set.isSubsetOf` 
	Set.fromList [1,2,3,4,5]
False
ghci> Set.filter odd $ Set.fromList [1,2,3,4,5,6,7]
fromList [1,3,5,7]
ghci> Set.map (+3)  $ Set.fromList [1,2,3,4,5,6,7]
fromList [4,5,6,7,8,9,10]

module Geometry
(sphereVolume,
sphereArea,
cubeVolume,
cubeArea
) where

sphereVolume :: Float -> Float
sphereVolume radius = (4.0/3.0) * pi * (radius^3)

sphereArea :: Float -> Float
sphereArea radius = 4.0 * pi * (radius^2)

cubeArea :: Float -> Float
cubeArea side = 6 * (side^2)

cubeVolume :: Float -> Float
cubeVolume side = cuboidVolume side side side

-- not exported -- private 
cuboidVolume :: Float -> Float -> Float ->Float
cuboidVolume l w h = l*w*h

ghci> cubeArea 4
96.0

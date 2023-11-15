module FizzBuzz where

isDivisibleBy x = (==) 0 . (flip mod) x
isFizzy = isDivisibleBy 3
isBuzzy = isDivisibleBy 5

fizzify x = 
    (if isFizzy x then "Fizz" else "") ++
    (if isBuzzy x then "Buzz" else "") ++
    (if not (isFizzy x || isBuzzy x) then show x else "")

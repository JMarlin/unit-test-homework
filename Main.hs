module Main where

import qualified FizzBuzz (fizzify)

printAllFizzyBuzzers [] = return ()

printAllFizzyBuzzers (x:xs) = do
    putStrLn $ FizzBuzz.fizzify x
    printAllFizzyBuzzers xs

main :: IO ()
main = do
    printAllFizzyBuzzers [1..100]

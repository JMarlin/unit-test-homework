module Main where

import qualified FizzBuzz (isFizzy, isBuzzy, fizzify)
import Test.HUnit
import qualified System.Exit as Exit
 
--test cases
tests = TestList [

    TestLabel "Five is fizzy" TestCase ( 
        assertBool "isFizzy 5 should be true" (FizzBuzz.isFizzy 5) ) ,

    TestLabel "Three is buzzy" TestCase ( 
        assertBool "isBuzzy 3 should be true" (FizzBuzz.isBuzzy 3) ) ]
 
main :: IO ()
main = do
    result <- runTestTT tests
    if failures result > 0 then Exit.exitFailure else Exit.exitSuccess

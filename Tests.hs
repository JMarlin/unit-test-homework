module Main where

import qualified FizzBuzz (isFizzy, isBuzzy, fizzify)
import Test.HUnit
import qualified System.Exit as Exit


--test cases
tests = TestList [

    --logic tests
    TestLabel "Five is buzzy"  (TestCase (
        assertBool "isBuzzy 5 should be true" (FizzBuzz.isBuzzy 5)))                         ,

    TestLabel "Three is fizzy" (TestCase (
        assertBool "isFizzy 3 should be true" (FizzBuzz.isFizzy 3)))                         ,

    TestLabel "Fifteen is fizzy and buzzy" (TestCase (
        assertBool "(isFizzy 15) && (isBuzzy 15) should be true" (
            (FizzBuzz.isFizzy 15) && (FizzBuzz.isBuzzy 15) ) ))                              ,

    TestLabel "Seven is neither fizzy nor buzzy" (TestCase (
        assertBool "not ((isFizzy 7) || (isBuzzy 7)) should be true" (
            not ((FizzBuzz.isFizzy 7) || (FizzBuzz.isBuzzy 7)) ) ))                          ,

    --transformation tests
    TestLabel "Five buzzes" (TestCase (
        assertEqual "fizzify 5 should output 'Buzz'" "Buzz" (FizzBuzz.fizzify 5)))           ,

    TestLabel "Three fizzes" (TestCase (
        assertEqual "fizzify 3 should output 'Fizz'" "Fizz" (FizzBuzz.fizzify 3)))           ,

    TestLabel "Fifteen fizzbuzzes" (TestCase (
        assertEqual "fizzify 15 should output 'FizzBuzz'" "FizzBuzz" (FizzBuzz.fizzify 15))) ,

     TestLabel "Seven remains unchanged" (TestCase (
        assertEqual "fizzify 7 should output '7'" "7" (FizzBuzz.fizzify 7)))                 ]


--test infrastructure
main :: IO ()
main = do
    result <- runTestTT tests
    if failures result > 0 then Exit.exitFailure else Exit.exitSuccess

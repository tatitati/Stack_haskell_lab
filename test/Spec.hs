{-# LANGUAGE OverloadedStrings #-}

import Test.Hspec
import Control.Exception (evaluate)
import Data.List.Split
import System.Info
import qualified Data.ByteString.Lazy.Char8 as L8
import           Network.HTTP.Simple

main :: IO ()
main = hspec $ do

  describe "functions" $ do
    it "can create a function" $ do
--       removewhatever :: [Char] -> [Char]
--       removeNonUppercase input = [c | c <- input, c `elem` ['A'..'Z']]
--
--       let r = removewhatever ['A', 'a']
--       putStrLn r


  describe "for comprehensions" $ do
    it "can create one for{}" $ do
--           let result = [x*2 | x <- [1..10]]
--           putStrLn result

  describe "init, last, head, tail, ranges" $ do
    it "can get head" $ do
          let mylist = [1, 2, 3, 4, 9, 10, 11]
          let myrange = [1..20]
          head mylist `shouldBe` 1
          init mylist `shouldBe` [1, 2, 3, 4, 9, 10]
          length myrange `shouldBe` 20

  describe "Prelude.read" $ do
    it "can concat two lists" $ do
        let lists = [1, 2, 3, 4] ++ [9,10, 11]
        lists `shouldBe` [1, 2, 3, 4, 9, 10, 11]

    it "can concat two strings" $ do
        let text = "hello" ++ "world"
        text `shouldBe` "helloworld"

    it "can parse integers" $ do
      read "10" `shouldBe` (10 :: Int)

    it "can parse floating-point numbers" $ do
      read "2.5" `shouldBe` (2.5 :: Float)

    it "can read and parse a file" $ do
      list <- readFile("src/table.txt")
      putStrLn list
      print $ splitOn "|" list

--    it "can request http" $ do
--      response <- httpLBS "http://elpais.com"
--
--      putStrLn $ "The status code was: " ++
--                 show (getResponseStatusCode response)
--      print $ getResponseHeader "Content-Type" response
--      L8.putStrLn $ getResponseBody response

    it "can get info about the system" $ do
      os `shouldBe` ("darwin" :: String)
      print os
      print arch
      print compilerName
      print compilerVersion

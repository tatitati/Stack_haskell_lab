{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE BlockArguments #-}

import Test.Hspec
import Control.Exception (evaluate)
import Data.List.Split
import System.Info
import qualified Data.ByteString.Lazy.Char8 as L8
import           Network.HTTP.Simple{-# LANGUAGE BlockArguments #-}
import MyTypes

main :: IO ()
main = hspec $ do

  describe "functions" $ do
    it "can create a function" $ do
--       let mysum :: Int -> Int  =====> this is not polymorphic, so in the test we wouldn't need to assert the type
      let mysum :: (Num a) => a -> a
          mysum x = x + 1

      mysum 5 `shouldBe` (6 :: Int)
      mysum 5 `shouldBe` 6

    it "can create a Person using different syntaxes" $ do
      let personRecordSyntax = Person {firstname="francisco", lastname="something", age=23}       
      let personInstanceType = Person2 "francisco" "someting" 23

      putStrLn $ show personRecordSyntax -- Person {firstname = "francisco", lastname = "something", age = 23}
      putStrLn $ show personInstanceType -- Person2 "francisco" "someting" 23


--  describe "for comprehensions" $ do
--    it "can create one for{}" $ do
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
      list <- readFile("src/table.txt") -- List : IO[String]
      

      putStrLn list      
      print $ splitOn "|" list

    -- it "can request http" $ do
    --   response <- httpLBS "http://elpais.com"

    --   putStrLn $ "The status code was: " ++
    --               show (getResponseStatusCode response)
    --   print $ getResponseHeader "Content-Type" response
    --   L8.putStrLn $ getResponseBody response

    it "Maybe is the Option in scala" $ do
      let b = Just "whatever"

      let res = case b of
              Just val -> "There is a value, and it is " ++ (show val)
              Nothing  -> "There is nothing!"

      res `shouldBe` "There is a value, and it is \"whatever\""
      
    it "can get info about the system" $ do
      os `shouldBe` ("darwin" :: String)
      -- These variables access to the system, but why they return String instead of IO String?
      -- the reason is because these values are hardcoded in the compiler when this is installed
      print os                -- :: String
      print arch              -- :: String
      print compilerName      -- :: String
      print compilerVersion   -- :: String

    it "type synonimous/alias" $ do
      let information = "something" :: Surname

      information `shouldBe` ("something" :: Surname)
      information `shouldBe` ("something" :: String)

      

{-# LANGUAGE OverloadedStrings #-}

import Test.Hspec
import Control.Exception (evaluate)
import Data.List.Split
import System.Info
import qualified Data.ByteString.Lazy.Char8 as L8
import           Network.HTTP.Simple

main :: IO ()
main = hspec $ do
  describe "Prelude.read" $ do
    it "can parse integers" $ do
      read "10" `shouldBe` (10 :: Int)

    it "can parse floating-point numbers" $ do
      read "2.5" `shouldBe` (2.5 :: Float)

    it "can read and parse a file" $ do
      list <- readFile("src/table.txt")
      putStrLn list
      print $ splitOn "|" list

    it "can request http" $ do
      response <- httpLBS "http://elpais.com"

      putStrLn $ "The status code was: " ++
                 show (getResponseStatusCode response)
      print $ getResponseHeader "Content-Type" response
      L8.putStrLn $ getResponseBody response

    it "can get info about the system" $ do
      os `shouldBe` ("darwin" :: String)
      print os
      print arch
      print compilerName
      print compilerVersion

module Main where

{-# LANGUAGE OverloadedStrings #-}
import qualified Data.ByteString.Lazy.Char8 as L8
import           Network.HTTP.Simple
import Data.List.Split

main :: IO ()
--main = do
--    response <- httpLBS "http://httpbin.org/get"
--
--    putStrLn $ "The status code was: " ++
--               show (getResponseStatusCode response)
--    print $ getResponseHeader "Content-Type" response
--    L8.putStrLn $ getResponseBody response
main = do
    list <- readFile("src/table.txt")
    putStrLn list
    print $ splitOn "|" list
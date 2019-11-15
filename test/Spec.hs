import Test.Hspec
import Control.Exception (evaluate)
import Data.List.Split

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

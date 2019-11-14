import Test.HUnit

main :: IO ()
main = putStrLn "Test suite not yet implemented"

foo :: Int -> (Int, Int)
foo x = (1, x)

test1 = TestCase (assertEqual "for (foo 3)," (1,2) (foo 3))

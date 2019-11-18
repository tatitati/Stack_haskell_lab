module MyTypes where
    data Person  = Person {
        firstname :: String,
        lastname :: String,
        age :: Int
    } deriving (Show)

    data Person2 = Person2 String String Int deriving (Show)


    

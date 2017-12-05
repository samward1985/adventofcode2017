checksum :: (Num a, Ord a) => [[a]] -> a
checksum = sum . map (\row -> maximum row - minimum row)

main = do
    input <- readFile "resources/day02.txt"
    let nums = map (map read . words) . lines $ input
    let result = checksum nums
    putStrLn $ show result

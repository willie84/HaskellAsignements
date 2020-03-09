
halve :: [a] -> ([a],[a])
halve (x:xs) = (take n (x:xs), drop n (x:xs))
              where
              n=length(x:xs) `div` 2

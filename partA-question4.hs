
--conditional
safetail :: [a] -> [a]

safetail (x:xs)=if (null (x:xs)) then [] else xs

--guarded equation

safetail xs | null xs = []
            | otherwise = tail xs

--pattern matching

safeTail [] = Nothing
safeTail (x:xs) = Just xs

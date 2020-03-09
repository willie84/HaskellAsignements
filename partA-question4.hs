
--conditional
safetail :: [a] -> [a]

safetail (x:xs)=if (null (x:xs)) then [] else xs

--guarded equation

safetail (x:xs) | null (x:xs) = []
                | otherwise = xs

--pattern matching

safetail []=[]

safetail xs= tail xs

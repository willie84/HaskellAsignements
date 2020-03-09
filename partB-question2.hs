module partB-question2 where
delete::Int -> [ Int ] ->[ Int ]
delete c [] =[]
delete n (x:xs)= if n==x
              then xs
              else [x]++ delete n xs

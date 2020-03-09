
delete::Int -> [ Int ] ->[ Int ]
delete c [] =[]
delete n (x:xs)= if n==x
              then xs
              else [x]++ delete n xs
              
perms :: [ Int ] -> [ [ Int ] ]


perms [] = [[]]
perms [n] = [[n]]

perms xs = [i:j| i<-xs, j<- perms (delete  i xs)]

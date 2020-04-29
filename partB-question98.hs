delete::Int -> [ Int ] ->[ Int ]
delete c [] =[]
delete n (x:xs)= if n==x
              then xs
              else [x]++ delete n xs

perms::[ Int ] -> [[ Int ]]
perms []=[[]]
perms xs=[a:j |a <-xs,j<-perms(delete a xs)]

module PartB_question4 where

split::[ Int ]->[([Int], [Int])]

cutTo2 :: Int-> [Int] ->[([Int],[Int])]

cutTo2 1 (x:xs)=[([x],xs)]
cutTo2 n xs=cutTo2 (n-1) xs ++[(take n xs,drop n xs)]

split []=[]
split xs=cutTo2 (length xs -1) xs

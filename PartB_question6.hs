module PartB_question6 where
import PartB_question5
import PartB_question1
import PartB_question3

solve :: [Int] -> Int -> [Expr]
solve ns n =[e | nsf <- perms ns, e <- exprs nsf, eval e == n]

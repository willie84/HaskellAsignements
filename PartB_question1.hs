module PartB_question1 where

data Op = Add | Mul deriving (Show)
data Expr = Val Int | App Op Expr Expr deriving (Show)

eval :: Expr -> Int
values :: Expr -> [ Int ]

apply Add a b = a + b
apply Mul a b = a*b
eval (Val x) = x
eval (App ops left right) = apply ops (eval left) (eval right)

values (Val x) = [x]
values (App _ l r) = values l ++ values r

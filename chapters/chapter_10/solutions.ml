type rect = Rectangle of int * int | Square of int

let area (r: rect) = match r with
  | Square n -> n * n
  | Rectangle(l, w) -> l * w

let rotate (r: rect) = match r with
  | Rectangle(l, w) when w > l -> Rectangle(w,l)
  | x -> x

let compare (r1: rect) (r2: rect) = match (r1,r2) with
  | (Rectangle(_, w1), Rectangle(_, w2)) -> w1-w2
  | (Rectangle(_, w1), Square(w2)) -> w1-w2
  | (Square(w1), Square(w2)) -> w1-w2
  | (Square(w1), Rectangle(_, w2)) -> w1-w2

let smallestWidthSorted (l: rect list) = 
  List.sort compare (List.map rotate l)

type 'a sequence = Nil | Cons of 'a * 'a sequence 

let rec take (n: int) (l: 'a sequence) = 
  if (n <= 0) then Nil 
  else
    match l with 
    | Nil -> Nil 
    | Cons(h, xs) -> Cons (h, take (n-1) xs)

let rec drop(n: int) (l: 'a sequence) =
  if (n <= 0) then l
  else
    match l with
    | Nil -> Nil
    | Cons(h, xs) -> drop (n-1) xs

let rec map ~f (l: 'a sequence) =
  match l with
  | Nil -> Nil
  | Cons(h, xs) -> Cons(f h, map f xs)

type expr =
  | Num of int
  | Add of expr * expr
  | Subtract of expr * expr
  | Multiply of expr * expr
  | Divide of expr * expr
  | Power of expr * expr

let int_exp x y = (float_of_int x) ** (float_of_int y) |> int_of_float

let rec evaluate e =
  match e with
  | Num x -> x
  | Add (e, e') -> evaluate e + evaluate e'
  | Subtract (e, e') -> evaluate e - evaluate e'
  | Multiply (e, e') -> evaluate e * evaluate e'
  | Divide (e, e') -> evaluate e / evaluate e'
  | Power (e, e') -> int_exp (evaluate e) (evaluate e')

let safe_evaluate e = try Some(evaluate e) with Division_by_zero -> None
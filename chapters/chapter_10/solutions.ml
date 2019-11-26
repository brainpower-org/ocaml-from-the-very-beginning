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
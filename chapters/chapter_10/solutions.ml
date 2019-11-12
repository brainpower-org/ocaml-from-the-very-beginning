type rect = Rectangle of int * int | Square of int

let area (r: rect) = match r with
  | Square n -> n * n
  | Rectangle(l, w) -> l * w
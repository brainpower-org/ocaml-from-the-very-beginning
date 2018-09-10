let rec take n l = match n with
  | 0 -> []
  | _ -> match l with
    | [] -> []
    | h::t -> h :: take (n - 1) t;;

let rec drop n l = match n with
  | 0 -> l
  | _ -> match l with
    | [] -> []
    | h::t -> drop (n - 1) t;;

let rec length l =
  let rec inner_length l n =
    match l with
    | [] -> n
    | h :: t -> inner_length t n + 1 in
  inner_length l 0;;

let split l = 
  let halflen = length l / 2 in
  ( take halflen l, drop halflen l );;

let rec map f l = match l with (* (a -> 'b) -> 'a list -> 'b list *) 
  | [] -> []
  | h::t -> f h :: map f t;;

let evens = map (fun x -> x mod 2 = 0);;

let doubles = map (fun x -> x * 2);;

let halves = map (fun x -> x / 2);;

let rec merge cmp x y = match x, y with
  | [], l -> l
  | l, [] -> l
  | hx::tx, hy::ty -> if cmp hx hy
    then hx :: merge cmp tx (hy :: ty)
    else hy :: merge cmp (hx :: tx) ty;;

let rec msort cmp l = match l with
  | [] -> []
  | [x] -> [x]
  | _ -> let (left, right) = split l in
    merge cmp (msort cmp left) (msort cmp right);;

let rec calm = function
    | [] -> []
    | h::t -> (if h = '!' then '.' else h) :: calm t;;
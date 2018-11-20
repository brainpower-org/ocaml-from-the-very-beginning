let rec insert x l = (* 'a -> 'a list -> 'a list *)
    match l with
    | [] -> [x]
    | h::t -> 
        if x <= h
            then x :: h :: t
            else h :: insert x t;;

let rec sort = function (* 'a list -> 'a list *)
    | [] -> []
    | h::t -> insert h (sort t);;


let rec merge x y = match x, y with (* 'a list -> 'a list -> 'a list *)
    | [], l -> l
    | l, [] -> l
    | hx::tx, hy::ty ->
        if hx < hy
            then hx :: merge tx y
            else hy :: merge x ty;;

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

let split l = 
    let half = List.length l / 2 in
    let left = take half l in
    let right = drop half l in
    (left, right);;

let rec msort = function
    | [] -> []
    | [x] -> [x]
    | l -> match split l with
        | (left, right) -> merge (msort left) (msort right);;

(* 1 - Avoid calculating List.length l / 2 twice: Assign result to half binding *)
(* 2 - The second parameter for take and drop is calculated from actual list length, thus may never be too big *)
let split l = 
    let half = List.length l / 2 in
    let left = take half l in
    let right = drop half l in
    (left, right);;

(* 3 - Write an inverted insertion sort *)
let rec isort = function (* 'a list -> 'a list *)
    | [] -> []
    | h::t -> insert h (isort t);;

(* 4 - Write an inverted insertion sort *)
let rec eql a b = match a, b with
    | [], [] -> true
    | _, [] -> false
    | [], _ -> false
    | ah::at, bh::bt -> ah = bh && eql at bt;;

let sorted l = eql l (isort l);;

(* 6 - combine insert and isort into one function *)
let rec insert x l =
  match l with
  | [] -> [x] 
  | h::t -> 
    if x <= h
      then x :: h :: t
      else h :: insert x t

(* Exercise 6.4: α list -> β list *)
let rec insertion_sort = function
    | [] -> []
    | h::t -> insert h (insertion_sort t)
open Base

let rec double = function
  | [] -> []
  | h::t ->  (h * 2) :: double t 

let rec evens = function 
  | [] -> []
  | h::t -> (h % 2 = 0) :: evens t

(* f:('a -> 'a) -> 'a list -> 'a list  *)
let rec map ~f = function  
  | [] -> []
  | h::t -> f h :: map ~f:f t

let map_double = map ~f:(fun i -> i * 2)

let map_evens = map ~f:(fun i -> i % 2 = 0)

let base_double = List.map ~f:(fun i -> i * 2)

 (* char list -> char list *)
let rec calm = function
  | [] -> []
  | '!'::t ->  '.' :: calm t
  | h::t -> h :: calm t

let calm2 l = match l with 
  | [] -> []
  | '!'::t ->  '.' :: calm t
  | h::t -> h :: calm t

(* char list -> char list *)
let calm_map = map ~f:( function 
  | '!' -> '.' 
  | h -> h )

(* ( 'a -> 'a ) -> 'a list -> 'a list*)
let calm_mappable f = map ~f:f 

(* int -> int *)
let clip = function 
  | x when x > 10 -> 10
  | x when x < 1 -> 1
  | x -> x

(* Exercise 6.2:  int list -> int list*)
let clip_list = List.map ~f:clip

(* Exercise 6.3: int list -> int list*)
let anon_clip_list = List.map ~f:(function 
  | x when x > 10 -> 10
  | x when x < 1 -> 1
  | x -> x)

(* Exercise 6.4: (α -> β) -> int -> α -> β *)
let rec apply f count arg = 
  match count with
    | 1 -> f arg
    | n -> apply f (n - 1) (f arg) 

(* For the lazy: https://ocaml.janestreet.com/ocaml-core/v0.9/doc/base/Base/Fn/index.html
let apply f n = Fn.apply_n_times ~n:n f *)

(* Exercise 6.5: ~f:(α -> α -> int) -> α -> α list -> α list *)

(* 6.5. Modify the insertion sort function from the preceding 
chapter to take a comparison function, in the same way that 
we modified merge sort in this chapter. What is its type? *)
let rec insert ~f x l =
  match l with
  | [] -> [x] 
  | h::t -> 
    if (f x h) < 0
      then x :: h :: t
      else h :: insert ~f x t

(* Exercise 6.5: ~f:(α -> α -> int) -> α list -> α list *)
let rec insertion_sort ~f l = 
    match l with
    | [] -> []
    | h::t -> insert ~f h (insertion_sort ~f t)

(* Exercise 6.6: Write a function filter which takes a function of type α → bool and
an α list and returns a list of just those elements of the argument list
for which the given function returns true. *)
let rec filter ~f l =
  match l with
  | [] -> []
  | h::t -> match(f h) with
      | true -> h :: filter ~f t 
      | false -> filter ~f t

(* Exercise 6.7: Write the function for_all which, given a function of type α → bool and an argument list of type
α list evaluates to true if and only if the function returns true for every element of the list. Give
examples of its use. *)
(* ~f:(a -> bool) -> a list -> bool *)
let rec for_all ~f l = 
  match l with 
  | [] -> true
  | h::t -> match (f h) with
      | true -> for_all ~f t
      | _ -> false

(* a -> a -> (a -> bool) *)
let flip_compare ~f x y = f y x 

let flip_compare2 ~f x = fun y -> f y x

(* 8. Write a function mapl which maps a function of type α → β over a list of type α list list to produce
a list of type β list list. *)
(* ~f:(a -> b) -> a list list -> b list list *)
let mapl ~f l =
  let rec aux ~f m = 
    match m with
  | [] -> []
  | h::t -> List.map f h :: aux ~f t
  in aux ~f l


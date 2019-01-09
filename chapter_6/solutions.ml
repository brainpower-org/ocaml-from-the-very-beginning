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

let rec calm2 l = match l with 
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
let rec insert ~f x l =
  match l with
  | [] -> [x] 
  | h::t -> 
    if (f x h) < 0
      then x :: h :: t
      else h :: insert ~f x t

(* Exercise 6.5: ~f:(α -> α -> int) -> α list -> α list *)
(* let rec insertion_sort ~f l = 
    | [] -> []
    | h::t -> insert ~f h (insertion_sort t) *)

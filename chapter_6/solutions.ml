open Base

let rec double = function
  | [] -> []
  | h::t ->  (h * 2) :: double t 

let rec evens = function 
  | [] -> []
  | h::t -> (h % 2 = 0) :: evens t

(* ( 'a -> 'a ) -> 'a list -> 'a list  *)
let rec map f = function  
  | [] -> []
  | h::t -> f h :: map f t

let map_double = map (fun i -> i * 2)

let map_evens = map (fun i -> i % 2 = 0)

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
let calm_map = map( function 
  | '!' -> '.' 
  | h -> h )

(* ( 'a -> 'a ) -> 'a list -> 'a list*)
let calm_mappable f = map f 

(* int -> int *)
let clip = function 
  | x when x > 10 -> 10
  | x when x < 1 -> 1
  | x -> x

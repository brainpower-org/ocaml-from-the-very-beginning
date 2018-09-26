open Base

let rec double = function
  | [] -> []
  | h::t ->  (h * 2) :: double t 

let rec evens = function 
  | [] -> []
  | h::t -> (h % 2 = 0) :: evens t

let rec map f = function  
  | [] -> []
  | h::t -> f h :: map f t

let map_double = map (fun i -> i * 2)

let map_evens = map (fun i -> i % 2 = 0)

let base_double = List.map ~f:(fun i -> i * 2)

let calm l = l (* TODO implement function *)

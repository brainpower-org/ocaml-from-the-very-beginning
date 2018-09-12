let rec double = function
  | [] -> []
  | h::t ->  (h * 2) :: double t 

let rec evens = function 
  | [] -> []
  | h::t -> (h mod 2 = 0) :: evens t

let rec map f = function  
| [] -> []
| h::t -> f h :: map f t
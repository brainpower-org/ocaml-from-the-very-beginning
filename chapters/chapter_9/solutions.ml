open List

let rec member n l = match l with (* 'a -> 'a list -> bool *)
  | [] -> false
  | h::t -> if h = n then true else member n t;;


(* Question 2: write member_all with partially applied member function*)

let member_all x l = 
  match l with 
  | [] -> false
  | l ->
    let rec member_all p r l = match l with
      | [] -> r
      | h::t -> member_all p (r && p h) t
    in member_all (member x) true l  


(*map: (a->b) -> [a] -> [b]*)

(* element_division: int -> int -> int *)
let element_division r d = d / r

(* division1: int -> int list -> int list *)
let division1 r l = map ((fun r d -> d / r) r) l

(* division: int -> int list -> int list *)
let division r l = map ((fun r' -> fun d -> d / r') r) l

(* mapll: a' list list list -> (a' -> b') -> b' list list list *)
let mapll lll f = map (map (map f)) lll

let truncate ~lim ll =
  let rec aux counter il ~ol =
    if counter = 0
    then ol
    else match il with
      | [] -> ol
      | h::t -> aux (counter-1) t ~ol: (ol@[h])
  in map(aux lim ~ol:[]) ll

(* truncate_replace: int list list -> int -> int list *)
let truncate_replace ~replace ll =
  let aux = function
    | [] -> replace
    | h::_ -> h
  in map (aux truncate ~lim:2) ll;;

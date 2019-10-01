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


let flip fn = fun a b -> fn b a

(*map: (a->b) -> [a] -> [b]*)
let element_division = flip (/)

(* element_division: int -> int -> int *)
let element_division r d = d / r

(* division1: int -> int list -> int list *)
let division1 r l = map ((fun r d -> d / r) r) l

(* division: int -> int list -> int list *)
let division r l = map ((fun r' -> fun d -> d / r') r) l

(* mapll: a' list list list -> (a' -> b') -> b' list list list *)
let mapll lll f = map (map (map f)) lll

let division2 r = map (flip (/) r)

let maplll (lll: 'a list list list) ~(f: 'a -> 'b): 'b list list list =
  map (fun ll -> map (map f) ll ) lll

let truncate ~(lim: int) (ll: 'a list list): 'b list list =
  let rec aux (counter: int) (il: 'a list) ~(ol: 'b list): 'b list =
    if counter = 0
    then ol
    else match il with
    | [] -> ol
    | h::t -> aux (counter-1) t (ol@h)
  in map(aux lim ~ol:[]) ll

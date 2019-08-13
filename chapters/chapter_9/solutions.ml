
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

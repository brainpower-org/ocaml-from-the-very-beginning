(*1*)
let rec evens = function (* a' list -> a' list *)
  | _::a::t -> a :: evens t
  | _ -> [];;

(*2: Function which counts the number of true elements in a list *)
let rec count_true = function (* bool list -> int *)
  | [] -> 0
  | h::t -> count_true t + (match h with true -> 1 | _ -> 0);;

let rec count_true_tail l s = match l with
  | [] -> s
  | h::t -> count_true_tail t s + (match h with true -> 1 | _ -> 0);;

(*3: Function which checks if a list is a palindrome *)
let is_palindrome l = List.rev l = l;; (* 'a list -> bool *)

(*3: Function which returns a palindrome of a list*)
let palindrome l = (* 'a list -> 'a list *)
  if is_palindrome l then l 
  else l @ List.rev l;;

(* 4: Function which returns all but the last item *)
let rec drop_last = function (* 'a list -> 'a list *)
  | [] -> []
  | [_] -> []
  | h::t -> h :: drop_last t;;

let rec drop_last_tail l a = match l with (* 'a list -> a' list *)
  | [] -> a
  | [_] -> a
  | h::t -> h :: drop_last_tail t a;;

(* 5 *)
let rec member n l = match l with (* 'a -> 'a list -> bool *)
  | [] -> false
  | h::t -> if h = n then true else member n t;;

(* 6: Given a list, return set of unique items *)
let rec make_set l a = match l with (* 'a list -> 'a list *)
    | [] -> a
    | h::t -> make_set t (if member h a then a else a @ [h]);;

(* 7: Explain efficiency of naive rev implemtation, provide tail recursion implemtation *)

(* 7: Given a naive rev implementation we can deduce complexity of On2,
   as we have to *append* for every item, which itself is complexity On *)
let rec rev_append l = match l with
    | [] -> []
    | h::t -> rev_append t @ [h];;

(* 7: Given a tail recursive implementation we can deduce complexity of On *)
let rec rev l a = match l with
    | [] -> a
    | h::t -> rev t (h :: a)
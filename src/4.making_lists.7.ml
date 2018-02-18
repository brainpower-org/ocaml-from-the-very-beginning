(* Explain efficiency of naive rev implemtation, provide tail recursion implemtation *)

(* Given a naive rev implementation we can deduce complexity of On2,
   as we have to *append* for every item, which itself is complexity On *)
let rec rev l = match l with
    | [] -> []
    | h::t -> rev t @ [h];;

(* Given a tail recursive implementation we can deduce complexity of On *)
let rec rev l a = match l with
    | [] -> a
    | h::t -> rev t (h :: a)

let format_list l fn = Printf.sprintf "[%s]" (String.concat "; " (List.map fn l));;
let format_int_list l = format_list l string_of_int;;

Printf.printf "rev [1; 2; 3]: %s\n" (format_int_list (rev [1; 2; 3] []));;
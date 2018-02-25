#use "format.ml";;

let rec doubles = function (*int list -> int list*)
    | [] -> []
    | h::t -> h * 2 :: doubles t;;

let rec map f l = match l with (* (a -> 'b) -> 'a list -> 'b list *) 
    | [] -> []
    | h::t -> f h :: map f t;;

let is_even x = x mod 2 = 0;; (*int -> bool*)

let halve x = x / 2;;

let double x = x * 2;;

let evens = map is_even;;

let doubles = map double;;

Printf.printf "%s\n" (format_int_list (doubles [1; 2; 3]));;
Printf.printf "%s\n" (format_bool_list (evens [1; 2; 3]));;
Printf.printf "%s\n" (format_int_list (map halve [1; 2; 3]));;
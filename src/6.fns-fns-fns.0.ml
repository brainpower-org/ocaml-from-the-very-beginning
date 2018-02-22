#use "format.ml";;

let rec double = function (*int list -> int list*)
    | [] -> []
    | h::t -> h * 2 :: double t;;

let rec even = function (*int list -> bool list*)
    | [] -> []
    | h::t -> (h mod 2 = 0) :: even t;;

Printf.printf "%s\n" (format_int_list (double [1; 2; 3]));;
Printf.printf "%s\n" (format_bool_list (even [1; 2; 3]));;

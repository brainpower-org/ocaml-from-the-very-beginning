#use "format.ml";;

let rec double = function (*int list -> int list*)
    | [] -> []
    | h::t -> h * 2 :: double t;;

Printf.printf "%s\n" (format_int_list (double [1; 2; 3]));;
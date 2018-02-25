#use "format.ml";;

let rec map f l = match l with (* (a -> 'b) -> 'a list -> 'b list *) 
    | [] -> []
    | h::t -> f h :: map f t;;

let evens = map (fun x -> x mod 2 = 0);;

let doubles = map (fun x -> x * 2);;

let halves = map (fun x -> x / 2);;

Printf.printf "%s\n" (format_int_list (doubles [1; 2; 3]));;
Printf.printf "%s\n" (format_bool_list (evens [1; 2; 3]));;
Printf.printf "%s\n" (format_int_list (halves [1; 2; 3]));;
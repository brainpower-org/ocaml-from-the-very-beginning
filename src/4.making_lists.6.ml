let rec member n l = match l with (* 'a -> 'a list -> bool *)
    | [] -> false
    | h::t -> if h = n then true else member n t;;

(* Given a list, return set of unique items *)
let rec make_set l a = match l with (* 'a list -> 'a list *)
    | [] -> a
    | h::t -> make_set t (if member h a then a else a @ [h]);;

let format_list l fn = Printf.sprintf "[%s]" (String.concat "; " (List.map fn l));;

Printf.printf "make_set [1; 2; 3; 3; 1]:\n";;
Printf.printf "%s\n" (format_list (make_set [1; 2; 3; 3; 1] []) string_of_int);;

let rec member n l = match l with (* 'a -> 'a list -> bool *)
    | [] -> false
    | h::t -> if h = n then true else member n t;;

Printf.printf "member 2 [1; 2; 3]: %b\n" (member 2 [1; 2; 3]);;
Printf.printf "member 3 [1; 2]: %b\n" (member 3 [1; 2]);;

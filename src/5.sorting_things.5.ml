(* explain sorting of lists *)
let rec insert x l = (* 'a -> 'a list -> 'a list *)
    match l with
    | [] -> [x]
    | h::t -> 
        if x <= h
            then x :: h :: t
            else h :: insert x t;;

let rec isort = function (* 'a list -> 'a list *)
    | [] -> []
    | h::t -> insert h (isort t);;

let format_list l fn = Printf.sprintf "[%s]" (String.concat "; " (List.map fn l));;
let format_char_list l = format_list l (Printf.sprintf "%c");;

let input = [['o'; 'n'; 'e']; ['t'; 'w'; 'o']; ['t'; 'h'; 'r'; 'e'; 'e']] in
(* 
    expected: one, three, two
    OCaml performes a comparison for each item with decreasing priority,
    so the necessary steps for the result sorting are:
    o < ( t = t ) -> one, two, three
    w > h -> one, three, two
*)
Printf.printf "%s\n" (format_list (isort input) format_char_list);; 
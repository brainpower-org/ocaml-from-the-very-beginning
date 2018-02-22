(* combine insert and isort into one function *)

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

let rec sort = function
    | [] -> []
    | ah::at ->
        match at with
        | [] -> [ah]
        | bh::bt -> 
            if ah <= bh
                then ah :: bh :: sort bt
                else sort(bh :: sort (bt @ [ah]));;


let format_list l fn = Printf.sprintf "[%s]" (String.concat "; " (List.map fn l));;
let format_int_list l = format_list l (Printf.sprintf "%d");;

Printf.printf "isort [53; 9; 2; 6; 19]: %s\n" (format_int_list (isort [53; 9; 5; 4; 3; 2; 6; 19]));;
Printf.printf "sort [53; 9; 2; 6; 19]: %s\n" (format_int_list (sort [53; 9; 5; 4; 3; 2; 6; 19]));;

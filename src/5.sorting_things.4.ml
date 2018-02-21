(* write an inverted insertion sort *)

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

let rec eql a b = match a, b with
    | [], [] -> true
    | _, [] -> false
    | [], _ -> false
    | ah::at, bh::bt -> ah = bh && eql at bt;;

let sorted l = eql l (isort l);;

Printf.printf "sorted [53; 9; 2; 6; 19]: %b\n" (sorted [53; 9; 2; 6; 19]);;
Printf.printf "sorted [2; 6; 9; 19; 53]: %b\n" (sorted [2; 6; 9; 19; 53]);;

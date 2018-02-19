let rec insert x l = (* 'a -> 'a list -> 'a list *)
    match l with
    | [] -> [x]
    | h::t -> 
        if x <= h
            then x :: h :: t
            else h :: insert x t;;

let rec sort = function (* 'a list -> 'a list *)
    | [] -> []
    | h::t -> insert h (sort t);;

let format_list l fn = Printf.sprintf "[%s]" (String.concat "; " (List.map fn l));;
let format_int_list l = format_list l string_of_int;;

Printf.printf "sort [53; 9; 2; 6; 19]: %s\n" (format_int_list (sort [53; 9; 2; 6; 19]));;
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
let format_char_list l = format_list l (Printf.sprintf "%c");;

Printf.printf "sort [53; 9; 2; 6; 19]: %s\n" (format_int_list (sort [53; 9; 2; 6; 19]));;
Printf.printf "sort ['p'; 'i'; 'm'; 'c'; 's'; 'h']: %s\n" (format_char_list (sort ['p'; 'i'; 'm'; 'c'; 's'; 'h']));;

let rec merge x y = match x, y with (* 'a list -> 'a list -> 'a list *)
    | [], l -> l
    | l, [] -> l
    | hx::tx, hy::ty ->
        if hx < hy
            then hx :: merge tx y
            else hy :: merge x ty;;

let rec take n l = match n with
    | 0 -> []
    | _ -> match l with
        | [] -> []
        | h::t -> h :: take (n - 1) t;;

let rec drop n l = match n with
    | 0 -> l
    | _ -> match l with
        | [] -> []
        | h::t -> drop (n - 1) t;;

let split l = 
    let half = List.length l / 2 in
    let left = take half l in
    let right = drop half l in
    (left, right);;

let rec msort = function
    | [] -> []
    | [x] -> [x]
    | l -> match split l with
        | (left, right) -> merge (msort left) (msort right);;

Printf.printf "merge [9; 53] [2; 6; 19]: %s\n" (format_int_list (merge [9; 53] [2; 6; 19]));;
Printf.printf "msort [9; 53; 2; 6; 19]: %s\n" (format_int_list (msort [9; 53; 2; 6; 19]));;

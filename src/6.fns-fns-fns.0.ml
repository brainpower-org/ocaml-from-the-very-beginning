#use "format.ml";;
#use "sort.ml";;

let rec map f l = match l with (* (a -> 'b) -> 'a list -> 'b list *) 
    | [] -> []
    | h::t -> f h :: map f t;;

let evens = map (fun x -> x mod 2 = 0);;

let doubles = map (fun x -> x * 2);;

let halves = map (fun x -> x / 2);;

Printf.printf "%s\n" (format_int_list (doubles [1; 2; 3]));;
Printf.printf "%s\n" (format_bool_list (evens [1; 2; 3]));;
Printf.printf "%s\n" (format_int_list (halves [1; 2; 3]));;

let rec merge cmp x y = match x, y with
    | [], l -> l
    | l, [] -> l
    | hx::tx, hy::ty -> if cmp hx hy
        then hx :: merge cmp tx (hy :: ty)
        else hy :: merge cmp (hx :: tx) ty;;

let rec msort cmp l = match l with
    | [] -> []
    | [x] -> [x]
    | _ -> let (left, right) = split l in
        merge cmp (msort cmp left) (msort cmp right);;

Printf.printf "%s\n" (format_int_list (msort ( <= ) [1; 2; 3]));;
Printf.printf "%s\n" (format_int_list (msort ( >= ) [1; 2; 3]));;

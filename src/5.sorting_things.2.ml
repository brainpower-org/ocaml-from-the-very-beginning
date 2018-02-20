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

(* 5.2 - The second parameter for take and drop is calculated from actual list length, thus may never be to big *)
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


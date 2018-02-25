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
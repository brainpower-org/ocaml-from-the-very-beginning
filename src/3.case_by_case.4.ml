(* Comment on readability vs non-pattern matching implementations *)
(* not: if variant terser and more readable *)
let not a = match a with (* bool -> bool *)
    | false -> true
    | true -> false;;

let not a = if a then true else false;;

(* nsum: equivalent readabilty. easier to handle negative numbers via if variant *)
let rec nsum n = match n with (* int -> int *)
    | 0 -> 0
    | 1 -> 1
    | _ -> nsum (n - 1) + n;;

let rec nsum n = (* int -> int *)
    if n <= 0 then 0 
    else if n = 1 then 1 
    else nsum (n - 1) + n;;

(* exp: pattern matching variant more readable *)
let rec exp x n = match n with (* int -> int *)
    | 0 -> 1
    | 1 -> x
    | _ -> x * exp x (n - 1);;

let rec exp x n = (* int -> int *)
    if n = 0 then 1
    else if n = 1 then x
    else x * exp x (n - 1);;

let not a = match a with (* bool -> bool *)
    | false -> true
    | true -> false;;

(* recursive function which, given a positive integer returns the sum of all integers from 1 to n *)
let rec nsum n = match n with (*int -> int*)
    | 0 -> 0
    | 1 -> 1
    | _ -> nsum (n - 1) + n;;

(* Function which, given two numbers x and n, computes x^n *)
let rec exp x n = match n with (* int -> int *)
    | 0 -> 1
    | 1 -> x
    | _ -> x * exp x (n - 1);;

(* Comment on readability vs non-pattern matching implementations *)
(* not: if variant terser and more readable *)
(* nsum: equivalent readabilty. easier to handle negative numbers via if variant *)
(* exp: pattern matching variant more readable *)

let islower = function (* char -> bool *)
    | 'a'..'z' -> true
    | _ -> false;;

let isupper = function (* char -> bool *)
    | 'A' .. 'Z' -> true
    | _ -> false;;
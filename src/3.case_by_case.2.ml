(* recursive function which, given a positive integer returns the sum of all integers from 1 to n *)
let rec nsum n = match n with (*int -> int*)
    | 0 -> 0
    | 1 -> 1
    | _ -> nsum (n - 1) + n;;

Printf.printf "%d\n" (nsum 10);;
Printf.printf "%d\n" (nsum 0);;

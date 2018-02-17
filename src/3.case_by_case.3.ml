(* Function which, given two numbers x and n, computes x^n *)
let rec exp x n = match n with (* int -> int *)
    | 0 -> 1
    | 1 -> x
    | _ -> x * exp x (n - 1);;

Printf.printf "%d\n" (exp 2 2);;
Printf.printf "%d\n" (exp 2 0);;
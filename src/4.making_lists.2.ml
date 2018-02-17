(* Function which counts the number of true elements in a list *)

let rec count_true = function (* bool list -> int *)
    | [] -> 0
    | h::t -> count_true t + (match h with true -> 1 | _ -> 0);;

let rec count_true_tail l s = match l with
    | [] -> s
    | h::t -> count_true_tail t s + (match h with true -> 1 | _ -> 0);;


Printf.printf "count_true [true; false; true]: %d\n" (count_true [true; false; true]);; (* 2 *)
Printf.printf "count_true_tail [true; false; true]: %d\n" (count_true_tail [true; false; true] 0);; (* 2 *)

Printf.printf "count_true []: %d\n" (count_true []);; (* 0 *)
Printf.printf "count_true_tail []: %d\n" (count_true_tail [] 0);; (* 0 *)
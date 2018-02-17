let not a = if a then false else true;; (* bool -> bool *)
let islower = function (* char -> bool *)
    | 'a'..'z' -> true
    | _ -> false;;

let isupper = function (* char -> bool *)
    | 'A' .. 'Z' -> true
    | _ -> false;;

Printf.printf "islower %c: %b\n" 'a' (islower 'a');; (* true *)
Printf.printf "isupper %c: %b\n" 'a' (isupper 'a');; (* false *)

Printf.printf "islower %c: %b\n" 'A' (islower 'A');; (* false *)
Printf.printf "isupper %c: %b\n" 'A' (isupper 'A');; (* true *)

Printf.printf "islower %c: %b\n" '?' (islower '?');; (* false *)
Printf.printf "isupper %c: %b\n" '!' (isupper '!');; (* false *)

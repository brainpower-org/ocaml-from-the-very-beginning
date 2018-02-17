let not a = match a with (* bool -> bool *)
    | false -> true
    | true -> false;;

Printf.printf "%b\n" (not true);;
Printf.printf "%b\n" (not false);;

(* This expression has type string but an expression was expected of type bool *)
(* not "something";; *)
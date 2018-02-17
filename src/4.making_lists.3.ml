(* Function which checks if a list is a palindrome *)
let is_palindrome l = List.rev l = l;; (* 'a list -> bool *)

(* Function which returns a palindrome of a list*)
let palindrome l = (* 'a list -> 'a list *)
    if is_palindrome l then l 
    else l @ List.rev l;;

let print_item i = Printf.printf "%d; " i;;
let print_list l = List.iter print_item l;;

Printf.printf "is_palindrome [1; 2; 3] %b\n" (is_palindrome [1; 2; 3]);; (* false *)
Printf.printf "is_palindrome [1; 2; 2; 1] %b\n" (is_palindrome [1; 2; 2; 1]);; (* true *)
Printf.printf "is_palindrome [] %b\n" (is_palindrome []);; (* true *)
Printf.printf "is_palindrome [1] %b\n" (is_palindrome [1]);; (* true *)

print_list (palindrome []);; (**)
print_list (palindrome [1]);; (*1;*)
print_list (palindrome [1; 2]);; (*1; 2; 2; 1;*)


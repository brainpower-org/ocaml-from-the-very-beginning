(* Function which returns all but the last item *)
let rec drop_last = function (* 'a list -> 'a list *)
    | [] -> []
    | [t] -> []
    | h::t -> h :: drop_last t;;

let rec drop_last_tail l a = match l with (* 'a list -> a' list *)
    | [] -> a
    | [t] -> a
    | h::t -> h :: drop_last_tail t a;;

let print_item i = Printf.printf "%d; " i;;
let print_list l = List.iter print_item l;;

print_list (drop_last []);; (* *)
print_list (drop_last [9]);; (* *)
print_list (drop_last [1; 2; 4; 8]);; (* 1; 2; 4; *)

Printf.printf "\n--------\n";;

print_list (drop_last_tail [] []);; (* *)
print_list (drop_last_tail [9] []);; (* *)
print_list (drop_last_tail [1; 2; 4; 8] []);; (* 1; 2; 4; *)
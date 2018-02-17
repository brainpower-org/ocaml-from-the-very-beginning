let rec evens = function (* a' list -> a' list *)
    | _::a::t -> a :: evens t
    | _ -> [];;

let print_item i = Printf.printf "%d; " i;;
let print_list l = List.iter print_item l;;

print_list (evens [1; 2; 3; 4]);; (* 2; 4; *)
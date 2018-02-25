#use "format.ml";;
let rec calm = function
    | [] -> []
    | h::t -> (if h = '!' then '.' else h) :: calm t;;

Printf.printf "%s\n" (format_list (calm ['!']) (fun c -> Printf.sprintf "%c" c));;
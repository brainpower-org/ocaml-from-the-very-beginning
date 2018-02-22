let format_list l fn = Printf.sprintf "[%s]" (String.concat "; " (List.map fn l));;
let format_bool_list l = format_list l (Printf.sprintf "%b");;
let format_int_list l = format_list l (Printf.sprintf "%d");;
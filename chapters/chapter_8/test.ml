open Base
open OUnit2
open Solutions
open Printf


let print_char_list l =  List.map l ~f:Char.to_string |> String.concat ~sep:";"
let pp_int_pair (k,v) = 
  Printf.sprintf "(%d,%d)" k v
let print_tuple_list l =  List.map l ~f:pp_int_pair |> String.concat ~sep:";"

let tests =
  [
    "1) unique_keys [(1,7); (2,89); (3,1); (7,2)] -> 4">:: 
      (fun _ -> assert_equal 4 (unique_keys [(1,7); (2,89); (3,1); (7,2)])); 
    "2) unique_keys [o] -> 0">:: 
      (fun _ -> assert_equal 0 (unique_keys [])); 
    "3) print dictionary_from_list
     [(1, 3), (2, 4), (5, 6), (1, 5)] -> [(1, 3), (2, 4), (5, 6)]">:: 
      (fun _ -> 
        Stdio.print_endline (print_tuple_list(dictionary_from_list[(1,3)]);
      ));
    "3.1) dictionary_from_list
     [(1, 3), (2, 4), (5, 6), (1, 5)] -> [(1, 3), (2, 4), (5, 6)]">:: 
      (fun _ -> assert_equal ~printer:print_tuple_list [(1, 3); (2, 4); (5, 6)] (dictionary_from_list [(1, 3); (2, 4); (5, 6); (1, 5)]));
    "4) dictionary_from_list [(1, 3), (2, 3), (5, 6)] -> [(1, 3), (2, 3), (5, 6)]">:: 
      (fun _ -> assert_equal ~printer:print_tuple_list[(1, 3); (2, 3); (5, 6)] (dictionary_from_list [(1, 3); (2, 3); (5, 6)]));
    "5) dictionary_from_list [] -> []">:: 
      (fun _ -> assert_equal [] (dictionary_from_list [])); 
  ]

let () =
  run_test_tt_main ("tests" >::: tests)
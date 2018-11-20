open Core_kernel
open OUnit2
open Solutions

let print_int_list l = List.map l ~f:Int.to_string |> String.concat ~sep:";"

let tests =
  [
    "insertion_sort [] => []">::
      (fun _ -> assert_equal ~printer:print_int_list [] (insertion_sort [])); 
    "insertion_sort [1] => [1]">::
      (fun _ -> assert_equal ~printer:print_int_list [1] (insertion_sort [1])); 
    "insertion_sort [5;7;3;1] => [1;3;5;7]">::
      (fun _ -> assert_equal ~printer:print_int_list [1;3;5;7] (insertion_sort [5;7;3;1])); 
  ]

let () =
  run_test_tt_main ("tests" >::: tests)

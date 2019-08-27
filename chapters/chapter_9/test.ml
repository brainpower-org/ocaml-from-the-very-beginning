open Base
open OUnit2
open Solutions

let print_char_list l =  List.map l ~f:Char.to_string |> String.concat ~sep:";"
let print_int_list l =  List.map l ~f:Int.to_string |> String.concat ~sep:";"

let tests =
  [
    "1) member_all 1 [[1;2;3;7;2]] -> true">:: 
      (fun _ -> assert_equal true (member_all 1 [[1;2;3;7;2]])); 
    "2) member_all 1 [[1;2];[3;7;2]] -> false">:: 
      (fun _ -> assert_equal false (member_all 1 [[1;2];[3;7;2]])); 
    "3) member_all 1 [] -> false">:: 
      (fun _ -> assert_equal ~printer:Bool.to_string false (member_all 1 [])); 
    "4) member_all 'a' [['a']] -> true">:: 
      (fun _ -> assert_equal ~printer:Bool.to_string true (member_all 'a' [['a']])); 
    "5) member_all 'c' [['a'];['b','a']] -> false">:: 
      (fun _ -> assert_equal ~printer:Bool.to_string true (member_all 'a' [['a']])); 
    "6) member_all 'a' [[]] -> false">:: 
      (fun _ -> assert_equal ~printer:Bool.to_string true (member_all 'a' [['a']]));
    "7) division 2 [10;20;30] -> [5;10;15]">:: 
      (fun _ -> assert_equal ~printer:print_int_list [5;10;15] (division 2 [10;20;30]));
  ]

let () =
  run_test_tt_main ("tests" >::: tests)
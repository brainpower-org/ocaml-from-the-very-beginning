open Base
open OUnit2
open Solutions

let tests =
  [
    "1) area Rectangle(2, 3) -> 6">:: 
    (fun _ -> assert_equal 6 (area (Rectangle(2, 3)))); 
    "2) area Square 4 -> 16">:: 
    (fun _ -> assert_equal 16 (area (Square 4))); 
  ]

let () =
  run_test_tt_main ("tests" >::: tests)
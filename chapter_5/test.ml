open Core_kernel
open OUnit2
open Solutions

let tests =
  [
    (* "not false => true">:: 
    (fun _ -> assert_equal true (not false)); *)
  ]

let () =
  run_test_tt_main ("tests" >::: tests)

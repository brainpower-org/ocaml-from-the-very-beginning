
open OUnit2
open Solutions

let tests =
  [
    "smallest [7; 89; 1; 2] -> 1">:: 
      (fun _ -> assert_equal 1 (smallest [7; 89; 1; 2])); 
    "smallest [] raise Not_found">::
      (fun _ -> assert_equal (-1) (try (smallest []) with Failure(_) -> (-1)));
  ]

let () =
  run_test_tt_main ("tests" >::: tests)
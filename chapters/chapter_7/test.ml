
open OUnit2
open Solutions

let tests =
  [
    "smallest [7; 89; 1; 2] -> 1">:: 
      (fun _ -> assert_equal 1 (smallest [7; 89; 1; 2])); 
    "smallest [] raise Not_found">::
      (fun _ -> assert_equal (-1) (try (smallest []) with Not_found -> (-1)));
    "smallest_length_check [7; 89; 1; 2] -> 1">:: 
      (fun _ -> assert_equal 1 (smallest_length_check [7; 89; 1; 2])); 
    "smallest_length_check [] raise Not_found">::
      (fun _ -> assert_equal (-1) (try (smallest_length_check []) with Not_found -> (-1)));
    "smallest_option [] raise Not_found">::
      (fun _ -> assert_equal (-1) (try (smallest_option []) with Not_found -> (-1)));
    "smallest_or_zero [] 0">::
      (fun _ -> assert_equal 0 (smallest_or_zero []));
    "smallest_or_zero [1; 2] 1">::
      (fun _ -> assert_equal 1 (smallest_or_zero [1; 2]));
    "floor_sqrt 25 5">::
      (fun _ -> assert_equal 5 (floor_sqrt 25));
    "floor_sqrt 26 5">::
      (fun _ -> assert_equal 5 (floor_sqrt 26));
    "floor_sqrt 31 5 - test for sqrt result truncation">::
      (fun _ -> assert_equal 5 (floor_sqrt 31));
    "floor_sqrt -4 Negative_Argument -4">::
      (fun _ -> assert_equal (-4) (try floor_sqrt (-4) with Negative_Argument(n) -> n));
  ]

let () =
  run_test_tt_main ("tests" >::: tests)
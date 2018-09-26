open Core_kernel
open OUnit2
open Solutions


let tests =
  [
    "double [2;3;4] => [4;6;8]">:: 
      (fun _ -> assert_equal [4;6;8] (double [2;3;4])); 
    "evens [1;2;3] => [false;true;false]">::
      (fun _ -> assert_equal [false;true;false] (evens [1;2;3]));
    "map (a -> 0) [1;2;3] => [0;0;0]">::
      (fun _ -> assert_equal [0;0;0] (map (fun a -> 0) [0;0;0]));
    "map_double [2;3;4] => [4;6;8]">:: 
      (fun _ -> assert_equal [4;6;8] (map_double [2;3;4])); 
    "map_evens [1;2;3] => [false;true;false]">::
      (fun _ -> assert_equal [false;true;false] (map_evens [1;2;3]));
    "base_double [2;3;4] => [4;6;8]">:: 
      (fun _ -> assert_equal [4;6;8] (base_double [2;3;4])); 
    "calm ['H';'E';'L';'P';'!';' ';'F';'I';'R';'E';'!'] => ['H';'E';'L';'P';'.';' ';'F';'I';'R';'E';'.']">:: 
      (fun _ -> assert_equal ['H';'E';'L';'P';'!';' ';'F';'I';'R';'E';'!'] (calm ['H';'E';'L';'P';'.';' ';'F';'I';'R';'E';'.'])); 
  ]

let () =
  run_test_tt_main ("tests" >::: tests)

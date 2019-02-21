
open Base
open OUnit2
open Solutions

let print_int_list l = List.map l ~f:Int.to_string |> String.concat ~sep:";"
let print_char_list l =  List.map l ~f:Char.to_string |> String.concat ~sep:";"

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
      (fun _ -> assert_equal ['H';'E';'L';'P';'.';' ';'F';'I';'R';'E';'.'] (calm ['H';'E';'L';'P';'!';' ';'F';'I';'R';'E';'!'])); 
    "calm2 ['H';'E';'L';'P';'!';' ';'F';'I';'R';'E';'!'] => ['H';'E';'L';'P';'.';' ';'F';'I';'R';'E';'.']">:: 
      (fun _ -> assert_equal ['H';'E';'L';'P';'.';' ';'F';'I';'R';'E';'.'] (calm2 ['H';'E';'L';'P';'!';' ';'F';'I';'R';'E';'!'])); 
    "calm_map ['H';'E';'L';'P';'!';' ';'F';'I';'R';'E';'!'] => ['H';'E';'L';'P';'.';' ';'F';'I';'R';'E';'.']">:: 
      (fun _ -> assert_equal ['H';'E';'L';'P';'.';' ';'F';'I';'R';'E';'.'] (calm_map ['H';'E';'L';'P';'!';' ';'F';'I';'R';'E';'!'])); 
    "calm_mappable ['H';'E';'L';'P';'!';' ';'F';'I';'R';'E';'!'] => ['H';'E';'L';'P';'.';' ';'F';'I';'R';'E';'.']">:: 
      (fun _ -> assert_equal ['H';'E';'L';'P';'.';' ';'F';'I';'R';'E';'.'] (map ( function 
  | '!' -> '.' 
  | h -> h ) ['H';'E';'L';'P';'!';' ';'F';'I';'R';'E';'!'])); 
    "clip 2 => 2">::
      (fun _ -> assert_equal 2 (clip 2)); 
    "clip 12 => 10">::
      (fun _ -> assert_equal 10 (clip 12)); 
    "clip -1 => 1">::
      (fun _ -> assert_equal 1 (clip (-1))); 
    "clip_list [] => []">::
      (fun _ -> assert_equal [] (clip_list [])); 
    "clip_list [1;2;3] => [1; 2; 3]">::
      (fun _ -> assert_equal [1;2;3] (clip_list [1;2;3])); 
    "clip_list [-1;-2;30] => [1; 1; 10]">::
      (fun _ -> assert_equal [1;1;10] (clip_list [-1;-2;30]));
    "clip_list [-1;2;30] => [1; 2; 10]">::
      (fun _ -> assert_equal [1;2;10] (clip_list [-1;2;30]));
    "anon_clip_list [1;2;3] => [1; 2; 3]">::
      (fun _ -> assert_equal [1;2;3] (anon_clip_list [1;2;3])); 
    "anon_clip_list [-1;-2;30] => [1; 1; 10]">::
      (fun _ -> assert_equal [1;1;10] (anon_clip_list [-1;-2;30]));
    "anon_clip_list [-1;2;30] => [1; 2; 10]">::
      (fun _ -> assert_equal [1;2;10] (anon_clip_list [-1;2;30]));
    "apply (+) 6 4 => 24">::
      (fun _ -> assert_equal 24 (apply ((+) 4) 6 0));
    "insert (-) 1 [2]">::
      (fun _ -> assert_equal ~printer:print_int_list [1; 2] (insert ~f:(-) 1 [2])); 
    "insert (-) 2 [1]">::
      (fun _ -> assert_equal ~printer:print_int_list [1; 2] (insert ~f:(-) 2 [1])); 
    "insert (-) 'B' [':']">::
      (fun _ -> assert_equal ~printer:print_char_list [':'; 'B'] (insert ~f:Char.compare 'B' [':'])); 
    "insertion_sort [] => []">::
      (fun _ -> assert_equal ~printer:print_int_list [] (insertion_sort ~f:(-) [])); 
    "insertion_sort [1] => [1]">::
      (fun _ -> assert_equal ~printer:print_int_list [1] (insertion_sort ~f:(-) [1])); 
    "insertion_sort [5;7;3;1] => [1;3;5;7]">::
      (fun _ -> assert_equal ~printer:print_int_list [1;3;5;7] (insertion_sort ~f:(-) [5;7;3;1]));
    "insertion_sort [5;7;3;1] => [7;5;3;1]">::
      (fun _ -> assert_equal ~printer:print_int_list [7;5;3;1] (insertion_sort ~f:(Fn.flip (-)) [5;7;3;1]));
    "insertion_sort [-1;99;7;-1;3] => [-1;-1;3;7;99]">::
      (fun _ -> assert_equal ~printer:print_int_list [-1;-1;3;7;99] (insertion_sort ~f:(-) [-1;99;7;-1;3]));
    "insertion_sort fn.flip [-1;99;7;-1;3] => [-1;-1;3;7;99]">::
      (fun _ -> assert_equal ~printer:print_int_list [99;7;3;-1;-1] (insertion_sort ~f:(Fn.flip (-)) [-1;99;7;-1;3]));
    "filter (>0) [-1;99;7;-1;3] => [99;7;3]">::
      (fun _ -> assert_equal ~printer:print_int_list [99;7;3] (filter ~f:((<) 0) [-1;99;7;-1;3]));
    "filter (>0) [] => []">::
      (fun _ -> assert_equal ~printer:print_int_list [] (filter ~f:((<) 0) []));
    "filter (>0) [0] => []">::
      (fun _ -> assert_equal ~printer:print_int_list [] (filter ~f:((<) 0) [0]));
    "filter (>0) [-1;-55] => []">::
      (fun _ -> assert_equal ~printer:print_int_list [] (filter ~f:((<) 0) [-1;-55]));
    "filter (==b) ['a';'b';'c';'D';'b'] => ['b';'b]">::
      (fun _ -> assert_equal ~printer:print_char_list ['b';'b'] (filter ~f:((==) 'b') ['a';'b';'c';'D';'b']));
    "for_all (==b) ['a';'b';'c';'D';'b'] => false">::
      (fun _ -> assert_equal false (for_all ~f:((==) 'b') ['a';'b';'c';'D';'b']));
    "for_all (==b) ['b';'b';'b';'b';'b'] => true">::
      (fun _ -> assert_equal true (for_all ~f:((==) 'b') ['b';'b';'b';'b';'b']));
    "for_all (==b) [] => true">::
      (fun _ -> assert_equal true (for_all ~f:((==) 'b') []));
    "for_all (>2) [1;2;50;-3] => false">::
      (fun _ -> assert_equal false (for_all ~f:((>) 2) [1;2;50;-3]));
    "for_all (>-4) [1;2;0;-3] => true">::
      (fun _ -> assert_equal true (for_all ~f:(flip_compare ~f:(>) (-4)) [1;2;50;-3]));
    "for_all (>-4) [1;2;0;-3] => true">::
      (fun _ -> assert_equal true (for_all ~f:(flip_compare2 ~f:(>) (-4)) [1;2;50;-3]));
  ]

let () =
  run_test_tt_main ("tests" >::: tests)

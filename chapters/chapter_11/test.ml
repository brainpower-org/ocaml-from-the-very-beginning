open Base
open OUnit2
open Solutions

let tests =
  [
    "1) find  (Br(2, Br(1, Lf, Lf), Br(3, Lf, Br(5, Br(4, Lf, Lf), Br(8, Lf, Lf))))) 4 -> true">:: 
    (fun _ -> assert_equal true (find (Br(2, Br(1, Lf, Lf), Br(3, Lf, Br(5, Br(4, Lf, Lf), Br(8, Lf, Lf))))) 4)); 
    "2) find  (Br(2, Br(1, Lf, Lf), Br(3, Lf, Br(5, Br(4, Lf, Lf), Br(8, Lf, Lf))))) 99 -> false">:: 
    (fun _ -> assert_equal false (find (Br(2, Br(1, Lf, Lf), Br(3, Lf, Br(5, Br(4, Lf, Lf), Br(8, Lf, Lf))))) 99)); 
    "3) find  (Lf) 3 -> false">:: 
    (fun _ -> assert_equal false (find Lf 99)); 
    "4) mirror (Br(2, Br(1, Lf, Lf), Br(3, Lf, Br(4, Lf, Lf))) -> (Br(2, Br(3, Br(4, Lf, Lf), Lf), Br(1, Lf, Lf))">:: 
    (fun _ -> assert_equal (Br(2, Br(3, Br(4, Lf, Lf), Lf), Br(1, Lf, Lf))) (mirror (Br(2, Br(1, Lf, Lf), Br(3, Lf, Br(4, Lf, Lf)))))); 
    "5) equals_shape (Br(2, Br(1, Lf, Lf), Br(3, Lf, Br(4, Lf, Lf))) (Br(2, Br(3, Br(4, Lf, Lf), Lf), Br(1, Lf, Lf)) -> false">:: 
    (fun _ -> assert_equal false (equals_shape (Br(2, Br(1, Lf, Lf), Br(3, Lf, Br(4, Lf, Lf)))) (Br(2, Br(3, Br(4, Lf, Lf), Lf), Br(1, Lf, Lf))))); 
    "6) equals_shape Lf Lf -> true">:: 
    (fun _ -> assert_equal true (equals_shape Lf Lf)); 
    "7) equals_shape (Br(2, Br(1, Lf, Lf), Br(3, Lf, Br(4, Lf, Lf))) (Br(2, Br(3, Lf, Lf), Br(1, Lf, Lf)) -> false">:: 
    (fun _ -> assert_equal false (equals_shape (Br(2, Br(1, Lf, Lf), Br(3, Lf, Br(4, Lf, Lf)))) (Br(2, Br(3, Lf, Lf), Br(1, Lf, Br(5,Lf, Lf)))))); 
    "8) tree_of_list [(1,\"one\"),(3,\"three\"),(2,\"two\")] -> Br((1,\"one\"), Lf, Br((3,\"three\")), Br((2,\"two\"), Lf,Lf),Lf)">:: 
    (fun _ -> assert_equal (Br((1,"one"), Lf, Br((3,"three"), Br((2,"two"), Lf,Lf),Lf))) (tree_of_list  [(1,"one");(3,"three");(2,"two")])); 
  ]

let () =
  run_test_tt_main ("tests" >::: tests)

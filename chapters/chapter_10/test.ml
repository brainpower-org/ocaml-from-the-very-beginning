open Base
open OUnit2
open Solutions

let tests =
  [
    "1) area Rectangle(2, 3) -> 6">:: 
    (fun _ -> assert_equal 6 (area (Rectangle(2, 3)))); 
    "2) area Square 4 -> 16">:: 
    (fun _ -> assert_equal 16 (area (Square 4))); 
    "3) rotate to greater length Rectangle(2,3) -> Rectangle(3,2)">:: 
    (fun _ -> assert_equal (Rectangle(3,2)) (rotate (Rectangle(2,3)))); 
    "4) rotate to greater length Rectangle(3,2) -> Rectangle(3,2)">:: 
    (fun _ -> assert_equal (Rectangle(3,2)) (rotate (Rectangle(3,2)))); 
    "5) rotate to greater length Square(3) -> Square(3)">:: 
    (fun _ -> assert_equal (Square(3)) (rotate (Square(3)))); 
    "6) sort smallest widths [Rectangle(4,2); Rectangle(2,4); Rectangle(5,6); Square(3)] -> [Rectangle(4,2); Rectangle(4,2); Square(3); Rectangle(6,5)]">:: 
    (fun _ -> assert_equal [Rectangle(4,2); Rectangle(4,2); Square(3); Rectangle(6,5)] (smallestWidthSorted ([Rectangle(4,2); Rectangle(2,4); Rectangle(5,6); Square(3)]))); 
    "7) sort smallest widths [Rectangle(4,2); Rectangle(4,2); Square(3); Rectangle(6,5)] -> [Rectangle(4,2); Rectangle(4,2); Square(3); Rectangle(6,5)]">:: 
    (fun _ -> assert_equal [Rectangle(4,2); Rectangle(4,2); Square(3); Rectangle(6,5)] (smallestWidthSorted ([Rectangle(4,2); Rectangle(4,2); Square(3); Rectangle(6,5)]))); 
    "8) take 2 Cons(1, Cons(2, Cons(1, Nil))) -> Cons(1, Cons(2, Nil))">:: 
    (fun _ -> assert_equal (Cons(1, Cons(2, Nil))) (take 2 (Cons(1, Cons(2, Cons(1, Nil)))))); 
    "9) take 2 Nil -> Nil">:: 
    (fun _ -> assert_equal Nil (take 2 Nil)); 
    "10) take 0 Cons(1, Cons(2, Cons(1, Nil))) -> Nil">:: 
    (fun _ -> assert_equal Nil (take 0 (Cons(1, Cons(2, Cons(1, Nil)))))); 
    "11) take 12 Cons(1, Cons(2, Cons(1, Nil))) -> Cons(1, Cons(2, Cons(1, Nil)))">:: 
    (fun _ -> assert_equal (Cons(1, Cons(2, Cons(1, Nil)))) (take 12 (Cons(1, Cons(2, Cons(1, Nil)))))); 
    "12) drop 2 Cons(1, Cons(2, Cons(1, Nil))) -> Cons(1, Nil)">:: 
    (fun _ -> assert_equal (Cons(1, Nil)) (drop 2 (Cons(1, Cons(2, Cons(1, Nil)))))); 
    "13) drop 12 Cons(1, Cons(2, Cons(1, Nil))) -> Nil">:: 
    (fun _ -> assert_equal (Nil) (drop 12 (Cons(1, Cons(2, Cons(1, Nil)))))); 
    "14) map ((+) 11) Cons(1, Cons(2, Cons(1, Nil))) -> Cons(12, Cons(13, Cons(12, Nil)))">:: 
    (fun _ -> assert_equal (Cons(12, Cons(13, Cons(12, Nil)))) (map ((+) 11) (Cons(1, Cons(2, Cons(1, Nil)))))); 
    "15) evaluate power 2 2 -> 4">:: 
    (fun _ -> assert_equal 4 (evaluate (Power(Num(2), Num(2))))); 
    "16) evaluate power 3 5 -> 4">:: 
    (fun _ -> assert_equal 243 (evaluate (Power(Num(3), Num(5))))); 
  ]

let () =
  run_test_tt_main ("tests" >::: tests)
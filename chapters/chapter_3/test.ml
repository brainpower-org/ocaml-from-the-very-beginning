open OUnit2
open Solutions

let tests =
  [
    "not false => true">:: 
    (fun _ -> assert_equal true (not false));

    "not false => true">::
    (fun _ -> assert_equal false (not true));

    "nsum 10">::
    (fun _ -> assert_equal 0 (nsum 0));

    "nsum 10">::
    (fun _ -> assert_equal 55 (nsum 10));

    "exp 2 2">::
    (fun _ -> assert_equal 4 (exp 2 2));

    "exp 2 0">::
    (fun _ -> assert_equal 1 (exp 2 0));

    (* "exp 2 -1">::
    (fun _ -> assert_equal 0.5 (exp 2. -1)); *)

    "isupper A">::
    (fun _ -> assert_equal true (isupper 'A'));

    "isupper u">::
    (fun _ -> assert_equal false (isupper 'u'));

    "isupper 0">::
    (fun _ -> assert_equal false (isupper '0'));

    "islower A">::
    (fun _ -> assert_equal false (islower 'A'));

    "islower u">::
    (fun _ -> assert_equal true (islower 'u'));

    "islower 0">::
    (fun _ -> assert_equal false (islower '0'));
  ]

let () =
  run_test_tt_main ("tests" >::: tests)

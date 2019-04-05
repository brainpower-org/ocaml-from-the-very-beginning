open Core_kernel

(* Chapter 7. When Things Go Wrong - p. 58 *)

(* 7.1. Write a function smallest which returns the smallest positive element of a list of integers. If there
is no positive element, it should raise the built-in Not_found exception. *)
let smallest l = 
    List.filter ~f:(fun a -> a > 0) l
    |> List.sort ~compare:(fun a b -> a - b)
    |> List.hd_exn

(* 2. Write another function smallest_or_zero which uses the smallest function but if Not_found is
raised, returns zero. *)

(* 3. Write an exception definition and a function which calculates the largest integer smaller than or
equal to the square root of a given integer. If the argument is negative, the exception should be
raised. *)

(* 4. Write another function which uses the previous one, but handles the exception, and simply returns
zero when a suitable integer cannot be found. *)

(* 5. Comment on the merits and demerits of exceptions as a method for dealing with exceptional
situations, in contrast to returning a special value to indicate an error (such as -1 for a function
normally returning a positive number). *)
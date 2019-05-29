open Core_kernel

(* Chapter 7. When Things Go Wrong - p. 58 *)

(* 7.1. Write a function smallest which returns the smallest positive element of a list of integers. If there
   is no positive element, it should raise the built-in Not_found exception. *)
let smallest l = 
  List.filter ~f:(fun a -> a > 0) l
  |> List.sort ~compare:(fun a b -> a - b)
  |> (fun l -> try (List.hd_exn l) with Failure(_) -> raise Not_found)

let smallest_length_check l = 
  List.filter ~f:(fun a -> a > 0) l
  |> List.sort ~compare:(fun a b -> a - b)
  |> (fun l -> match l with 
      | [] -> raise Not_found
      | h::_ -> h
    )

let smallest_option l = 
  List.filter ~f:(fun a -> a > 0) l
  |> List.sort ~compare:(fun a b -> a - b)
  |> List.hd
  |> (function
      | None -> raise Not_found
      | Some(h) -> h)

(* 2. Write another function smallest_or_zero which uses the smallest function but if Not_found is
   raised, returns zero. *)
let smallest_or_zero l = try (smallest l) with Not_found -> 0


(* 3. Write an exception definition and a function which calculates the largest integer smaller than or
   equal to the square root of a given integer. If the argument is negative, the exception should be
   raised. *)
exception Negative_Argument of int

let floor_sqrt n = 
  if n < 0 then
    raise (Negative_Argument n)
  else
    float_of_int n
    |> sqrt
    |> int_of_float

(* 4. Write another function which uses the previous one, but handles the exception, and simply returns
   zero when a suitable integer cannot be found. *)

let floor_sqrt_zero n = 
  try floor_sqrt n with
  | Negative_Argument(_) -> 0

(* let try_or a b = fun n -> try a n with e -> b e *)
(* let floor_sqrt_zero = try_or floor_sqrt (function _ -> 0) *)

(* 5. Comment on the merits and demerits of exceptions as a method for dealing with exceptional
   situations, in contrast to returning a special value to indicate an error (such as -1 for a function
   normally returning a positive number). *)

exception Zero_Argument of int

let floor_sqrt_strict n = 
  if n = 0 then 
    raise (Zero_Argument 0)
  else
    floor_sqrt n
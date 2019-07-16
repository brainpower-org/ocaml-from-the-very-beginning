(* 1. Write a function to determine the number of different keys in a dictionary. *)
let unique_keys = List.length 

let rec add k v d = match d with
  | [] -> [(k, v)]
  | (k', v')::t ->
    if k = k'
    then (k', v') :: t
    else (k', v') :: add k v t

(* 3. Write a function to build a dictionary from two equal length lists,
  one containing keys and another containing values. Raise the exception
  Invalid_argument if the lists are not of equal length *)
let rec build ks vs =
  let open Base in
  match List.zip ks vs with
  | Ok l -> l
  | _ -> raise (Invalid_argument "list lengths are not equal")

(* 5. Define a function to turn any list of pairs into a dictionary. If duplicate 
   keys are found, the value associated with the first occurrence of the key should be kept. *)
let dictionary_from_list l =
  let rec aux l' dict = match l' with
    | [] -> dict
    | (x, y) :: t -> aux t (add x y dict)
  in aux l []

(* 6. Write the function union a b which forms the union of two dictionaries. 
   The union of two dictionaries is the dictionary containing all the entries in one or other or both. 
   In the case that a key is contained in both dictionaries, the value in the first should be preferred.*)

let union a b = dictionary_from_list (a@b)
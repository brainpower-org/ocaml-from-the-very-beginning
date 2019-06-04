open Base


(* 1. Write a function to determine the number of different keys in a dictionary. *)
let unique_keys = List.length 

(* 5. Define a function to turn any list of pairs into a dictionary. If duplicate 
keys are found, the value associated with the first occurrence of the key should be kept. *)
let dictionary_from_list l =
    let rec add k v d = match d with
        | [] -> [(k, v)]
        | (k', v')::t ->
            if k = k'
                then (k', v') :: t
                else (k', v') :: add k v t
    in let rec aux l' dict = match l' with
        | [] -> dict
        | (x, y) :: t -> aux t (add_key x y dict)
    in aux l []


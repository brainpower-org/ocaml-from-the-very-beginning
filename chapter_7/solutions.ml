open Core_kernel

let smallest l = 
    List.filter ~f:(fun a -> a > 0) l
    |> List.sort ~compare:(fun a b -> a - b)
    |> List.hd_exn
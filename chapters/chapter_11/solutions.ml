type 'a tree = 
| Br of 'a * 'a tree * 'a tree
| Lf


let rec find tr e = 
  match tr with
  | Lf -> false
  | Br(x,l,r) -> if (x == e) then true
                 else 
                  if (e < x ) then find l e 
                  else find r e

let rec mirror tr = 
  match tr with
  | Lf -> Lf
  | Br(x,l,r) -> Br(x, mirror r, mirror l)


let rec shape tr = 
  match tr with 
  | Lf -> []
  | Br(_,l,r) -> shape l @ ['l'] @ shape r 

let equals_shape tr1 tr2 = shape tr1 == shape tr2

let rec insert k v tr = 
  match tr with 
  | Lf -> Br((k,v), Lf, Lf)
  | Br((k',v'),l,r) -> if k' == k then Br((k,v),l,r)
                  else 
                    if (k < k') then Br((k',v'), insert k v l,r)
                    else Br((k',v'), l, insert k v r)
                
let tree_of_list l =
  let rec acc tr l =
  match l with 
  | [] -> tr
  | (k,v)::t -> acc (insert k v tr) t
  in acc Lf l
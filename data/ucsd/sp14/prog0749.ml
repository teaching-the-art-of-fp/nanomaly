
let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append listReverse t [h];;

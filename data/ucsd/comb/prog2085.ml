
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (rem,acc) = a in
      let (el1,el2) = x in
      let new_sum = (rem + el1) + el2 in
      let new_rem = if new_sum > 9 then 1 else 0 in
      let norm_sum = if new_sum > 9 then new_sum - 10 else new_sum in
      let larger = if (List.length l1) > (List.length l2) then l1 else l2 in
      if (List.length acc) = ((List.length larger) - 1)
      then
        (if new_rem = 1
         then (0, ([1; norm_sum] @ acc))
         else (0, (norm_sum :: acc)))
      else (new_rem, (norm_sum :: acc)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [] | 1 -> l | _ -> bigAdd (mulByDigit (i - 1) l) l;;

let bigMul l1 l2 =
  let f a x = bigAdd (mulByDigit x l1) a in
  let base = [] in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

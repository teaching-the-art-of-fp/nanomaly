
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let bigMul l1 l2 =
  let f a x =
    let (x1,x2) = x in
    let (c,a1::a2) = a in
    let v = (x1 * x2) + c in ((v / 10), ([v / 10] @ ([v mod 10] @ a2))) in
  let base = (0, [0]) in
  let args =
    let (ar1,ar2) = padZero (l1 l2) in List.rev (List.combine ar1 ar2) in
  let (_,res) = List.fold_left f base args in res;;


let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

let padZero l1 l2 =
  let num1 = (List.length l2) - (List.length l1) in
  let num2 = (List.length l1) - (List.length l2) in
  (((clone 0 num1) @ l1), ((clone 0 num2) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

type result =
  | Pass
  | Fail
  | ErrorCode of string;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (z,y) ->
          let sum = z + y in
          if sum > 10
          then let result = a @ (sum mod 10) in result @ 1
          else a @ result in
    let base = [] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


let rec digitsOfInt n =
  let digInt = [] in
  if (n / 10) <> 0 then digInt :: (digitsOfInt (n / 10)) else [];;

let l = [];;

let digitsOfInt n =
  match n / 10 with
  | 0 -> [n mod 10]
  | _ -> l :: (n mod 10) :: (digitsOfInt (n / 10));;

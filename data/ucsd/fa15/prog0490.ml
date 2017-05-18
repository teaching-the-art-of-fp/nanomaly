
let rec digitsOfInt n =
  if n == 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let _ = digitsOfInt - 1229;;

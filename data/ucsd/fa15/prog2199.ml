
let pipe fs = let f a x n = x a in let base n = n in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;


let pipe fs = let f a x p = x a in let base d = d in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;


let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> [] | hd::tl -> f 0 hd in
  List.fold_left f base xs;;


let stringOfList f l =
  let fx a b = List.append b [f a] in
  let base = [] in
  List.fold_left f base l f (f (f (f (f (f (f base 1) 2) 3) 4) 5) 6);;


let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a @ x in
      let base = h in let l = sep in List.fold_left f base l;;


let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let x = List.mem (h, seen) in
        if x = true
        then helper (seen', t)
        else (let seen' = [] @ h in let rest' = t in helper (seen', rest')) in
  List.rev (helper ([], l));;


let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone ((x n) - 1));;

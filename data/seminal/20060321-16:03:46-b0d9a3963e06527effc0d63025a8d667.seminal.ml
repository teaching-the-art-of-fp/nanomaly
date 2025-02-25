type exp = Int of int | Var of string 
       | Plus of exp * exp | Times of exp * exp
type stmt = Skip | Assign of string * exp
         | Seq of stmt * stmt 
         | If of exp * stmt * stmt
         | While of exp * stmt
         | SaveHeap of string
         | RestoreHeap of string

type heap = heap_elt list
(* #################################################################### *)
and  heap_elt = Complex_elt of (string*heap) | Simple_elt of (string*int) 

(* ################################################################
###################################################################
########################### *)
let rec lookup h str =
  match h with
    [] -> 0 (* ############### *)
  | hd::tl -> 
  	match hd with
  	  Complex_elt (s,h) -> if s=str then 0 else lookup tl str
  	| Simple_elt  (s,i) -> if s=str then i else lookup tl str

let update h str i = 
    Simple_elt(str,i)::h
    

let rec interp_e (h:heap) (e:exp) =
 match e with
  Int i       ->i
 |Var str     -> lookup h str
 |Plus(e1,e2) ->(interp_e h e1)+(interp_e h e2)
 |Times(e1,e2)->(interp_e h e1)*(interp_e h e2)


(* ############################################################
#################################################################
##################################################### *)
let rec interp_s (h:heap) (s:stmt) =
  match s with
   Skip -> h
  |Seq(s1,s2) -> let h2 = interp_s h s1 in 
                 interp_s h2 s2
  |If(e,s1,s2) -> if (interp_e h e) <> 0
                  then interp_s h s1 
                  else interp_s h s2
  |Assign(str,e) -> update h str (interp_e h e)
  |While(e,s1) -> if (interp_e h e) <> 0
                  then let h2 = interp_s h s1 in
                       interp_s h2 s
                  else h
  |SaveHeap str  -> h
  |RestoreHeap str -> h

let mt_heap = [] 

let interp_prog s = 
  lookup (interp_s mt_heap s) "ans"
  
  
(* ############################### *)  
 let test_heap = [("a",0);("b",1);("c",2)] 
   
let print_heap h =
  let rec print_heap_elt elt =
     match elt with 
       Complex_elt(s,hp)-> print_string (s ^ " Heap Var: \n");
       | Simple_elt(s,i)-> print_endline(s ^ ": " ^ (string_of_int i)) in
  List.map print_heap_elt h
  
let _ = print_heap test_heap 
   				  

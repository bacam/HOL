(* generated by Lem from print_ast.lem *)
open bossLib Theory Parse res_quanTheory
open finite_mapTheory listTheory pairTheory pred_setTheory integerTheory
open set_relationTheory sortingTheory stringTheory wordsTheory

val _ = new_theory "Print_ast"

open MiniMLTheory

(*open MiniML*)


(* TODO: use a built-in int_to_string *)

 val pos_int_to_string_defn = Hol_defn "pos_int_to_string" `
 (pos_int_to_string n =
  if int_gt n (& 0) then
    let n' = int_mod n (& 10) in STRCAT 
      (pos_int_to_string (int_div n (& 10))) 
      (if n' = & 0 then "0"
       else if n' = & 1 then "1"
       else if n' = & 2 then "2"
       else if n' = & 3 then "3"
       else if n' = & 4 then "4"
       else if n' = & 5 then "5"
       else if n' = & 6 then "6"
       else if n' = & 7 then "7"
       else if n' = & 8 then "8"
       else "9")
  else
    "")`;

val _ = Defn.save_defn pos_int_to_string_defn;

(*val int_to_string : Int.int -> string*)
val _ = Define `
 (int_to_string n = 
  if n = & 0 then 
    "0" 
  else if int_gt n (& 0) then
    pos_int_to_string n
  else STRCAT 
    "~"  (pos_int_to_string ((int_sub) (& 0) n)))`;


val _ = Define `
 infixes = ["="; "+"; "-"; "*"; "div"; "mod"; "<"; ">"; "<="; ">="]`;


 val join_strings_defn = Hol_defn "join_strings" `
 
(join_strings sep [] = "")
/\
(join_strings sep [x] = x)
/\
(join_strings sep (x::y::l) = STRCAT 
  x (STRCAT   sep (STRCAT   y  (join_strings sep l))))`;

val _ = Defn.save_defn join_strings_defn;

val _ = Define `
 (lit_to_string l = (case l of
  (* Rely on the fact that true and false cannot be rebound in SML *)
    Bool T => "true"
  | Bool F => "false"
  | IntLit n => int_to_string n
))`;


val _ = Define `
 (var_to_string v =
  if MEM v infixes then STRCAT 
    "op "  v
  else
    v)`;


 val pat_to_string_defn = Hol_defn "pat_to_string" `

(pat_to_string (Pvar v) = var_to_string v)
/\
(pat_to_string (Plit l) = lit_to_string l)
/\
(pat_to_string (Pcon NONE ps) = STRCAT  "(" (STRCAT   (join_strings "," (MAP pat_to_string ps))  ")"))
/\
(pat_to_string (Pcon (SOME c) []) =
  var_to_string c)
/\
(pat_to_string (Pcon (SOME c) ps) = STRCAT 
  "(" (STRCAT   (var_to_string c) (STRCAT   "(" (STRCAT   (join_strings "," (MAP pat_to_string ps)) (STRCAT   ")"  ")")))))`;

val _ = Defn.save_defn pat_to_string_defn;

 val exp_to_string_defn = Hol_defn "exp_to_string" `

(exp_to_string (Raise r) =
  "(raise Bind)")
/\
(exp_to_string (Val (Lit l)) =
  lit_to_string l)
/\
(exp_to_string (Val _) =
  (* TODO: this shouldn't happen in source *)
  "")
/\
(exp_to_string (Con NONE es) = STRCAT  "(" (STRCAT   (join_strings "," (MAP exp_to_string es))  ")"))
/\
(exp_to_string (Con (SOME c) []) =
  var_to_string c)
/\
(exp_to_string (Con (SOME c) es) = STRCAT 
  "(" (STRCAT   (var_to_string c) (STRCAT   "(" (STRCAT   (join_strings "," (MAP exp_to_string es)) (STRCAT   ")"  ")")))))
/\
(exp_to_string (Var v) =
  var_to_string v)
/\
(exp_to_string (Fun v e) = STRCAT 
  "(fn " (STRCAT   (var_to_string v) (STRCAT   " => " (STRCAT   (exp_to_string e)  ")"))))
/\
(exp_to_string (App Opapp e1 e2) = STRCAT 
  "(" (STRCAT   (exp_to_string e1) (STRCAT   " " (STRCAT   (exp_to_string e2)  ")"))))
/\
(exp_to_string (App Equality e1 e2) = STRCAT 
  (* Rely on the fact (?) that = cannot be rebound in SML *)
  "(" (STRCAT   (exp_to_string e1) (STRCAT   " = " (STRCAT   (exp_to_string e2)  ")"))))
/\
(exp_to_string (App (Opn o0) e1 e2) =
  let s = (case o0 of
      Plus => "+"
    | Minus => "-"
    | Times => "*"
    | Divide => "div"
    | Modulo => "mod"
  )
  in
    if MEM s infixes then STRCAT 
      "(" (STRCAT   (exp_to_string e1) (STRCAT   " " (STRCAT   s (STRCAT   " " (STRCAT   (exp_to_string e2)  ")")))))
    else STRCAT 
      "(" (STRCAT   s (STRCAT   " " (STRCAT   (exp_to_string e1) (STRCAT   " " (STRCAT   (exp_to_string e2)  ")"))))))
/\
(exp_to_string (App (Opb o') e1 e2) =
  let s = (case o' of
      Lt => "<"
    | Gt => ">"
    | Leq => "<="
    | Geq => ">"
  )
  in
    if MEM s infixes then STRCAT 
      "(" (STRCAT   (exp_to_string e1) (STRCAT   " " (STRCAT   s (STRCAT   " " (STRCAT   (exp_to_string e2)  ")")))))
    else STRCAT 
      "(" (STRCAT   s (STRCAT   " " (STRCAT   (exp_to_string e1) (STRCAT   " " (STRCAT   (exp_to_string e2)  ")"))))))
/\
(exp_to_string (Log lop e1 e2) = STRCAT 
  "(" (STRCAT   (exp_to_string e1) (STRCAT   (if lop = And then " andalso " else " orelse ") (STRCAT  
  (exp_to_string e2)  ")"))))
/\
(exp_to_string (If e1 e2 e3) = STRCAT 
  "(if " (STRCAT   (exp_to_string e1) (STRCAT   " then " (STRCAT   (exp_to_string e2) (STRCAT   " else " (STRCAT  
  (exp_to_string e3)  ")"))))))
/\
(exp_to_string (Mat e pes) = STRCAT 
  "(case " (STRCAT   (exp_to_string e) (STRCAT   " of " (STRCAT  
  (join_strings "|" (MAP pat_exp_to_string pes))  ")"))))
/\
(exp_to_string (Let v e1 e2) = STRCAT 
  "let val " (STRCAT   (var_to_string v) (STRCAT   " = " (STRCAT   (exp_to_string e1) (STRCAT   " in " (STRCAT  
  (exp_to_string e2)  " end"))))))
/\
(exp_to_string (Letrec funs e) = STRCAT 
  "let fun " (STRCAT   (join_strings " and " (MAP fun_to_string funs)) (STRCAT   " in " (STRCAT  
  (exp_to_string e)  " end"))))
/\
(pat_exp_to_string (p,e) = STRCAT 
  (pat_to_string p) (STRCAT   " => "  (exp_to_string e)))
/\
(fun_to_string (v1,v2,e) = STRCAT 
  (var_to_string v1) (STRCAT   " " (STRCAT   (var_to_string v2) (STRCAT   " = "  (exp_to_string e)))))`;

val _ = Defn.save_defn exp_to_string_defn;

 val type_to_string_defn = Hol_defn "type_to_string" `

(type_to_string (Tvar tn) =
  tn)
/\
(type_to_string (Tapp ts tn) =
  if ts = [] then
    tn
  else STRCAT 
    "(" (STRCAT   (join_strings "," (MAP type_to_string ts)) (STRCAT   ")"  tn)))
/\
(type_to_string (Tfn t1 t2) = STRCAT 
  "(" (STRCAT   (type_to_string t1) (STRCAT   " -> " (STRCAT   (type_to_string t2)  ")"))))
/\
(type_to_string Tnum =
  (* TODO: Get the numeric types sorted *)
  "int")
/\
(type_to_string Tbool =
  "bool")`;

val _ = Defn.save_defn type_to_string_defn;

val _ = Define `
 (variant_to_string (c,ts) = STRCAT 
  (var_to_string c) (STRCAT   (if ts = [] then "" else " of ") 
  (join_strings " * " (MAP type_to_string ts))))`;


val _ = Define `
 (typedef_to_string (tvs, name, variants) = STRCAT 
  (if tvs = [] then "" else STRCAT  "(" (STRCAT   (join_strings "," tvs)  ")")) (STRCAT  
  name (STRCAT   " = "  (join_strings "|" (MAP variant_to_string variants)))))`;


val _ = Define `
 (dec_to_string d = 
  (case d of
      Dlet p e => STRCAT 
        "val " (STRCAT   (pat_to_string p) (STRCAT   " = "  (exp_to_string e)))
    | Dletrec funs => STRCAT 
        "fun "  (join_strings " and " (MAP fun_to_string funs))
    | Dtype types => STRCAT 
        "datatype "  (join_strings " and " (MAP typedef_to_string types))
  ))`;

val _ = export_theory()


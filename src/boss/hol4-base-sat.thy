name: hol-base-sat
version: 1.0
description: HOL basic theories plus proofs of assumptions
author: HOL developers <hol-developers@lists.sourceforge.net>
license: MIT
show: "HOL4"
show: "Data.Bool"
show: "Data.Option"
show: "Data.Unit"
show: "Data.Sum"
show: "Data.Pair"
show: "Data.List"
show: "Function"
show: "Relation"
show: "Set"
show: "Number.Natural"
requires: base
main {
  import: proofs
  import: unsat
}
unsat {
  import: proofs
  package: hol-base-unsat-1.0
}
bool {
  article: "bool_defs.ot.art"
  interpret: const "HOL4.bool_defs.LET" as "HOL4.bool.LET"
  interpret: const "HOL4.bool_defs.literal_case" as "HOL4.bool.literal_case"
  interpret: const "HOL4.bool_defs.IN" as "HOL4.bool.IN"
  interpret: const "HOL4.bool_defs.TYPE_DEFINITION" as "HOL4.bool.TYPE_DEFINITION"
  interpret: const "HOL4.bool_defs.ARB" as "HOL4.bool.ARB"

  interpret: type "HOL4.min.ind" as "ind"
  interpret: const "HOL4.min.@" as "select"
  interpret: const "HOL4.bool.!" as "Data.Bool.!"
  interpret: const "HOL4.bool.?" as "Data.Bool.?"
  interpret: const "HOL4.bool.?!" as "Data.Bool.?!"
  interpret: const "HOL4.bool.T" as "Data.Bool.T"
  interpret: const "HOL4.bool.F" as "Data.Bool.F"
  interpret: const "HOL4.bool./\\" as "Data.Bool./\\"
  interpret: const "HOL4.bool.\\/" as "Data.Bool.\\/"
  interpret: const "HOL4.min.==>" as "Data.Bool.==>"
  interpret: const "HOL4.bool.~" as "Data.Bool.~"
  interpret: const "HOL4.bool.COND" as "Data.Bool.cond"
  interpret: const "HOL4.bool.ONE_ONE" as "Function.injective"
  interpret: const "HOL4.bool.ONTO" as "Function.surjective"
}
proofs {
  import: bool

  article: "prove_base_assums.ot.art"

  interpret: type "HOL4.min.ind" as "ind"
  interpret: const "HOL4.min.@" as "select"
  interpret: const "HOL4.bool.!" as "Data.Bool.!"
  interpret: const "HOL4.bool.?" as "Data.Bool.?"
  interpret: const "HOL4.bool.?!" as "Data.Bool.?!"
  interpret: const "HOL4.bool.T" as "Data.Bool.T"
  interpret: const "HOL4.bool.F" as "Data.Bool.F"
  interpret: const "HOL4.bool./\\" as "Data.Bool./\\"
  interpret: const "HOL4.bool.\\/" as "Data.Bool.\\/"
  interpret: const "HOL4.min.==>" as "Data.Bool.==>"
  interpret: const "HOL4.bool.~" as "Data.Bool.~"
  interpret: const "HOL4.bool.COND" as "Data.Bool.cond"
  interpret: const "HOL4.bool.ONE_ONE" as "Function.injective"
  interpret: const "HOL4.bool.ONTO" as "Function.surjective"

  interpret: type "HOL4.prove_base_assums.itself" as "HOL4.bool.itself"
  interpret: const "HOL4.prove_base_assums.the_value" as "HOL4.bool.the_value"

  interpret: const "HOL4.prove_base_assums.Function_o" as "Function.o"
  interpret: const "HOL4.prove_base_assums.Function_const" as "Function.const"
  interpret: const "HOL4.prove_base_assums.Function_id" as "Function.id"
  interpret: const "HOL4.prove_base_assums.Function_flip" as "Function.flip"
  interpret: const "HOL4.prove_base_assums.Function_Combinator_s" as "Function.Combinator.s"
  interpret: const "HOL4.prove_base_assums.Function_Combinator_w" as "Function.Combinator.w"

  interpret: const "HOL4.prove_base_assums.Relation_transitiveClosure" as "Relation.transitiveClosure"
  interpret: const "HOL4.prove_base_assums.Relation_reflexive" as "Relation.reflexive"
  interpret: const "HOL4.prove_base_assums.Relation_irreflexive" as "Relation.irreflexive"
  interpret: const "HOL4.prove_base_assums.Relation_transitive" as "Relation.transitive"
  interpret: const "HOL4.prove_base_assums.Relation_union" as "Relation.union"
  interpret: const "HOL4.prove_base_assums.Relation_intersect" as "Relation.intersect"
  interpret: const "HOL4.prove_base_assums.Relation_universe" as "Relation.universe"
  interpret: const "HOL4.prove_base_assums.Relation_empty" as "Relation.empty"
  interpret: const "HOL4.prove_base_assums.Relation_subrelation" as "Relation.subrelation"
  interpret: const "HOL4.prove_base_assums.Relation_wellFounded" as "Relation.wellFounded"
  interpret: const "HOL4.prove_base_assums.Relation_toSet" as "Relation.toSet"
  interpret: const "HOL4.prove_base_assums.Relation_fromSet" as "Relation.fromSet"
  interpret: const "HOL4.prove_base_assums.Relation_bigIntersect" as "Relation.bigIntersect"

  interpret: type "HOL4.prove_base_assums.Data_Option_option" as "Data.Option.option"
  interpret: const "HOL4.prove_base_assums.Data_Option_some" as "Data.Option.some"
  interpret: const "HOL4.prove_base_assums.Data_Option_none" as "Data.Option.none"
  interpret: const "HOL4.prove_base_assums.Data_Option_isNone" as "Data.Option.isNone"
  interpret: const "HOL4.prove_base_assums.Data_Option_isSome" as "Data.Option.isSome"
  interpret: const "HOL4.prove_base_assums.Data_Option_map" as "Data.Option.map"

  interpret: type "HOL4.prove_base_assums.Data_Unit_unit" as "Data.Unit.unit"
  interpret: const "HOL4.prove_base_assums.Data_Unit_unit" as "Data.Unit.()"

  interpret: type "HOL4.prove_base_assums.Data_Sum_sum" as "Data.Sum.+"
  interpret: const "HOL4.prove_base_assums.Data_Sum_left" as "Data.Sum.left"
  interpret: const "HOL4.prove_base_assums.Data_Sum_right" as "Data.Sum.right"
  interpret: const "HOL4.prove_base_assums.Data_Sum_isLeft" as "Data.Sum.isLeft"
  interpret: const "HOL4.prove_base_assums.Data_Sum_isRight" as "Data.Sum.isRight"
  interpret: const "HOL4.prove_base_assums.Data_Sum_destLeft" as "Data.Sum.destLeft"
  interpret: const "HOL4.prove_base_assums.Data_Sum_destRight" as "Data.Sum.destRight"
  interpret: const "HOL4.prove_base_assums.Data_Sum_case_left_right" as "Data.Sum.case.left.right"

  interpret: type "HOL4.prove_base_assums.Data_Pair_prod" as "Data.Pair.*"
  interpret: const "HOL4.prove_base_assums.Data_Pair_comma" as "Data.Pair.,"
  interpret: const "HOL4.prove_base_assums.Data_Pair_fst" as "Data.Pair.fst"
  interpret: const "HOL4.prove_base_assums.Data_Pair_snd" as "Data.Pair.snd"

  interpret: type "HOL4.prove_base_assums.Number_Natural_natural" as "Number.Natural.natural"
  interpret: const "HOL4.prove_base_assums.Number_Natural_zero" as "Number.Natural.zero"
  interpret: const "HOL4.prove_base_assums.Number_Natural_suc" as "Number.Natural.suc"
  interpret: const "HOL4.prove_base_assums.Number_Natural_less" as "Number.Natural.<"
  interpret: const "HOL4.prove_base_assums.Number_Natural_pre" as "Number.Natural.pre"

  interpret: const "HOL4.prove_base_assums.Number_Natural_times" as "Number.Natural.*"
  interpret: const "HOL4.prove_base_assums.Number_Natural_plus" as "Number.Natural.+"
  interpret: const "HOL4.prove_base_assums.Number_Natural_minus" as "Number.Natural.-"
  interpret: const "HOL4.prove_base_assums.Number_Natural_lesseq" as "Number.Natural.<="
  interpret: const "HOL4.prove_base_assums.Number_Natural_greater" as "Number.Natural.>"
  interpret: const "HOL4.prove_base_assums.Number_Natural_greatereq" as "Number.Natural.>="
  interpret: const "HOL4.prove_base_assums.Number_Natural_min" as "Number.Natural.min"
  interpret: const "HOL4.prove_base_assums.Number_Natural_max" as "Number.Natural.max"
  interpret: const "HOL4.prove_base_assums.Number_Natural_div" as "Number.Natural.div"
  interpret: const "HOL4.prove_base_assums.Number_Natural_mod" as "Number.Natural.mod"
  interpret: const "HOL4.prove_base_assums.Number_Natural_even" as "Number.Natural.even"
  interpret: const "HOL4.prove_base_assums.Number_Natural_odd" as "Number.Natural.odd"
  interpret: const "HOL4.prove_base_assums.Number_Natural_log" as "Number.Natural.log"
  interpret: const "HOL4.prove_base_assums.Number_Natural_power" as "Number.Natural.^"
  interpret: const "HOL4.prove_base_assums.Number_Natural_factorial" as "Number.Natural.factorial"
  interpret: const "HOL4.prove_base_assums.Number_Natural_bit0" as "Number.Natural.bit0"
  interpret: const "HOL4.prove_base_assums.Number_Natural_bit1" as "Number.Natural.bit1"

  interpret: type "HOL4.prove_base_assums.Data_List_list" as "Data.List.list"
  interpret: const "HOL4.prove_base_assums.Data_List_nil" as "Data.List.[]"
  interpret: const "HOL4.prove_base_assums.Data_List_cons" as "Data.List.::"
  interpret: const "HOL4.prove_base_assums.Data_List_length" as "Data.List.length"
  interpret: const "HOL4.prove_base_assums.Data_List_append" as "Data.List.@"
  interpret: const "HOL4.prove_base_assums.Data_List_map" as "Data.List.map"
  interpret: const "HOL4.prove_base_assums.Data_List_reverse" as "Data.List.reverse"
  interpret: const "HOL4.prove_base_assums.Data_List_head" as "Data.List.head"
  interpret: const "HOL4.prove_base_assums.Data_List_tail" as "Data.List.tail"
  interpret: const "HOL4.prove_base_assums.Data_List_all" as "Data.List.all"
  interpret: const "HOL4.prove_base_assums.Data_List_any" as "Data.List.any"
  interpret: const "HOL4.prove_base_assums.Data_List_concat" as "Data.List.concat"
  interpret: const "HOL4.prove_base_assums.Data_List_filter" as "Data.List.filter"
  interpret: const "HOL4.prove_base_assums.Data_List_null" as "Data.List.null"
  interpret: const "HOL4.prove_base_assums.Data_List_last" as "Data.List.last"
  interpret: const "HOL4.prove_base_assums.Data_List_unzip" as "Data.List.unzip"

  interpret: type "HOL4.prove_base_assums.Set_set" as "Set.set"
  interpret: const "HOL4.prove_base_assums.Set_empty" as "Set.{}"
  interpret: const "HOL4.prove_base_assums.Set_member" as "Set.member"
  interpret: const "HOL4.prove_base_assums.Set_fromPredicate" as "Set.fromPredicate"
  interpret: const "HOL4.prove_base_assums.Set_union" as "Set.union"
  interpret: const "HOL4.prove_base_assums.Set_intersect" as "Set.intersect"
}

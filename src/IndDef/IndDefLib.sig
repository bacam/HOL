signature IndDefLib =
sig
  include Abbrev
  type monoset = InductiveDefinition.monoset

  val term_of       : term quotation -> term
  val term_of_absyn : Absyn.absyn -> term

  val Hol_reln      : term quotation -> thm * thm * thm
  val prim_Hol_reln : monoset -> term -> thm * thm * thm

end

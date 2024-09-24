
%--------------------------------------------------------------------------
% File     : SET194+3 : TPTP v8.2.0. Released v2.2.0.
% Domain   : Set Theory
% Problem  : X is a subset of the union of X and Y
% Version  : [Try90] axioms : Reduced > Incomplete.
% English  :

% Refs     : [ILF] The ILF Group (1998), The ILF System: A Tool for the Int
%          : [<a href=SeeTPTP?Category=BibTeX&File=Try90>Try90</a>] Trybulec (1990), Tarski Grothendieck Set Theory
%          : [<a href=SeeTPTP?Category=BibTeX&File=TS89>TS89</a>]  Trybulec & Swieczkowska (1989), Boolean Properties of
% Source   : [ILF]
% Names    : BOOLE (31) [TS89]

% Status   : Theorem
% Rating   : 0.08 v8.1.0, 0.06 v7.4.0, 0.07 v7.2.0, 0.03 v7.1.0, 0.00 v6.4.0, 0.04 v6.2.0, 0.00 v6.1.0, 0.03 v6.0.0, 0.04 v5.4.0, 0.11 v5.3.0, 0.15 v5.2.0, 0.00 v5.0.0, 0.04 v4.0.1, 0.09 v4.0.0, 0.08 v3.7.0, 0.05 v3.3.0, 0.07 v3.2.0, 0.18 v3.1.0, 0.11 v2.7.0, 0.00 v2.2.1
% Syntax   : Number of formulae    :    6 (   3 unt;   0 def)
%            Number of atoms       :   12 (   2 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :    6 (   0   ~;   1   |;   0   &)
%                                         (   4 <=>;   1  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    6 (   4 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    3 (   2 usr;   0 prp; 2-2 aty)
%            Number of functors    :    1 (   1 usr;   0 con; 2-2 aty)
%            Number of variables   :   14 (  14   !;   0   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%---- line(boole - df(2),1833042)
fof(union_defn,axiom,
    ! [B,C,D] :
      ( member(D,union(B,C))
    <=> ( member(D,B)
        | member(D,C) ) ) ).

%---- line(tarski - df(3),1832749)
fof(subset_defn,axiom,
    ! [B,C] :
      ( subset(B,C)
    <=> ! [D] :
          ( member(D,B)
         => member(D,C) ) ) ).

%---- property(commutativity,op(union,2,function))
fof(commutativity_of_union,axiom,
    ! [B,C] : union(B,C) = union(C,B) ).

%---- property(reflexivity,op(subset,2,predicate))
fof(reflexivity_of_subset,axiom,
    ! [B] : subset(B,B) ).

%---- line(hidden - axiom35,1832615)
fof(equal_member_defn,axiom,
    ! [B,C] :
      ( B = C
    <=> ! [D] :
          ( member(D,B)
        <=> member(D,C) ) ) ).

%---- line(boole - th(31),1833190)
fof(prove_subset_of_union,conjecture,
    ! [B,C] : subset(B,union(B,C)) ).

%--------------------------------------------------------------------------

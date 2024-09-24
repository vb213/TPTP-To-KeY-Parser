
%--------------------------------------------------------------------------
% File     : SET063+3 : TPTP v8.2.0. Released v2.2.0.
% Domain   : Set Theory
% Problem  : If X is a subset of the empty set, then X is the empty set
% Version  : [Try90] axioms : Reduced > Incomplete.
% English  :

% Refs     : [ILF] The ILF Group (1998), The ILF System: A Tool for the Int
%          : [<a href=SeeTPTP?Category=BibTeX&File=Try90>Try90</a>] Trybulec (1990), Tarski Grothendieck Set Theory
%          : [<a href=SeeTPTP?Category=BibTeX&File=TS89>TS89</a>]  Trybulec & Swieczkowska (1989), Boolean Properties of
% Source   : [ILF]
% Names    : BOOLE (30) [TS89]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.03 v6.0.0, 0.00 v5.3.0, 0.07 v5.2.0, 0.00 v2.5.0, 0.33 v2.4.0, 0.33 v2.2.1
% Syntax   : Number of formulae    :    7 (   3 unt;   0 def)
%            Number of atoms       :   13 (   2 equ)
%            Maximal formula atoms :    3 (   1 avg)
%            Number of connectives :    8 (   2   ~;   0   |;   1   &)
%                                         (   3 <=>;   2  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    6 (   4 avg)
%            Maximal term depth    :    1 (   1 avg)
%            Number of predicates  :    4 (   3 usr;   0 prp; 1-2 aty)
%            Number of functors    :    1 (   1 usr;   1 con; 0-0 aty)
%            Number of variables   :   11 (  11   !;   0   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%---- line(boole - th(27),1833153)
fof(empty_set_subset,axiom,
    ! [B] : subset(empty_set,B) ).

%---- line(hidden - axiom31,1832636)
fof(empty_set_defn,axiom,
    ! [B] : ~ member(B,empty_set) ).

%---- line(tarski - df(3),1832749)
fof(subset_defn,axiom,
    ! [B,C] :
      ( subset(B,C)
    <=> ! [D] :
          ( member(D,B)
         => member(D,C) ) ) ).

%---- line(boole - df(8),1833103)
fof(equal_defn,axiom,
    ! [B,C] :
      ( B = C
    <=> ( subset(B,C)
        & subset(C,B) ) ) ).

%---- property(reflexivity,op(subset,2,predicate))
fof(reflexivity_of_subset,axiom,
    ! [B] : subset(B,B) ).

%---- line(hidden - axiom33,1832628)
fof(empty_defn,axiom,
    ! [B] :
      ( empty(B)
    <=> ! [C] : ~ member(C,B) ) ).

%---- line(boole - th(30),1833179)
fof(prove_subset_of_empty_set_is_empty_set,conjecture,
    ! [B] :
      ( subset(B,empty_set)
     => B = empty_set ) ).

%--------------------------------------------------------------------------

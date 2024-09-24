
%--------------------------------------------------------------------------
% File     : SET602+3 : TPTP v8.2.0. Released v2.2.0.
% Domain   : Set Theory
% Problem  : The difference of X and X is the empty set
% Version  : [Try90] axioms : Reduced > Incomplete.
% English  :

% Refs     : [ILF] The ILF Group (1998), The ILF System: A Tool for the Int
%          : [<a href=SeeTPTP?Category=BibTeX&File=Try90>Try90</a>] Trybulec (1990), Tarski Grothendieck Set Theory
%          : [<a href=SeeTPTP?Category=BibTeX&File=TS89>TS89</a>]  Trybulec & Swieczkowska (1989), Boolean Properties of
% Source   : [ILF]
% Names    : BOOLE (73) [TS89]

% Status   : Theorem
% Rating   : 0.00 v6.4.0, 0.04 v6.3.0, 0.00 v5.3.0, 0.04 v5.2.0, 0.00 v2.3.0, 0.33 v2.2.1
% Syntax   : Number of formulae    :    8 (   3 unt;   0 def)
%            Number of atoms       :   16 (   3 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :   11 (   3   ~;   0   |;   2   &)
%                                         (   5 <=>;   1  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    7 (   4 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    4 (   3 usr;   0 prp; 1-2 aty)
%            Number of functors    :    2 (   2 usr;   1 con; 0-2 aty)
%            Number of variables   :   15 (  15   !;   0   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%---- line(boole - th(45),1833405)
fof(difference_empty_set,axiom,
    ! [B,C] :
      ( difference(B,C) = empty_set
    <=> subset(B,C) ) ).

%---- line(hidden - axiom119,1832636)
fof(empty_set_defn,axiom,
    ! [B] : ~ member(B,empty_set) ).

%---- line(boole - df(4),1833078)
fof(difference_defn,axiom,
    ! [B,C,D] :
      ( member(D,difference(B,C))
    <=> ( member(D,B)
        & ~ member(D,C) ) ) ).

%---- line(boole - df(8),1833103)
fof(equal_defn,axiom,
    ! [B,C] :
      ( B = C
    <=> ( subset(B,C)
        & subset(C,B) ) ) ).

%---- line(tarski - df(3),1832749)
fof(subset_defn,axiom,
    ! [B,C] :
      ( subset(B,C)
    <=> ! [D] :
          ( member(D,B)
         => member(D,C) ) ) ).

%---- property(reflexivity,op(subset,2,predicate))
fof(reflexivity_of_subset,axiom,
    ! [B] : subset(B,B) ).

%---- line(hidden - axiom121,1832628)
fof(empty_defn,axiom,
    ! [B] :
      ( empty(B)
    <=> ! [C] : ~ member(C,B) ) ).

%---- line(boole - th(73),1833852)
fof(prove_self_difference_is_empty_set,conjecture,
    ! [B] : difference(B,B) = empty_set ).

%--------------------------------------------------------------------------

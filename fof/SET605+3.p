
%--------------------------------------------------------------------------
% File     : SET605+3 : TPTP v8.2.0. Released v2.2.0.
% Domain   : Set Theory
% Problem  : The difference of X and the union of X and Y is the empty set
% Version  : [Try90] axioms : Reduced > Incomplete.
% English  :

% Refs     : [ILF] The ILF Group (1998), The ILF System: A Tool for the Int
%          : [<a href=SeeTPTP?Category=BibTeX&File=Try90>Try90</a>] Trybulec (1990), Tarski Grothendieck Set Theory
%          : [<a href=SeeTPTP?Category=BibTeX&File=TS89>TS89</a>]  Trybulec & Swieczkowska (1989), Boolean Properties of
% Source   : [ILF]
% Names    : BOOLE (76) [TS89]

% Status   : Theorem
% Rating   : 0.03 v8.1.0, 0.06 v7.4.0, 0.00 v6.4.0, 0.04 v6.2.0, 0.08 v6.1.0, 0.17 v6.0.0, 0.13 v5.5.0, 0.07 v5.4.0, 0.11 v5.3.0, 0.15 v5.2.0, 0.00 v5.0.0, 0.08 v4.1.0, 0.13 v4.0.1, 0.17 v3.7.0, 0.10 v3.5.0, 0.11 v3.4.0, 0.05 v3.3.0, 0.14 v3.2.0, 0.09 v3.1.0, 0.11 v2.7.0, 0.00 v2.3.0, 0.33 v2.2.1
% Syntax   : Number of formulae    :   12 (   5 unt;   0 def)
%            Number of atoms       :   24 (   5 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :   15 (   3   ~;   1   |;   2   &)
%                                         (   8 <=>;   1  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    7 (   4 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    4 (   3 usr;   0 prp; 1-2 aty)
%            Number of functors    :    3 (   3 usr;   1 con; 0-2 aty)
%            Number of variables   :   26 (  26   !;   0   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%---- line(boole - th(31),1833190)
fof(subset_of_union,axiom,
    ! [B,C] : subset(B,union(B,C)) ).

%---- line(boole - th(45),1833405)
fof(difference_empty_set,axiom,
    ! [B,C] :
      ( difference(B,C) = empty_set
    <=> subset(B,C) ) ).

%---- line(boole - df(2),1833042)
fof(union_defn,axiom,
    ! [B,C,D] :
      ( member(D,union(B,C))
    <=> ( member(D,B)
        | member(D,C) ) ) ).

%---- line(hidden - axiom129,1832636)
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

%---- property(commutativity,op(union,2,function))
fof(commutativity_of_union,axiom,
    ! [B,C] : union(B,C) = union(C,B) ).

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

%---- line(hidden - axiom131,1832628)
fof(empty_defn,axiom,
    ! [B] :
      ( empty(B)
    <=> ! [C] : ~ member(C,B) ) ).

%---- line(hidden - axiom132,1832615)
fof(equal_member_defn,axiom,
    ! [B,C] :
      ( B = C
    <=> ! [D] :
          ( member(D,B)
        <=> member(D,C) ) ) ).

%---- line(boole - th(76),1833872)
fof(prove_th76,conjecture,
    ! [B,C] : difference(B,union(B,C)) = empty_set ).

%--------------------------------------------------------------------------

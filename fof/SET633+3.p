
%--------------------------------------------------------------------------
% File     : SET633+3 : TPTP v8.2.0. Released v2.2.0.
% Domain   : Set Theory
% Problem  : If X \ Y (= Z and Y \ X (= Z, then X sym\ Y (= Z
% Version  : [Try90] axioms : Reduced > Incomplete.
% English  : If the difference of X and Y is a subset of Z and the
%            difference of Y and X is a subset of Z, then the symmetric
%            difference of X and Y is a subset of Z.

% Refs     : [ILF] The ILF Group (1998), The ILF System: A Tool for the Int
%          : [<a href=SeeTPTP?Category=BibTeX&File=Try90>Try90</a>] Trybulec (1990), Tarski Grothendieck Set Theory
%          : [<a href=SeeTPTP?Category=BibTeX&File=TS89>TS89</a>]  Trybulec & Swieczkowska (1989), Boolean Properties of
% Source   : [ILF]
% Names    : BOOLE (115) [TS89]

% Status   : Theorem
% Rating   : 0.11 v8.1.0, 0.08 v7.5.0, 0.09 v7.4.0, 0.03 v7.1.0, 0.00 v7.0.0, 0.03 v6.4.0, 0.08 v6.3.0, 0.00 v6.2.0, 0.08 v6.1.0, 0.13 v6.0.0, 0.09 v5.5.0, 0.07 v5.4.0, 0.11 v5.3.0, 0.15 v5.2.0, 0.00 v5.0.0, 0.08 v4.1.0, 0.09 v4.0.1, 0.13 v4.0.0, 0.12 v3.7.0, 0.10 v3.5.0, 0.11 v3.4.0, 0.05 v3.3.0, 0.07 v3.2.0, 0.09 v3.1.0, 0.11 v2.7.0, 0.00 v2.5.0, 0.12 v2.4.0, 0.25 v2.3.0, 0.33 v2.2.1
% Syntax   : Number of formulae    :    9 (   4 unt;   0 def)
%            Number of atoms       :   19 (   4 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :   11 (   1   ~;   0   |;   3   &)
%                                         (   4 <=>;   3  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    7 (   5 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    3 (   2 usr;   0 prp; 2-2 aty)
%            Number of functors    :    3 (   3 usr;   0 con; 2-2 aty)
%            Number of variables   :   22 (  22   !;   0   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%---- line(boole - df(7),1833089)
fof(symmetric_difference_defn,axiom,
    ! [B,C] : symmetric_difference(B,C) = union(difference(B,C),difference(C,B)) ).

%---- line(boole - th(32),1833206)
fof(union_subset,axiom,
    ! [B,C,D] :
      ( ( subset(B,C)
        & subset(D,C) )
     => subset(union(B,D),C) ) ).

%---- line(boole - df(4),1833078)
fof(difference_defn,axiom,
    ! [B,C,D] :
      ( member(D,difference(B,C))
    <=> ( member(D,B)
        & ~ member(D,C) ) ) ).

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

%---- property(commutativity,op(symmetric_difference,2,function))
fof(commutativity_of_symmetric_difference,axiom,
    ! [B,C] : symmetric_difference(B,C) = symmetric_difference(C,B) ).

%---- line(hidden - axiom210,1832615)
fof(equal_member_defn,axiom,
    ! [B,C] :
      ( B = C
    <=> ! [D] :
          ( member(D,B)
        <=> member(D,C) ) ) ).

%---- property(reflexivity,op(subset,2,predicate))
fof(reflexivity_of_subset,axiom,
    ! [B] : subset(B,B) ).

%---- line(boole - th(115),1834412)
fof(prove_th115,conjecture,
    ! [B,C,D] :
      ( ( subset(difference(B,C),D)
        & subset(difference(C,B),D) )
     => subset(symmetric_difference(B,C),D) ) ).

%--------------------------------------------------------------------------

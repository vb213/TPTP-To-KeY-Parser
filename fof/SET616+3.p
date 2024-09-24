
%--------------------------------------------------------------------------
% File     : SET616+3 : TPTP v8.2.0. Released v2.2.0.
% Domain   : Set Theory
% Problem  : If X \ Y = Y \ X, then X = Y
% Version  : [Try90] axioms : Reduced > Incomplete.
% English  : If the difference of X and Y is the difference of Y and X, then
%            X is Y.

% Refs     : [ILF] The ILF Group (1998), The ILF System: A Tool for the Int
%          : [<a href=SeeTPTP?Category=BibTeX&File=Try90>Try90</a>] Trybulec (1990), Tarski Grothendieck Set Theory
%          : [<a href=SeeTPTP?Category=BibTeX&File=TS89>TS89</a>]  Trybulec & Swieczkowska (1989), Boolean Properties of
% Source   : [ILF]
% Names    : BOOLE (90) [TS89]

% Status   : Theorem
% Rating   : 0.19 v8.2.0, 0.17 v8.1.0, 0.11 v7.5.0, 0.12 v7.4.0, 0.10 v7.2.0, 0.07 v7.1.0, 0.04 v7.0.0, 0.03 v6.4.0, 0.08 v6.2.0, 0.12 v6.1.0, 0.13 v6.0.0, 0.22 v5.5.0, 0.11 v5.4.0, 0.14 v5.3.0, 0.26 v5.2.0, 0.10 v5.0.0, 0.12 v4.1.0, 0.13 v4.0.1, 0.17 v3.7.0, 0.10 v3.5.0, 0.11 v3.4.0, 0.05 v3.3.0, 0.14 v3.2.0, 0.27 v3.1.0, 0.33 v2.7.0, 0.17 v2.6.0, 0.14 v2.5.0, 0.00 v2.2.1
% Syntax   : Number of formulae    :    7 (   1 unt;   0 def)
%            Number of atoms       :   18 (   5 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :   12 (   1   ~;   0   |;   2   &)
%                                         (   6 <=>;   3  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    7 (   5 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    3 (   2 usr;   0 prp; 2-2 aty)
%            Number of functors    :    1 (   1 usr;   0 con; 2-2 aty)
%            Number of variables   :   17 (  17   !;   0   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%---- line(tarski - th(2),1832736)
fof(member_equal,axiom,
    ! [B,C] :
      ( ! [D] :
          ( member(D,B)
        <=> member(D,C) )
     => B = C ) ).

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

%---- line(hidden - axiom163,1832615)
fof(equal_member_defn,axiom,
    ! [B,C] :
      ( B = C
    <=> ! [D] :
          ( member(D,B)
        <=> member(D,C) ) ) ).

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

%---- line(boole - th(90),1834200)
fof(prove_th90,conjecture,
    ! [B,C] :
      ( difference(B,C) = difference(C,B)
     => B = C ) ).

%--------------------------------------------------------------------------

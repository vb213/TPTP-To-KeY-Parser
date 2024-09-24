
%--------------------------------------------------------------------------
% File     : SET589+3 : TPTP v8.2.0. Released v2.2.0.
% Domain   : Set Theory
% Problem  : If X (= Y and Z (= V, then X \ V (= Y \ Z
% Version  : [Try90] axioms : Reduced > Incomplete.
% English  : If X is a subset of Y and Z is a subset of V, then the
%            difference of X and V is a subset of the difference of Y and Z.

% Refs     : [ILF] The ILF Group (1998), The ILF System: A Tool for the Int
%          : [<a href=SeeTPTP?Category=BibTeX&File=Try90>Try90</a>] Trybulec (1990), Tarski Grothendieck Set Theory
%          : [<a href=SeeTPTP?Category=BibTeX&File=TS89>TS89</a>]  Trybulec & Swieczkowska (1989), Boolean Properties of
% Source   : [ILF]
% Names    : BOOLE (48) [TS89]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.13 v5.2.0, 0.00 v2.2.1
% Syntax   : Number of formulae    :    7 (   1 unt;   0 def)
%            Number of atoms       :   17 (   0 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :   11 (   1   ~;   0   |;   3   &)
%                                         (   2 <=>;   5  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    7 (   5 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    2 (   2 usr;   0 prp; 2-2 aty)
%            Number of functors    :    1 (   1 usr;   0 con; 2-2 aty)
%            Number of variables   :   20 (  20   !;   0   ?)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%--------------------------------------------------------------------------
%---- line(boole - th(29),1833172)
fof(transitivity_of_subset,axiom,
    ! [B,C,D] :
      ( ( subset(B,C)
        & subset(C,D) )
     => subset(B,D) ) ).

%---- line(boole - th(46),1833421)
fof(difference_subset1,axiom,
    ! [B,C,D] :
      ( subset(B,C)
     => subset(difference(B,D),difference(C,D)) ) ).

%---- line(boole - th(47),1833437)
fof(difference_subset2,axiom,
    ! [B,C,D] :
      ( subset(B,C)
     => subset(difference(D,C),difference(D,B)) ) ).

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

%---- property(reflexivity,op(subset,2,predicate))
fof(reflexivity_of_subset,axiom,
    ! [B] : subset(B,B) ).

%---- line(boole - th(48),1833454)
fof(prove_th48,conjecture,
    ! [B,C,D,E] :
      ( ( subset(B,C)
        & subset(D,E) )
     => subset(difference(B,E),difference(C,D)) ) ).

%--------------------------------------------------------------------------

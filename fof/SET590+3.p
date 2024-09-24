
%--------------------------------------------------------------------------
% File     : SET590+3 : TPTP v8.2.0. Released v2.2.0.
% Domain   : Set Theory
% Problem  : The difference of X and Y is a subset of X
% Version  : [Try90] axioms : Reduced > Incomplete.
% English  :

% Refs     : [ILF] The ILF Group (1998), The ILF System: A Tool for the Int
%          : [<a href=SeeTPTP?Category=BibTeX&File=Try90>Try90</a>] Trybulec (1990), Tarski Grothendieck Set Theory
%          : [<a href=SeeTPTP?Category=BibTeX&File=TS89>TS89</a>]  Trybulec & Swieczkowska (1989), Boolean Properties of
% Source   : [ILF]
% Names    : BOOLE (49) [TS89]

% Status   : Theorem
% Rating   : 0.06 v8.2.0, 0.00 v6.3.0, 0.08 v6.2.0, 0.00 v5.4.0, 0.04 v5.3.0, 0.13 v5.2.0, 0.00 v2.2.1
% Syntax   : Number of formulae    :    4 (   2 unt;   0 def)
%            Number of atoms       :    8 (   0 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :    5 (   1   ~;   0   |;   1   &)
%                                         (   2 <=>;   1  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    7 (   5 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    2 (   2 usr;   0 prp; 2-2 aty)
%            Number of functors    :    1 (   1 usr;   0 con; 2-2 aty)
%            Number of variables   :    9 (   9   !;   0   ?)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%--------------------------------------------------------------------------
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

%---- line(boole - th(49),1833463)
fof(prove_th49,conjecture,
    ! [B,C] : subset(difference(B,C),B) ).

%--------------------------------------------------------------------------

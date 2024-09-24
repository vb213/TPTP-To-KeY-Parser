
%--------------------------------------------------------------------------
% File     : SET027+3 : TPTP v8.2.0. Released v2.2.0.
% Domain   : Set Theory
% Problem  : Transitivity of subset
% Version  : [Try90] axioms : Reduced > Incomplete.
% English  : If X is a subset of Y and Y is a subset of Z, then X is a
%            subset of Z.

% Refs     : [ILF] The ILF Group (1998), The ILF System: A Tool for the Int
%          : [<a href=SeeTPTP?Category=BibTeX&File=Try90>Try90</a>] Trybulec (1990), Tarski Grothendieck Set Theory
%          : [<a href=SeeTPTP?Category=BibTeX&File=TS89>TS89</a>]  Trybulec & Swieczkowska (1989), Boolean Properties of
% Source   : [ILF]
% Names    : BOOLE (29) [TS89]

% Status   : Theorem
% Rating   : 0.00 v6.3.0, 0.08 v6.2.0, 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.04 v5.3.0, 0.13 v5.2.0, 0.00 v3.2.0, 0.11 v3.1.0, 0.00 v2.2.1
% Syntax   : Number of formulae    :    3 (   1 unt;   0 def)
%            Number of atoms       :    7 (   0 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :    4 (   0   ~;   0   |;   1   &)
%                                         (   1 <=>;   2  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    6 (   5 avg)
%            Maximal term depth    :    1 (   1 avg)
%            Number of predicates  :    2 (   2 usr;   0 prp; 2-2 aty)
%            Number of functors    :    0 (   0 usr;   0 con; --- aty)
%            Number of variables   :    7 (   7   !;   0   ?)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%--------------------------------------------------------------------------
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

%---- line(boole - th(29),1833172)
fof(prove_transitivity_of_subset,conjecture,
    ! [B,C,D] :
      ( ( subset(B,C)
        & subset(C,D) )
     => subset(B,D) ) ).

%--------------------------------------------------------------------------

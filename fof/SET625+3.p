
%--------------------------------------------------------------------------
% File     : SET625+3 : TPTP v8.2.0. Released v2.2.0.
% Domain   : Set Theory
% Problem  : If X intersects Y and Y is a subset of Z, then X intersects Z
% Version  : [Try90] axioms : Reduced > Incomplete.
% English  :

% Refs     : [ILF] The ILF Group (1998), The ILF System: A Tool for the Int
%          : [<a href=SeeTPTP?Category=BibTeX&File=Try90>Try90</a>] Trybulec (1990), Tarski Grothendieck Set Theory
%          : [<a href=SeeTPTP?Category=BibTeX&File=TS89>TS89</a>]  Trybulec & Swieczkowska (1989), Boolean Properties of
% Source   : [ILF]
% Names    : BOOLE (101) [TS89]

% Status   : Theorem
% Rating   : 0.00 v8.2.0, 0.07 v8.1.0, 0.00 v6.3.0, 0.08 v6.2.0, 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.04 v5.3.0, 0.13 v5.2.0, 0.00 v3.2.0, 0.11 v3.1.0, 0.00 v2.2.1
% Syntax   : Number of formulae    :    5 (   1 unt;   0 def)
%            Number of atoms       :   12 (   0 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :    7 (   0   ~;   0   |;   2   &)
%                                         (   2 <=>;   3  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    6 (   5 avg)
%            Maximal term depth    :    1 (   1 avg)
%            Number of predicates  :    3 (   3 usr;   0 prp; 2-2 aty)
%            Number of functors    :    0 (   0 usr;   0 con; --- aty)
%            Number of variables   :   12 (  11   !;   1   ?)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%--------------------------------------------------------------------------
%---- line(boole - df(5),1833080)
fof(intersect_defn,axiom,
    ! [B,C] :
      ( intersect(B,C)
    <=> ? [D] :
          ( member(D,B)
          & member(D,C) ) ) ).

%---- line(tarski - df(3),1832749)
fof(subset_defn,axiom,
    ! [B,C] :
      ( subset(B,C)
    <=> ! [D] :
          ( member(D,B)
         => member(D,C) ) ) ).

%---- property(symmetry,op(intersect,2,predicate))
fof(symmetry_of_intersect,axiom,
    ! [B,C] :
      ( intersect(B,C)
     => intersect(C,B) ) ).

%---- property(reflexivity,op(subset,2,predicate))
fof(reflexivity_of_subset,axiom,
    ! [B] : subset(B,B) ).

%---- line(boole - th(101),1834313)
fof(prove_th101,conjecture,
    ! [B,C,D] :
      ( ( intersect(B,C)
        & subset(C,D) )
     => intersect(B,D) ) ).

%--------------------------------------------------------------------------

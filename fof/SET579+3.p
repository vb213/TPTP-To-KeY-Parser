
%--------------------------------------------------------------------------
% File     : SET579+3 : TPTP v8.2.0. Released v2.2.0.
% Domain   : Set Theory
% Problem  : Trybulec's 20th Boolean property of sets
% Version  : [Try90] axioms : Reduced > Incomplete.
% English  :

% Refs     : [ILF] The ILF Group (1998), The ILF System: A Tool for the Int
%          : [<a href=SeeTPTP?Category=BibTeX&File=Try90>Try90</a>] Trybulec (1990), Tarski Grothendieck Set Theory
%          : [<a href=SeeTPTP?Category=BibTeX&File=TS89>TS89</a>]  Trybulec & Swieczkowska (1989), Boolean Properties of
% Source   : [ILF]
% Names    : BOOLE (20) [TS89]

% Status   : Theorem
% Rating   : 0.17 v8.1.0, 0.14 v7.5.0, 0.16 v7.4.0, 0.13 v7.3.0, 0.14 v7.2.0, 0.10 v7.1.0, 0.09 v7.0.0, 0.13 v6.4.0, 0.12 v6.3.0, 0.17 v6.2.0, 0.16 v6.1.0, 0.20 v6.0.0, 0.30 v5.5.0, 0.26 v5.4.0, 0.29 v5.3.0, 0.30 v5.2.0, 0.20 v5.1.0, 0.24 v5.0.0, 0.25 v4.1.0, 0.22 v4.0.1, 0.30 v4.0.0, 0.29 v3.7.0, 0.25 v3.5.0, 0.26 v3.4.0, 0.32 v3.3.0, 0.36 v3.1.0, 0.44 v2.7.0, 0.33 v2.6.0, 0.43 v2.5.0, 0.50 v2.4.0, 0.25 v2.3.0, 0.00 v2.2.1
% Syntax   : Number of formulae    :    5 (   1 unt;   0 def)
%            Number of atoms       :   14 (   2 equ)
%            Maximal formula atoms :    4 (   2 avg)
%            Number of connectives :   11 (   2   ~;   0   |;   3   &)
%                                         (   4 <=>;   2  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    9 (   6 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    3 (   2 usr;   0 prp; 2-2 aty)
%            Number of functors    :    1 (   1 usr;   0 con; 2-2 aty)
%            Number of variables   :   13 (  13   !;   0   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
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

%---- line(boole - th(20),1833115)
fof(prove_th20,conjecture,
    ! [B,C,D] :
      ( ! [E] :
          ( member(E,B)
        <=> ( member(E,C)
            & ~ member(E,D) ) ) )
     => B = difference(C,D) ).

%--------------------------------------------------------------------------

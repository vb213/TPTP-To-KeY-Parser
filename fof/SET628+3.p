
%--------------------------------------------------------------------------
% File     : SET628+3 : TPTP v8.2.0. Released v2.2.0.
% Domain   : Set Theory
% Problem  : X intersects X iff X is not the empty set
% Version  : [Try90] axioms : Reduced > Incomplete.
% English  :

% Refs     : [ILF] The ILF Group (1998), The ILF System: A Tool for the Int
%          : [<a href=SeeTPTP?Category=BibTeX&File=Try90>Try90</a>] Trybulec (1990), Tarski Grothendieck Set Theory
%          : [<a href=SeeTPTP?Category=BibTeX&File=TS89>TS89</a>]  Trybulec & Swieczkowska (1989), Boolean Properties of
% Source   : [ILF]
% Names    : BOOLE (110) [TS89]

% Status   : Theorem
% Rating   : 0.19 v8.2.0, 0.17 v8.1.0, 0.08 v7.5.0, 0.09 v7.4.0, 0.10 v7.2.0, 0.07 v7.1.0, 0.04 v7.0.0, 0.03 v6.4.0, 0.08 v6.1.0, 0.10 v6.0.0, 0.13 v5.5.0, 0.11 v5.3.0, 0.19 v5.2.0, 0.05 v5.0.0, 0.08 v4.1.0, 0.09 v4.0.1, 0.13 v4.0.0, 0.12 v3.7.0, 0.14 v3.5.0, 0.00 v3.4.0, 0.08 v3.3.0, 0.11 v3.2.0, 0.33 v3.1.0, 0.17 v2.7.0, 0.00 v2.5.0, 0.33 v2.4.0, 0.33 v2.2.1
% Syntax   : Number of formulae    :    7 (   1 unt;   0 def)
%            Number of atoms       :   15 (   2 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :   11 (   3   ~;   0   |;   1   &)
%                                         (   6 <=>;   1  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    6 (   5 avg)
%            Maximal term depth    :    1 (   1 avg)
%            Number of predicates  :    5 (   4 usr;   0 prp; 1-2 aty)
%            Number of functors    :    1 (   1 usr;   1 con; 0-0 aty)
%            Number of variables   :   14 (  13   !;   1   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%---- line(boole - df(5),1833080)
fof(intersect_defn,axiom,
    ! [B,C] :
      ( intersect(B,C)
    <=> ? [D] :
          ( member(D,B)
          & member(D,C) ) ) ).

%---- line(hidden - axiom194,1832636)
fof(empty_set_defn,axiom,
    ! [B] : ~ member(B,empty_set) ).

%---- line(hidden - axiom195,1832615)
fof(equal_member_defn,axiom,
    ! [B,C] :
      ( B = C
    <=> ! [D] :
          ( member(D,B)
        <=> member(D,C) ) ) ).

%---- line(hidden - axiom196,1832619)
fof(not_equal_defn,axiom,
    ! [B,C] :
      ( not_equal(B,C)
    <=> B != C ) ).

%---- property(symmetry,op(intersect,2,predicate))
fof(symmetry_of_intersect,axiom,
    ! [B,C] :
      ( intersect(B,C)
     => intersect(C,B) ) ).

%---- line(hidden - axiom198,1832628)
fof(empty_defn,axiom,
    ! [B] :
      ( empty(B)
    <=> ! [C] : ~ member(C,B) ) ).

%---- line(boole - th(110),1834348)
fof(prove_th110,conjecture,
    ! [B] :
      ( intersect(B,B)
    <=> not_equal(B,empty_set) ) ).

%--------------------------------------------------------------------------

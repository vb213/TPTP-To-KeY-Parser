
%--------------------------------------------------------------------------
% File     : SET629+3 : TPTP v8.2.0. Released v2.2.0.
% Domain   : Set Theory
% Problem  : X ^ Y is disjoint from X \ Y
% Version  : [Try90] axioms : Reduced > Incomplete.
% English  : The intersection of X and Y is disjoint from the difference of
%            X and Y.

% Refs     : [ILF] The ILF Group (1998), The ILF System: A Tool for the Int
%          : [<a href=SeeTPTP?Category=BibTeX&File=Try90>Try90</a>] Trybulec (1990), Tarski Grothendieck Set Theory
%          : [<a href=SeeTPTP?Category=BibTeX&File=TS89>TS89</a>]  Trybulec & Swieczkowska (1989), Boolean Properties of
% Source   : [ILF]
% Names    : BOOLE (111) [TS89]

% Status   : Theorem
% Rating   : 0.17 v7.5.0, 0.19 v7.4.0, 0.13 v7.3.0, 0.14 v7.2.0, 0.10 v7.1.0, 0.04 v7.0.0, 0.07 v6.4.0, 0.12 v6.3.0, 0.08 v6.1.0, 0.20 v6.0.0, 0.17 v5.5.0, 0.19 v5.4.0, 0.21 v5.3.0, 0.26 v5.2.0, 0.05 v5.0.0, 0.08 v4.1.0, 0.09 v4.0.1, 0.13 v4.0.0, 0.17 v3.7.0, 0.10 v3.5.0, 0.11 v3.4.0, 0.05 v3.3.0, 0.07 v3.2.0, 0.18 v3.1.0, 0.11 v2.7.0, 0.00 v2.2.1
% Syntax   : Number of formulae    :    8 (   2 unt;   0 def)
%            Number of atoms       :   18 (   2 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :   12 (   2   ~;   0   |;   3   &)
%                                         (   6 <=>;   1  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    7 (   5 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    4 (   3 usr;   0 prp; 2-2 aty)
%            Number of functors    :    2 (   2 usr;   0 con; 2-2 aty)
%            Number of variables   :   20 (  19   !;   1   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%---- line(boole - df(3),1833060)
fof(intersection_defn,axiom,
    ! [B,C,D] :
      ( member(D,intersection(B,C))
    <=> ( member(D,B)
        & member(D,C) ) ) ).

%---- line(boole - df(4),1833078)
fof(difference_defn,axiom,
    ! [B,C,D] :
      ( member(D,difference(B,C))
    <=> ( member(D,B)
        & ~ member(D,C) ) ) ).

%---- line(boole - df(5),1833080)
fof(intersect_defn,axiom,
    ! [B,C] :
      ( intersect(B,C)
    <=> ? [D] :
          ( member(D,B)
          & member(D,C) ) ) ).

%---- line(boole - axiom199,1833083)
fof(disjoint_defn,axiom,
    ! [B,C] :
      ( disjoint(B,C)
    <=> ~ intersect(B,C) ) ).

%---- property(commutativity,op(intersection,2,function))
fof(commutativity_of_intersection,axiom,
    ! [B,C] : intersection(B,C) = intersection(C,B) ).

%---- property(symmetry,op(intersect,2,predicate))
fof(symmetry_of_intersect,axiom,
    ! [B,C] :
      ( intersect(B,C)
     => intersect(C,B) ) ).

%---- line(hidden - axiom201,1832615)
fof(equal_member_defn,axiom,
    ! [B,C] :
      ( B = C
    <=> ! [D] :
          ( member(D,B)
        <=> member(D,C) ) ) ).

%---- line(boole - th(111),1834358)
fof(prove_intersection_and_difference_disjoint,conjecture,
    ! [B,C] : disjoint(intersection(B,C),difference(B,C)) ).

%--------------------------------------------------------------------------

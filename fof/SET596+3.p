
%--------------------------------------------------------------------------
% File     : SET596+3 : TPTP v8.2.0. Released v2.2.0.
% Domain   : Set Theory
% Problem  : If X (= Y and Y ^ Z = the empty set, then X ^ Z = the empty set
% Version  : [Try90] axioms : Reduced > Incomplete.
% English  : If X is a subset of Y and the intersection of Y and Z is the
%            empty set, then the intersection of X and Z is the empty set.

% Refs     : [ILF] The ILF Group (1998), The ILF System: A Tool for the Int
%          : [<a href=SeeTPTP?Category=BibTeX&File=Try90>Try90</a>] Trybulec (1990), Tarski Grothendieck Set Theory
%          : [<a href=SeeTPTP?Category=BibTeX&File=TS89>TS89</a>]  Trybulec & Swieczkowska (1989), Boolean Properties of
% Source   : [ILF]
% Names    : BOOLE (55) [TS89]

% Status   : Theorem
% Rating   : 0.06 v8.1.0, 0.08 v7.5.0, 0.09 v7.4.0, 0.00 v6.4.0, 0.04 v6.3.0, 0.08 v6.2.0, 0.12 v6.1.0, 0.20 v6.0.0, 0.17 v5.5.0, 0.07 v5.3.0, 0.19 v5.2.0, 0.00 v5.0.0, 0.12 v4.1.0, 0.09 v4.0.1, 0.13 v4.0.0, 0.12 v3.7.0, 0.10 v3.5.0, 0.11 v3.3.0, 0.07 v3.2.0, 0.09 v3.1.0, 0.11 v2.7.0, 0.00 v2.2.1
% Syntax   : Number of formulae    :   11 (   3 unt;   0 def)
%            Number of atoms       :   24 (   6 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :   15 (   2   ~;   0   |;   3   &)
%                                         (   6 <=>;   4  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    6 (   5 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    4 (   3 usr;   0 prp; 1-2 aty)
%            Number of functors    :    2 (   2 usr;   1 con; 0-2 aty)
%            Number of variables   :   24 (  24   !;   0   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%---- line(boole - th(30),1833179)
fof(subset_of_empty_set_is_empty_set,axiom,
    ! [B] :
      ( subset(B,empty_set)
     => B = empty_set ) ).

%---- line(boole - th(40),1833318)
fof(intersection_of_subset,axiom,
    ! [B,C,D] :
      ( subset(B,C)
     => subset(intersection(B,D),intersection(C,D)) ) ).

%---- line(hidden - axiom79,1832636)
fof(empty_set_defn,axiom,
    ! [B] : ~ member(B,empty_set) ).

%---- line(boole - df(3),1833060)
fof(intersection_defn,axiom,
    ! [B,C,D] :
      ( member(D,intersection(B,C))
    <=> ( member(D,B)
        & member(D,C) ) ) ).

%---- line(tarski - df(3),1832749)
fof(subset_defn,axiom,
    ! [B,C] :
      ( subset(B,C)
    <=> ! [D] :
          ( member(D,B)
         => member(D,C) ) ) ).

%---- line(boole - df(8),1833103)
fof(equal_defn,axiom,
    ! [B,C] :
      ( B = C
    <=> ( subset(B,C)
        & subset(C,B) ) ) ).

%---- property(commutativity,op(intersection,2,function))
fof(commutativity_of_intersection,axiom,
    ! [B,C] : intersection(B,C) = intersection(C,B) ).

%---- property(reflexivity,op(subset,2,predicate))
fof(reflexivity_of_subset,axiom,
    ! [B] : subset(B,B) ).

%---- line(hidden - axiom81,1832628)
fof(empty_defn,axiom,
    ! [B] :
      ( empty(B)
    <=> ! [C] : ~ member(C,B) ) ).

%---- line(hidden - axiom82,1832615)
fof(equal_member_defn,axiom,
    ! [B,C] :
      ( B = C
    <=> ! [D] :
          ( member(D,B)
        <=> member(D,C) ) ) ).

%---- line(boole - th(55),1833564)
fof(prove_th55,conjecture,
    ! [B,C,D] :
      ( ( subset(B,C)
        & intersection(C,D) = empty_set )
     => intersection(B,D) = empty_set ) ).

%--------------------------------------------------------------------------

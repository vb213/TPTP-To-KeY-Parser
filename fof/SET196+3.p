
%--------------------------------------------------------------------------
% File     : SET196+3 : TPTP v8.2.0. Released v2.2.0.
% Domain   : Set Theory
% Problem  : The intersection of X and Y is a subset of X
% Version  : [Try90] axioms : Reduced > Incomplete.
% English  :

% Refs     : [ILF] The ILF Group (1998), The ILF System: A Tool for the Int
%          : [<a href=SeeTPTP?Category=BibTeX&File=Try90>Try90</a>] Trybulec (1990), Tarski Grothendieck Set Theory
%          : [<a href=SeeTPTP?Category=BibTeX&File=TS89>TS89</a>]  Trybulec & Swieczkowska (1989), Boolean Properties of
% Source   : [ILF]
% Names    : BOOLE (37) [TS89]

% Status   : Theorem
% Rating   : 0.08 v7.5.0, 0.09 v7.4.0, 0.10 v7.2.0, 0.07 v7.1.0, 0.00 v7.0.0, 0.03 v6.4.0, 0.08 v6.3.0, 0.04 v6.2.0, 0.00 v6.1.0, 0.07 v6.0.0, 0.04 v5.4.0, 0.07 v5.3.0, 0.15 v5.2.0, 0.00 v5.0.0, 0.04 v4.0.1, 0.09 v4.0.0, 0.08 v3.7.0, 0.05 v3.3.0, 0.07 v3.2.0, 0.18 v3.1.0, 0.11 v2.7.0, 0.00 v2.2.1
% Syntax   : Number of formulae    :    6 (   3 unt;   0 def)
%            Number of atoms       :   12 (   2 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :    6 (   0   ~;   0   |;   1   &)
%                                         (   4 <=>;   1  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    6 (   4 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    3 (   2 usr;   0 prp; 2-2 aty)
%            Number of functors    :    1 (   1 usr;   0 con; 2-2 aty)
%            Number of variables   :   14 (  14   !;   0   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
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

%---- property(commutativity,op(intersection,2,function))
fof(commutativity_of_intersection,axiom,
    ! [B,C] : intersection(B,C) = intersection(C,B) ).

%---- property(reflexivity,op(subset,2,predicate))
fof(reflexivity_of_subset,axiom,
    ! [B] : subset(B,B) ).

%---- line(hidden - axiom45,1832615)
fof(equal_member_defn,axiom,
    ! [B,C] :
      ( B = C
    <=> ! [D] :
          ( member(D,B)
        <=> member(D,C) ) ) ).

%---- line(boole - th(37),1833277)
fof(prove_intersection_is_subset,conjecture,
    ! [B,C] : subset(intersection(B,C),B) ).

%--------------------------------------------------------------------------

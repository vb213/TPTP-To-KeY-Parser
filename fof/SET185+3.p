
%--------------------------------------------------------------------------
% File     : SET185+3 : TPTP v8.2.0. Released v2.2.0.
% Domain   : Set Theory
% Problem  : If X is a subset of  Y, then the union of X and Y is Y
% Version  : [Try90] axioms : Reduced > Incomplete.
% English  :

% Refs     : [ILF] The ILF Group (1998), The ILF System: A Tool for the Int
%          : [<a href=SeeTPTP?Category=BibTeX&File=Try90>Try90</a>] Trybulec (1990), Tarski Grothendieck Set Theory
%          : [<a href=SeeTPTP?Category=BibTeX&File=TS89>TS89</a>]  Trybulec & Swieczkowska (1989), Boolean Properties of
% Source   : [ILF]
% Names    : BOOLE (35) [TS89]

% Status   : Theorem
% Rating   : 0.11 v8.1.0, 0.06 v7.4.0, 0.07 v7.2.0, 0.03 v7.1.0, 0.04 v7.0.0, 0.07 v6.4.0, 0.08 v6.3.0, 0.12 v6.2.0, 0.08 v6.1.0, 0.10 v6.0.0, 0.26 v5.5.0, 0.11 v5.4.0, 0.18 v5.3.0, 0.22 v5.2.0, 0.00 v5.0.0, 0.08 v4.1.0, 0.13 v4.0.1, 0.17 v3.7.0, 0.10 v3.5.0, 0.11 v3.3.0, 0.07 v3.2.0, 0.18 v3.1.0, 0.11 v2.7.0, 0.00 v2.2.1
% Syntax   : Number of formulae    :    7 (   2 unt;   0 def)
%            Number of atoms       :   16 (   4 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :    9 (   0   ~;   1   |;   1   &)
%                                         (   5 <=>;   2  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    6 (   5 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    3 (   2 usr;   0 prp; 2-2 aty)
%            Number of functors    :    1 (   1 usr;   0 con; 2-2 aty)
%            Number of variables   :   16 (  16   !;   0   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%---- line(boole - df(2),1833042)
fof(union_defn,axiom,
    ! [B,C,D] :
      ( member(D,union(B,C))
    <=> ( member(D,B)
        | member(D,C) ) ) ).

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

%---- property(commutativity,op(union,2,function))
fof(commutativity_of_union,axiom,
    ! [B,C] : union(B,C) = union(C,B) ).

%---- property(reflexivity,op(subset,2,predicate))
fof(reflexivity_of_subset,axiom,
    ! [B] : subset(B,B) ).

%---- line(hidden - axiom43,1832615)
fof(equal_member_defn,axiom,
    ! [B,C] :
      ( B = C
    <=> ! [D] :
          ( member(D,B)
        <=> member(D,C) ) ) ).

%---- line(boole - th(35),1833266)
fof(prove_subset_union,conjecture,
    ! [B,C] :
      ( subset(B,C)
     => union(B,C) = C ) ).

%--------------------------------------------------------------------------

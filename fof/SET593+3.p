
%--------------------------------------------------------------------------
% File     : SET593+3 : TPTP v8.2.0. Released v2.2.0.
% Domain   : Set Theory
% Problem  : If X (= Y U Z, then X \ Y (= Z and X \ Z (= Y
% Version  : [Try90] axioms : Reduced > Incomplete.
% English  : If X is a subset of the union of Y and Z, then the difference
%            of X and Y is a subset of Z and the difference of X and Z is
%            a subset of Y.

% Refs     : [ILF] The ILF Group (1998), The ILF System: A Tool for the Int
%          : [<a href=SeeTPTP?Category=BibTeX&File=Try90>Try90</a>] Trybulec (1990), Tarski Grothendieck Set Theory
%          : [<a href=SeeTPTP?Category=BibTeX&File=TS89>TS89</a>]  Trybulec & Swieczkowska (1989), Boolean Properties of
% Source   : [ILF]
% Names    : BOOLE (52) [TS89]

% Status   : Theorem
% Rating   : 0.31 v8.2.0, 0.28 v8.1.0, 0.25 v7.5.0, 0.28 v7.4.0, 0.27 v7.3.0, 0.24 v7.2.0, 0.21 v7.1.0, 0.26 v7.0.0, 0.27 v6.4.0, 0.31 v6.3.0, 0.25 v6.2.0, 0.20 v6.1.0, 0.33 v6.0.0, 0.39 v5.5.0, 0.41 v5.4.0, 0.54 v5.3.0, 0.56 v5.2.0, 0.35 v5.1.0, 0.38 v5.0.0, 0.42 v4.1.0, 0.39 v4.0.1, 0.43 v4.0.0, 0.42 v3.7.0, 0.40 v3.5.0, 0.42 v3.3.0, 0.43 v3.2.0, 0.55 v3.1.0, 0.67 v2.7.0, 0.50 v2.6.0, 0.71 v2.5.0, 0.75 v2.4.0, 0.25 v2.3.0, 0.00 v2.2.1
% Syntax   : Number of formulae    :    7 (   2 unt;   0 def)
%            Number of atoms       :   17 (   2 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :   11 (   1   ~;   1   |;   2   &)
%                                         (   5 <=>;   2  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    7 (   5 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    3 (   2 usr;   0 prp; 2-2 aty)
%            Number of functors    :    2 (   2 usr;   0 con; 2-2 aty)
%            Number of variables   :   18 (  18   !;   0   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%---- line(boole - df(2),1833042)
fof(union_defn,axiom,
    ! [B,C,D] :
      ( member(D,union(B,C))
    <=> ( member(D,B)
        | member(D,C) ) ) ).

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

%---- property(commutativity,op(union,2,function))
fof(commutativity_of_union,axiom,
    ! [B,C] : union(B,C) = union(C,B) ).

%---- property(reflexivity,op(subset,2,predicate))
fof(reflexivity_of_subset,axiom,
    ! [B] : subset(B,B) ).

%---- line(hidden - axiom74,1832615)
fof(equal_member_defn,axiom,
    ! [B,C] :
      ( B = C
    <=> ! [D] :
          ( member(D,B)
        <=> member(D,C) ) ) ).

%---- line(boole - th(52),1833522)
fof(prove_th52,conjecture,
    ! [B,C,D] :
      ( subset(B,union(C,D))
     => ( subset(difference(B,C),D)
        & subset(difference(B,D),C) ) ) ).

%--------------------------------------------------------------------------

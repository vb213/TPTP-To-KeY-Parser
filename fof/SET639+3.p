
%--------------------------------------------------------------------------
% File     : SET639+3 : TPTP v8.2.0. Released v2.2.0.
% Domain   : Set Theory
% Problem  : Trybulec's 121th Boolean property of sets
% Version  : [Try89] axioms : Reduced > Incomplete.
% English  :

% Refs     : [ILF] The ILF Group (1998), The ILF System: A Tool for the Int
%          : [<a href=SeeTPTP?Category=BibTeX&File=Try89>Try89</a>] Trybulec (1989), Tarski Grothendieck Set Theory
%          : [<a href=SeeTPTP?Category=BibTeX&File=TS89>TS89</a>]  Trybulec & Swieczkowska (1989), Boolean Properties of
% Source   : [ILF]
% Names    : BOOLE (121) [TS89]

% Status   : Theorem
% Rating   : 0.03 v8.1.0, 0.00 v6.4.0, 0.04 v6.3.0, 0.08 v6.2.0, 0.04 v6.1.0, 0.07 v6.0.0, 0.09 v5.5.0, 0.04 v5.3.0, 0.15 v5.2.0, 0.00 v5.0.0, 0.08 v4.1.0, 0.04 v4.0.1, 0.09 v4.0.0, 0.08 v3.7.0, 0.05 v3.3.0, 0.07 v3.2.0, 0.09 v3.1.0, 0.11 v2.7.0, 0.00 v2.2.1
% Syntax   : Number of formulae    :   10 (   3 unt;   0 def)
%            Number of atoms       :   22 (   6 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :   14 (   2   ~;   0   |;   3   &)
%                                         (   6 <=>;   3  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    6 (   5 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    4 (   3 usr;   0 prp; 1-2 aty)
%            Number of functors    :    2 (   2 usr;   1 con; 0-2 aty)
%            Number of variables   :   21 (  21   !;   0   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%---- line(boole - th(42),1833351)
fof(subset_intersection,axiom,
    ! [B,C] :
      ( subset(B,C)
     => intersection(B,C) = B ) ).

%---- line(hidden - axiom232,1832636)
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

%---- line(hidden - axiom234,1832628)
fof(empty_defn,axiom,
    ! [B] :
      ( empty(B)
    <=> ! [C] : ~ member(C,B) ) ).

%---- line(hidden - axiom235,1832615)
fof(equal_member_defn,axiom,
    ! [B,C] :
      ( B = C
    <=> ! [D] :
          ( member(D,B)
        <=> member(D,C) ) ) ).

%---- line(boole - th(121),1834507)
fof(prove_th121,conjecture,
    ! [B,C] :
      ( ( subset(B,C)
        & intersection(C,B) = empty_set )
     => B = empty_set ) ).

%--------------------------------------------------------------------------

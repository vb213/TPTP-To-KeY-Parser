
%--------------------------------------------------------------------------
% File     : SET583+3 : TPTP v8.2.0. Released v2.2.0.
% Domain   : Set Theory
% Problem  : Extensionality
% Version  : [Try90] axioms : Reduced > Incomplete.
% English  :

% Refs     : [ILF] The ILF Group (1998), The ILF System: A Tool for the Int
%          : [<a href=SeeTPTP?Category=BibTeX&File=TS89>TS89</a>]  Trybulec & Swieczkowska (1989), Boolean Properties of
%          : [<a href=SeeTPTP?Category=BibTeX&File=Try90>Try90</a>] Trybulec (1990), Tarski Grothendieck Set Theory
% Source   : [ILF]
% Names    : BOOLE (28) [TS89]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.07 v5.2.0, 0.00 v2.5.0, 0.33 v2.4.0, 0.33 v2.2.1
% Syntax   : Number of formulae    :    4 (   1 unt;   0 def)
%            Number of atoms       :   10 (   2 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :    6 (   0   ~;   0   |;   2   &)
%                                         (   2 <=>;   2  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    6 (   5 avg)
%            Maximal term depth    :    1 (   1 avg)
%            Number of predicates  :    3 (   2 usr;   0 prp; 2-2 aty)
%            Number of functors    :    0 (   0 usr;   0 con; --- aty)
%            Number of variables   :    8 (   8   !;   0   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
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

%---- line(boole - th(28),1833154)
fof(prove_extensionality,conjecture,
    ! [B,C] :
      ( ( subset(B,C)
        & subset(C,B) )
     => B = C ) ).

%--------------------------------------------------------------------------

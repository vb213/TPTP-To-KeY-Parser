
%--------------------------------------------------------------------------
% File     : SET074+1 : TPTP v8.2.0. Bugfixed v5.4.0.
% Domain   : Set Theory
% Problem  : Corollary to unordered pair axiom
% Version  : [Qua92] axioms : Reduced & Augmented > Complete.
% English  :

% Refs     : [<a href=SeeTPTP?Category=BibTeX&File=Qua92>Qua92</a>] Quaife (1992), Automated Deduction in von Neumann-Bern
%          : [<a href=SeeTPTP?Category=BibTeX&File=BL+86>BL+86</a>] Boyer et al. (1986), Set Theory in First-Order Logic:
% Source   : [Qua92]
% Names    :

% Status   : Theorem
% Rating   : 0.17 v8.2.0, 0.14 v8.1.0, 0.19 v7.5.0, 0.22 v7.4.0, 0.13 v7.3.0, 0.14 v7.1.0, 0.13 v7.0.0, 0.07 v6.4.0, 0.12 v6.3.0, 0.17 v6.2.0, 0.28 v6.1.0, 0.23 v6.0.0, 0.26 v5.5.0, 0.22 v5.4.0
% Syntax   : Number of formulae    :   44 (  16 unt;   0 def)
%            Number of atoms       :  102 (  20 equ)
%            Maximal formula atoms :    4 (   2 avg)
%            Number of connectives :   64 (   6   ~;   3   |;  26   &)
%                                         (  19 <=>;  10  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    7 (   4 avg)
%            Maximal term depth    :    4 (   1 avg)
%            Number of predicates  :    6 (   5 usr;   0 prp; 1-2 aty)
%            Number of functors    :   26 (  26 usr;   5 con; 0-3 aty)
%            Number of variables   :   88 (  83   !;   5   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
% Bugfixed : v5.4.0 - Bugfixes to SET005+0 axiom file.
%--------------------------------------------------------------------------
%----Include set theory axioms
include('Axioms/<a href=SeeTPTP?Category=Axioms&File=SET005+0.ax>SET005+0.ax</a>').
%--------------------------------------------------------------------------
%----UP6: Corollary to (A-4)
fof(corollary1_2,conjecture,
    ! [X,Y] :
      ( member(Y,universal_class)
     => unordered_pair(X,Y) != null_class ) ).

%--------------------------------------------------------------------------

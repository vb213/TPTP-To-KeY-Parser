
%--------------------------------------------------------------------------
% File     : SET069+1 : TPTP v8.2.0. Bugfixed v5.4.0.
% Domain   : Set Theory
% Problem  : If one argument is a proper class, pair contains only the other
% Version  : [Qua92] axioms : Reduced & Augmented > Complete.
% English  :

% Refs     : [<a href=SeeTPTP?Category=BibTeX&File=Qua92>Qua92</a>] Quaife (1992), Automated Deduction in von Neumann-Bern
%          : [<a href=SeeTPTP?Category=BibTeX&File=BL+86>BL+86</a>] Boyer et al. (1986), Set Theory in First-Order Logic:
% Source   : [Qua92]
% Names    :

% Status   : Theorem
% Rating   : 0.78 v8.2.0, 0.75 v8.1.0, 0.78 v7.5.0, 0.81 v7.4.0, 0.73 v7.3.0, 0.76 v7.1.0, 0.70 v7.0.0, 0.80 v6.4.0, 0.77 v6.3.0, 0.83 v6.2.0, 0.96 v6.1.0, 0.97 v6.0.0, 0.91 v5.5.0, 0.89 v5.4.0
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
%----UP2: If one argument is a proper class, pair contains only the other
fof(pair_contains_only_other2,conjecture,
    ! [X,Y] :
      ( ~ member(Y,universal_class)
     => unordered_pair(X,Y) = singleton(X) ) ).

%--------------------------------------------------------------------------

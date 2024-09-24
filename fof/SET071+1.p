
%--------------------------------------------------------------------------
% File     : SET071+1 : TPTP v8.2.0. Bugfixed v5.4.0.
% Domain   : Set Theory
% Problem  : If both arguments are proper classes, pair is null
% Version  : [Qua92] axioms : Reduced & Augmented > Complete.
% English  :

% Refs     : [<a href=SeeTPTP?Category=BibTeX&File=Qua92>Qua92</a>] Quaife (1992), Automated Deduction in von Neumann-Bern
%          : [<a href=SeeTPTP?Category=BibTeX&File=BL+86>BL+86</a>] Boyer et al. (1986), Set Theory in First-Order Logic:
% Source   : [Qua92]
% Names    :

% Status   : Theorem
% Rating   : 0.44 v8.1.0, 0.56 v7.5.0, 0.59 v7.4.0, 0.47 v7.3.0, 0.45 v7.2.0, 0.41 v7.1.0, 0.52 v7.0.0, 0.50 v6.4.0, 0.54 v6.2.0, 0.56 v6.1.0, 0.60 v6.0.0, 0.57 v5.5.0, 0.59 v5.4.0
% Syntax   : Number of formulae    :   44 (  16 unt;   0 def)
%            Number of atoms       :  103 (  20 equ)
%            Maximal formula atoms :    4 (   2 avg)
%            Number of connectives :   66 (   7   ~;   3   |;  27   &)
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
%----UP3: If both arguments are proper classes, pair is null
fof(null_unordered_pair,conjecture,
    ! [X,Y] :
      ( ( ~ member(X,universal_class)
        & ~ member(Y,universal_class) )
     => unordered_pair(X,Y) = null_class ) ).

%--------------------------------------------------------------------------

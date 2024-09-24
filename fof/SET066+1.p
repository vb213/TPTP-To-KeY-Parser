
%------------------------------------------------------------------------------
% File     : SET066+1 : TPTP v8.2.0. Bugfixed v5.4.0.
% Domain   : Set Theory
% Problem  : Unordered pair is commutative
% Version  : [Qua92] axioms : Reduced & Augmented > Complete.
% English  :

% Refs     : [<a href=SeeTPTP?Category=BibTeX&File=Qua92>Qua92</a>] Quaife (1992), Automated Deduction in von Neumann-Bern
%          : [<a href=SeeTPTP?Category=BibTeX&File=BL+86>BL+86</a>] Boyer et al. (1986), Set Theory in First-Order Logic:
% Source   : [Qua92]
% Names    :

% Status   : Theorem
% Rating   : 0.75 v8.2.0, 0.78 v8.1.0, 0.75 v7.5.0, 0.81 v7.4.0, 0.77 v7.3.0, 0.76 v7.1.0, 0.74 v7.0.0, 0.77 v6.3.0, 0.79 v6.2.0, 0.88 v6.1.0, 0.87 v5.5.0, 0.85 v5.4.0
% Syntax   : Number of formulae    :   44 (  17 unt;   0 def)
%            Number of atoms       :  101 (  20 equ)
%            Maximal formula atoms :    4 (   2 avg)
%            Number of connectives :   62 (   5   ~;   3   |;  26   &)
%                                         (  19 <=>;   9  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    7 (   4 avg)
%            Maximal term depth    :    4 (   1 avg)
%            Number of predicates  :    6 (   5 usr;   0 prp; 1-2 aty)
%            Number of functors    :   26 (  26 usr;   5 con; 0-3 aty)
%            Number of variables   :   88 (  83   !;   5   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
% Bugfixed : v5.4.0 - Bugfixes to SET005+0 axiom file.
%------------------------------------------------------------------------------
%----Include set theory axioms
include('Axioms/<a href=SeeTPTP?Category=Axioms&File=SET005+0.ax>SET005+0.ax</a>').
%------------------------------------------------------------------------------
%----UP1: Unordered pair is commutative
fof(commutativity_of_unordered_pair,conjecture,
    ! [X,Y] : unordered_pair(X,Y) = unordered_pair(Y,X) ).

%------------------------------------------------------------------------------

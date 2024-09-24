
%------------------------------------------------------------------------------
% File     : SET086+1 : TPTP v8.2.0. Bugfixed v5.4.0.
% Domain   : Set Theory
% Problem  : A singleton set has a member
% Version  : [Qua92] axioms : Reduced & Augmented > Complete.
% English  :

% Refs     : [<a href=SeeTPTP?Category=BibTeX&File=Qua92>Qua92</a>] Quaife (1992), Automated Deduction in von Neumann-Bern
%          : [<a href=SeeTPTP?Category=BibTeX&File=BL+86>BL+86</a>] Boyer et al. (1986), Set Theory in First-Order Logic:
% Source   : [Qua92]
% Names    :

% Status   : Theorem
% Rating   : 0.11 v8.2.0, 0.08 v7.5.0, 0.09 v7.4.0, 0.10 v7.1.0, 0.13 v7.0.0, 0.10 v6.4.0, 0.12 v6.3.0, 0.17 v6.2.0, 0.24 v6.1.0, 0.27 v6.0.0, 0.30 v5.4.0
% Syntax   : Number of formulae    :   44 (  16 unt;   0 def)
%            Number of atoms       :  105 (  22 equ)
%            Maximal formula atoms :    5 (   2 avg)
%            Number of connectives :   67 (   6   ~;   4   |;  29   &)
%                                         (  19 <=>;   9  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    8 (   4 avg)
%            Maximal term depth    :    4 (   1 avg)
%            Number of predicates  :    6 (   5 usr;   0 prp; 1-2 aty)
%            Number of functors    :   26 (  26 usr;   5 con; 0-3 aty)
%            Number of variables   :   89 (  82   !;   7   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
% Bugfixed : v5.4.0 - Bugfixes to SET005+0 axiom file.
%------------------------------------------------------------------------------
%----Include set theory axioms
include('Axioms/<a href=SeeTPTP?Category=Axioms&File=SET005+0.ax>SET005+0.ax</a>').
%------------------------------------------------------------------------------
%----SS6: Existence of member_of
%----All four theorems are combined in one
fof(member_of_substitution,conjecture,
    ! [X] :
    ? [U] :
      ( ( member(U,universal_class)
        & X = singleton(U) )
      | ( ~ ? [Y] :
              ( member(Y,universal_class)
              & X = singleton(Y) )
        & U = X ) ) ).

%------------------------------------------------------------------------------

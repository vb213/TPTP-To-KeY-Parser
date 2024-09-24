
%--------------------------------------------------------------------------
% File     : SET099+1 : TPTP v8.2.0. Bugfixed v5.4.0.
% Domain   : Set Theory
% Problem  : Corollary 2 to a class contains 0, 1, or at least 2 members
% Version  : [Qua92] axioms : Reduced & Augmented > Complete.
% English  :

% Refs     : [<a href=SeeTPTP?Category=BibTeX&File=Qua92>Qua92</a>] Quaife (1992), Automated Deduction in von Neumann-Bern
%          : [<a href=SeeTPTP?Category=BibTeX&File=BL+86>BL+86</a>] Boyer et al. (1986), Set Theory in First-Order Logic:
% Source   : [Qua92]
% Names    :

% Status   : Theorem
% Rating   : 0.78 v8.1.0, 0.83 v7.5.0, 0.81 v7.4.0, 0.80 v7.3.0, 0.83 v7.1.0, 0.78 v7.0.0, 0.80 v6.4.0, 0.81 v6.3.0, 0.75 v6.2.0, 0.84 v6.1.0, 0.87 v5.5.0, 0.85 v5.4.0
% Syntax   : Number of formulae    :   44 (  16 unt;   0 def)
%            Number of atoms       :  105 (  22 equ)
%            Maximal formula atoms :    5 (   2 avg)
%            Number of connectives :   66 (   5   ~;   4   |;  27   &)
%                                         (  19 <=>;  11  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    7 (   4 avg)
%            Maximal term depth    :    4 (   1 avg)
%            Number of predicates  :    6 (   5 usr;   0 prp; 1-2 aty)
%            Number of functors    :   26 (  26 usr;   5 con; 0-3 aty)
%            Number of variables   :   90 (  84   !;   6   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
% Bugfixed : v5.4.0 - Bugfixes to SET005+0 axiom file.
% Bugfixes : v2.7.0 - Fixed corollary_2_to_number_of_elements_in_class to
%                     not mention Skolem function
%--------------------------------------------------------------------------
%----Include set theory axioms
include('Axioms/<a href=SeeTPTP?Category=Axioms&File=SET005+0.ax>SET005+0.ax</a>').
%--------------------------------------------------------------------------
%----SS13: A class contains 0, 1 or at least 2 members.
%----Corollary 2
fof(corollary_2_to_number_of_elements_in_class,conjecture,
    ! [X] :
      ( ! [U,V] :
          ( ( member(U,X)
            & member(V,intersection(complement(singleton(U)),X)) )
         => U = V )
     => ( X = null_class
        | ? [Y] : singleton(Y) = X ) ) ).

%--------------------------------------------------------------------------

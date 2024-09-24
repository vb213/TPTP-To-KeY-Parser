
%--------------------------------------------------------------------------
% File     : SET687+4 : TPTP v8.2.0. Released v2.2.0.
% Domain   : Set Theory (Naive)
% Problem  : A set is a subset of itself
% Version  : [Pas99] axioms.
% English  :

% Refs     : [Pas99] Pastre (1999), Email to G. Sutcliffe
% Source   : [Pas99]
% Names    :

% Status   : Theorem
% Rating   : 0.03 v7.3.0, 0.07 v7.2.0, 0.03 v7.1.0, 0.04 v7.0.0, 0.03 v6.4.0, 0.08 v6.3.0, 0.04 v6.1.0, 0.10 v6.0.0, 0.04 v5.5.0, 0.00 v5.4.0, 0.04 v5.3.0, 0.11 v5.2.0, 0.05 v5.0.0, 0.00 v4.0.0, 0.04 v3.7.0, 0.05 v3.4.0, 0.00 v3.2.0, 0.09 v3.1.0, 0.00 v2.2.1
% Syntax   : Number of formulae    :   12 (   2 unt;   0 def)
%            Number of atoms       :   30 (   3 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :   20 (   2   ~;   2   |;   4   &)
%                                         (  10 <=>;   2  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    7 (   5 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    4 (   3 usr;   0 prp; 2-2 aty)
%            Number of functors    :    9 (   9 usr;   1 con; 0-2 aty)
%            Number of variables   :   29 (  28   !;   1   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%----Include set theory definitions
include('Axioms/<a href=SeeTPTP?Category=Axioms&File=SET006+0.ax>SET006+0.ax</a>').
%--------------------------------------------------------------------------
fof(thI01,conjecture,
    ! [A] : subset(A,A) ).

%--------------------------------------------------------------------------

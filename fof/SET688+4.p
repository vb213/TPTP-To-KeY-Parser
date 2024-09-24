
%--------------------------------------------------------------------------
% File     : SET688+4 : TPTP v8.2.0. Released v2.2.0.
% Domain   : Set Theory (Naive)
% Problem  : Property of proper subset
% Version  : [Pas99] axioms.
% English  : If A is a proper subset of B and B a proper subset of C, then
%            A is not equal to C.

% Refs     : [Pas99] Pastre (1999), Email to G. Sutcliffe
% Source   : [Pas99]
% Names    :

% Status   : Theorem
% Rating   : 0.11 v8.2.0, 0.14 v8.1.0, 0.11 v7.5.0, 0.09 v7.4.0, 0.17 v7.3.0, 0.14 v7.2.0, 0.10 v7.1.0, 0.09 v7.0.0, 0.10 v6.4.0, 0.15 v6.3.0, 0.12 v6.1.0, 0.10 v6.0.0, 0.17 v5.5.0, 0.11 v5.3.0, 0.15 v5.2.0, 0.10 v5.0.0, 0.12 v4.1.0, 0.09 v4.0.0, 0.12 v3.7.0, 0.20 v3.5.0, 0.16 v3.4.0, 0.26 v3.3.0, 0.07 v3.2.0, 0.09 v3.1.0, 0.00 v2.2.1
% Syntax   : Number of formulae    :   12 (   1 unt;   0 def)
%            Number of atoms       :   34 (   3 equ)
%            Maximal formula atoms :    5 (   2 avg)
%            Number of connectives :   27 (   5   ~;   2   |;   7   &)
%                                         (  10 <=>;   3  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    9 (   6 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    4 (   3 usr;   0 prp; 2-2 aty)
%            Number of functors    :    9 (   9 usr;   1 con; 0-2 aty)
%            Number of variables   :   31 (  30   !;   1   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%--------------------------------------------------------------------------
%----Include set theory definitions
include('Axioms/<a href=SeeTPTP?Category=Axioms&File=SET006+0.ax>SET006+0.ax</a>').
%--------------------------------------------------------------------------
fof(thI04,conjecture,
    ! [A,B,C] :
      ( ( subset(A,B)
        & ~ equal_set(A,B)
        & subset(B,C)
        & ~ equal_set(B,C) )
     => ~ equal_set(A,C) ) ).

%--------------------------------------------------------------------------

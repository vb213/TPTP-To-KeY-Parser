
%------------------------------------------------------------------------------
% File     : SET901+1 : TPTP v8.2.0. Released v3.2.0.
% Domain   : Set theory
% Problem  : Basic properties of sets, theorem 42
% Version  : [Urb06] axioms : Especial.
% English  : subset(A,unordered_pair(B,C)) <=> ~ ( A != empty_set &
%            A != singleton(B) & A != singleton(C) & A != unordered_pair(B,C) )

% Refs     : [<a href=SeeTPTP?Category=BibTeX&File=Byl90>Byl90</a>] Bylinski (1990), Some Basic Properties of Sets
%          : [Urb06] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb06]
% Names    : zfmisc_1__t42_zfmisc_1 [Urb06]

% Status   : Theorem
% Rating   : 0.11 v8.2.0, 0.08 v7.5.0, 0.09 v7.4.0, 0.10 v7.2.0, 0.07 v7.1.0, 0.09 v7.0.0, 0.07 v6.4.0, 0.12 v6.3.0, 0.08 v6.2.0, 0.12 v6.1.0, 0.13 v6.0.0, 0.09 v5.5.0, 0.07 v5.3.0, 0.15 v5.2.0, 0.00 v4.1.0, 0.04 v4.0.1, 0.09 v4.0.0, 0.08 v3.7.0, 0.00 v3.4.0, 0.05 v3.3.0, 0.07 v3.2.0
% Syntax   : Number of formulae    :    7 (   5 unt;   0 def)
%            Number of atoms       :   15 (   9 equ)
%            Maximal formula atoms :    5 (   2 avg)
%            Number of connectives :   19 (  11   ~;   0   |;   6   &)
%                                         (   2 <=>;   0  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   10 (   5 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    3 (   2 usr;   0 prp; 1-2 aty)
%            Number of functors    :    3 (   3 usr;   1 con; 0-2 aty)
%            Number of variables   :   12 (  10   !;   2   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(commutativity_k2_tarski,axiom,
    ! [A,B] : unordered_pair(A,B) = unordered_pair(B,A) ).

fof(reflexivity_r1_tarski,axiom,
    ! [A,B] : subset(A,A) ).

fof(fc1_xboole_0,axiom,
    empty(empty_set) ).

fof(rc1_xboole_0,axiom,
    ? [A] : empty(A) ).

fof(rc2_xboole_0,axiom,
    ? [A] : ~ empty(A) ).

fof(t42_zfmisc_1,conjecture,
    ! [A,B,C] :
      ( subset(A,unordered_pair(B,C))
    <=> ~ ( A != empty_set
          & A != singleton(B)
          & A != singleton(C)
          & A != unordered_pair(B,C) ) ) ).

fof(l46_zfmisc_1,axiom,
    ! [A,B,C] :
      ( subset(A,unordered_pair(B,C))
    <=> ~ ( A != empty_set
          & A != singleton(B)
          & A != singleton(C)
          & A != unordered_pair(B,C) ) ) ).

%------------------------------------------------------------------------------

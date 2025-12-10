% BASIC FACTS

male(khalid).
male(juma).
male(george).
male(bradley).
male(yusuf).

female(evelyn).
female(halima).
female(amina).
female(sophia).

% Parent relationships
parent(khalid, juma).
parent(khalid, evelyn).

parent(halima, juma).
parent(halima, evelyn).

parent(juma, george).
parent(juma, sophia).

parent(amina, george).
parent(amina, sophia).

parent(evelyn, bradley).
parent(evelyn, yusuf).

parent(bradley, amina).   % multi-generation connection
parent(bradley, sophia).

% RULES 

% Child rule (defined early for clarity)
child(C, P) :-
    parent(P, C).

% Grandparent rule
grandparent(GP, GC) :-
    parent(GP, P),
    parent(P, GC).

% Sibling rule
sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

% Cousin rule (cousins share parents who are siblings)
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2).

% Descendant rule (recursive)
descendant(D, A) :- parent(A, D).
descendant(D, A) :-
    parent(A, X),
    descendant(D, X).

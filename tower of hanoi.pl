% Define the predicate for moving a single disk from one peg to another.
move(1, X, Y, _) :-
    write('Move top disk from '),
    write(X),
    write(' to '),
    write(Y),
    nl.
move(N, X, Y, Z) :-
    N > 1,
    M is N - 1,
    move(M, X, Z, Y),
    move(1, X, Y, _),
    move(M, Z, Y, X).

% Define the main predicate for solving the Towers of Hanoi problem.
hanoi(N) :-
    move(N, 'A', 'C', 'B').

% Example usage:
% To solve the Towers of Hanoi problem with 3 disks, run the following query:
% ?- hanoi(3).

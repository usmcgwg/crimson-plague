:- module(util,
    [rollDice/2, rollDices/3, cls/0, printList/1]).

rollDice(Bound, O) :-
    random(1, Bound, RollResult),
    O = RollResult.

rollDices(N, Bound, O) :-
    rollDices(N, Bound, 0, O).

rollDices(0, _, O, O).
rollDices(N, Bound, X, O) :-
    N > 0,
    rollDice(Bound, RollResult),
    X1 is X+RollResult,
    N1 is N-1,
    rollDices(N1, Bound, X1, O).


printList([]) :-
    write("").

printList([Head| Tail]) :-
    writeln(Head),
    printList(Tail).

cls :- write('\33\[2J').
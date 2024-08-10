:- use_module(library(clpfd)).

calculate_size(Row, Col, Row_num, Col_num) :-
    length(Row, Row_num),
    length(Col, Col_num).
    
create_matrix(Mtrx, X, Y, Vars) :-
    length(Mtrx, X),
    make_rows(Mtrx, Y, Vars).

make_rows([], _, []).

make_rows([R|Rs], Len, Vars) :-
    length(R, Len),
    make_rows(Rs, Len, Vars0),
    append(R, Vars0, Vars).
    
solve(RowSpec, ColSpec, Mtrx) :-
    rows(RowSpec, Mtrx),
    transpose(Mtrx, MtrxT),
    rows(ColSpec, MtrxT).
    
rows([], []).

rows([C|Cs], [R|Rs]) :-
    row(C, R),
    rows(Cs, Rs).

row(Ks, Row) :-
    sum(Ks,  #=, Ones),
    sum(Row, #=, Ones),
    arcs(Ks, Arcs, start, Final),
    append(Row, [0], RowZ),
    automaton(RowZ, [source(start), sink(Final)], [arc(start,0,start) | Arcs]).

arcs([], [], Final, Final).

arcs([K|Ks], Arcs, CurState, Final) :-
    gensym(state, NextState),
    (K == 0 ->
        Arcs = [arc(CurState,0,CurState), arc(CurState,0,NextState) | Rest],
        arcs(Ks, Rest, NextState, Final)
    ;
        Arcs = [arc(CurState,1,NextState) | Rest],
        K1 #= K - 1,
        arcs([K1|Ks], Rest, NextState, Final)
    ).

print_matrix([]).
print_matrix([R|Rs]) :-
    print_row(R),
    print_matrix(Rs).

print_row([]) :- nl.

print_row([X|R]) :-
    (X == 0 -> write('⬜') ; write('⬛')),
    print_row(R).

execute :-
    write('Enter the Row Elements: '),
    read(Rows),
    write('Enter the Column Elements: '),
    read(Cols),
    calculate_size(Rows, Cols, Row_num, Col_num),
    create_matrix(Mtrx, Row_num, Col_num, Vars),
    solve(Rows, Cols, Mtrx),
    label(Vars),
    print_matrix(Mtrx).

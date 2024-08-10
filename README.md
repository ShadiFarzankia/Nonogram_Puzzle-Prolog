# Nonogram_Puzzle-Prolog

## Introduction
As we know, most of the puzzles can be considered as a search problem. To solve them, we can exhaustively list all possible answers and go back to the list of constraints to test if any one of the answer will satisfy all of the constraints. If the answer produces no contradiction, we know we have the right answer. Since Prolog is a general purpose programming language, it really shines when we have to deal with problems involving exhaustive search. As a result, it is widely used in solving puzzle problems with the complexity class of NP-complete.
My project contains the implementation of nonogram puzzle which is a NP-complete class problem and thus prolog is a suitable choice for implementing it. In what follows, I will describe the project and its implementation in details.

## Nonogram Puzzle
Nonograms are picture logic puzzles in which cells in a grid must be colored or left blank according to numbers at the side of the grid to reveal a hidden pixel art-like picture. In this puzzle type, the numbers are a form of discrete tomography that measures how many unbroken lines of filled-in squares there are in any given row or column. For example, a clue of ”4 8 3” would mean there are sets of four, eight, and three filled squares, in that order, with at least one blank square between successive sets. One example for nonogram puzzle is shown below:
![Alt text](img/eagle-sample.png)

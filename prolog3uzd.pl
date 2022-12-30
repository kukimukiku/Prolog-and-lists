/* Elena Ingrida Baublyte, informatikos 3 kursas, 2 grupe */

/* 1.8 uzd 
tsuma(S,K) - numbers list S positive elements sum.

tsuma(S,K) - skaičių sąrašo S teigiamų elementų suma yra K. Pavyzdžiui:
?- tsuma([5,-1,3],K).
K = 8.
*/

/*
?- per_sarasa([1, 2, 3, -4, 5], K).
K = 11.

?- per_sarasa([1, 2, -3, -4, 5], K).
K = 8.
*/

per_sarasa([], 0).
per_sarasa([H|T], Suma) :- H>0, !, per_sarasa(T, Sum), Suma is Sum + H.
per_sarasa([_|T], Suma) :- per_sarasa(T, Suma).

/* 2.7 uzd
posarasis(S1,S2) - list S2 consists of (possibly not all) list S1 elements, in the same order as in
list S1. In other words, we could get S2 by deleting some elements from S1.

posarasis(S1,S2) - sąrašas S2 susideda iš (gal būt ne visų) sąrašo S1 elementų, 
išdėstytų ta pačia tvarka, kaip ir sąraše S1. Kitaip tariant, 
iš sąrašo S1 išmetus tam tikrus elementus, galime gauti sąrašą S2. Pavyzdžiui:


?- posarasis([1,8,3,5],[1,3]).
true.

?- posarasis([1,8,3,5],[8,3]).
true.

?- posarasis([1,8,3,5],[]).
true.

*/

posarasis([_|_], []).
posarasis([F|Fs], [S|Ss]) :- F=S, !, posarasis(Fs, Ss).
posarasis([_|Fs], [S|Ss]) :- posarasis(Fs, [S|Ss]).


/* 3.4 uzd
kartojasi(S,R) - list R consists of list S (given) repeated elements.

kartojasi(S,R) - sąrašas R susideda iš duotojo sąrašo S pasikartojančių elementų. 
Pavyzdžiui:


?- kartojasi([a,b,a,d,a,d],R).
R = [a,d].

?- kartojasi([a, a, c, d, b, d], R).
R = [d, a] .

?- kartojasi([a, c, b, d], R).
R = [] .

?- kartojasi([a, a, a, a], R).
R = [a] .
*/

ar_yra_sarase(Elementas, [Elementas|_]).
ar_yra_sarase(Elementas, [_|T]) :- ar_yra_sarase(Elementas, T). 

trinti_elementa(_, [], []).
trinti_elementa(R, [R|T], T2) :- trinti_elementa(R, T, T2).
trinti_elementa(R, [H|T], [H|T2]) :- H \= R, trinti_elementa(R, T, T2).

kartojasi([], []).
kartojasi([F|Fs], S) :- ar_yra_sarase(F, Fs), trinti_elementa(F, Fs, L), !, kartojasi(L, Temp), prideti(Temp, [F], S).
kartojasi([F|Fs], S) :- trinti_elementa(F, Fs, L), kartojasi(L, S).



/*
4.6 uzd
dvej_skaitm(Skaic,Sar) - Sar is given number Skaic binary digits list.

dvej_skaitm(Skaic,Sar) - Sar - duotojo skaičiaus Skaic dvejetainių skaitmenų sąrašas. Pavyzdžiui:


?- dvej_skaitm(13,Sar).
Sar = [1,1,0,1].

?- dvej_skaitm(13, Sar).
Sar = [1, 1, 0, 1] .

?- dvej_skaitm(26, Sar).
Sar = [1, 1, 0, 1, 0] .

*/

dvej_skaitm(0, []).
dvej_skaitm(Sk, L) :- Sk > 1, Sk mod 2 =:= 0, Laik is Sk/2, dvej_skaitm(Laik, L1), prideti(L1, [0], L), !.
dvej_skaitm(Sk, L) :- Sk > 1, Sk mod 2 =\= 0, MinVienas is Sk-1, Laik is MinVienas/2, dvej_skaitm(Laik, L1), prideti(L1, [1], L), !.
dvej_skaitm(Sk, L) :- Sk = 1, Laik is 0, dvej_skaitm(Laik, L1), prideti(L1, [1], L), !.

prideti([], X, X).                      
prideti([X|Y], Z, [X|W]) :- prideti(Y, Z, W). 


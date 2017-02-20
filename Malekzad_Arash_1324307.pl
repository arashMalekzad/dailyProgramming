connect(a,b,5).
connect(a,d,10).
connect(b,e,9).
connect(b,d,2).
connect(c,f,5).
connect(c,a,8).
connect(d,c,4).
connect(d,e,6).
connect(d,f,11).
connect(d,g,4).
connect(e,g,2).
connect(g,f,1).

%change the number of argumetns 
path(X,Y,L,P) :- path(X,Y,[],L,P). 
%base case
path(X,Y,_,L,P) :- connect(X,Y,L),atom_concat(X, Y, P). 
%to make sure it doesnt go through cycle use member
path(X,Y,V,L,P) :- \+ member(X,V), connect(X,K,L1), path(K,Y,[X|V],L2,P2), L is L1+L2, atom_concat(X, P2, P). 

 %base case
pathLength([_|[]],L) :- L is 0.
pathLength([X|[Y|Z]],L) :- connect(X,Y,L1), pathLength([Y|Z],L2), L is L1+L2. 
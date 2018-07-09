-module(e4_6).
-export([filter/2]).

filter(F,L) -> [X || X <- L, F(X)].

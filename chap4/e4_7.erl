-module(e4_7).
-export([split/2]).
-import(lists,[reverse/1]).
-import(e4_5,[even/1,odd/1]).
-import(e4_6,[filter/2]).

split(filter,L) -> {filter(fun(X) -> even(X) end,L),filter(fun(X) -> odd(X) end,L)};
split(accumulator,L) -> split_acc(L,[],[]).

split_acc([H|T],Even,Odd) ->
	case even(H) of
		true -> split_acc(T,[H|Even],Odd);
		false -> split_acc(T,Even,[H|Odd])
	end;
split_acc([],Even,Odd) ->
	{reverse(Even),reverse(Odd)}.

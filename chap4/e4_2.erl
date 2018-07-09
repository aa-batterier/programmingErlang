-module(e4_2).
-export([my_tuple_to_list/1,reverse_my_tuple_to_list/1]).
 
my_tuple_to_list(T) -> do_list(T,1).

do_list(T,N) when N =:= 0 -> error;
do_list(T,N) when N > size(T) -> [];
do_list(T,N) -> [element(N,T)|do_list(T,N+1)].

reverse_my_tuple_to_list(T) -> reverse_do_list(T,size(T)).

reverse_do_list(T,0) -> [];
reverse_do_list(T,N) -> [element(N,T)|reverse_do_list(T,N-1)].

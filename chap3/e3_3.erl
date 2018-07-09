-module(e3_3).
-export([start/0,loop/1,returnHouse/2,get_street/1,get_house/2]).

start() ->
	spawn(e3_3,loop,[[{house1,red,brick},{house2,blue,stone},{house3,yellow,wood}]]).

loop(Street) ->
	receive
		{Client,get_street} ->
			Client ! {self(),Street};
		{Client,get_house,House} ->
			Client ! {self(),returnHouse(Street,House)}
	end,
	loop(Street).

returnHouse([H|T],House) ->
	{NewHouse,_,_} = H,
	if
		NewHouse =:= House -> H;
		true -> returnHouse(T,House)
	end.

get_street(Server) ->
	Server ! {self(),get_street},
	receive
		{Server,Street} ->
			Street
	end.

get_house(Server,House) ->
	Server ! {self(),get_house,House},
	receive
		{Server,NewHouse} ->
			NewHouse
	end.

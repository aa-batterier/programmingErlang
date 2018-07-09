-module(e2_4).
-export([start/1,loop/1,ls/1,get_file/2,put_file/3]).

% Server.

start(Dir) -> spawn(e2_4,loop,[Dir]).

loop(Dir) ->
	receive
		{Client,list_dir} ->
			Client ! {self(),file:list_dir(Dir)};
		{Client,{get_file,File}} ->
			Full = filename:join(Dir,File),
			Client ! {self(),file:read_file(Full)};
		{Client,{put_file,File,Content}} ->
			Full = filename:join(Dir,File),
			file:write_file(Full,Content),
			Client ! {self(),done}
	end,
	loop(Dir).

% Client.

ls (Server) ->
	Server ! {self(),list_dir},
	receive
		{Server,FileList} ->
			FileList
	end.

get_file(Server,File) ->
	Server ! {self(),{get_file,File}},
	receive
		{Server,Content} ->
			Content
	end.

put_file(Server,File,Content) ->
	Server ! {self(),{put_file,File,Content}},
	receive
		{Server,done} ->
			io:format("Written to file.~n")
	end.

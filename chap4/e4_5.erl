-module(e4_5).
-export([odd/1,even/1]).

odd(Number) when Number rem 2 =:= 0 -> false;
odd(_) -> true.

even(Number) when Number rem 2 =:= 0 -> true;
even(_) -> false.

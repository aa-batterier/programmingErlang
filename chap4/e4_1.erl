-module(e4_1).
-export([area/1]).

area({rectangle,Width,Height}) -> Width * Height;
area({square,Side}) -> Side * Side;
area({circle,Radius}) -> 3.14159 * Radius * Radius;
area({right-angled-triangle,Width,Height}) -> (Width * Height) / 2.

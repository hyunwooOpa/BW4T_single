% declarations of predicates used but not defined here.
:- dynamic
	in/1,		% percept predicate that informs where the robot is. 
	state/1,	% percept predicate to keep track of whether a robot is moving.
	visited/1,	% predicate to keep track of the rooms that have been visited.
	zone/5.		% percept predicate with information about all zones in BW4T.
	sequence/1.
	sequenceIndex/1.
	color/2.
	atBlock/1.
	holdingblocks/1.
	block/3.

% A room is a place with exactly one neighbour; in other words, there is only one way to
% get to and from that place.
room(PlaceID) :- zone(_, PlaceID, _, _, Neighbours), length(Neighbours, 1).

% A room has not yet been visited if the robot has not yet been there.
not_yet_visited(PlaceID) :- room(PlaceID), not( visited(PlaceID) ).

%Get the next color that is needed.
next_color_needed(ColorID) :- sequenceIndex(Index), sequence(List), nth0(Index, List, ColorID).
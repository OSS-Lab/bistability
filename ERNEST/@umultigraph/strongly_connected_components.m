function scc = strongly_connected_components(g)
% strongly_connected_components Calculate the strongly connected components of an undirected multigraph
% SCC = strongly_connected_components(G) returns a vector SCC such that
% for each vertex i of the undirected multigraph G, SCC(i) is its strongly
% connected component number.
% max(SCC) is the number of strongly connected components.

% Copyright (C) 2008-2009 Nicola Soranzo <soranzo@sissa.it>
%
% This program is free software; you can redistribute it and/or modify it 
% under the terms of the GNU General Public License as published by the Free 
% Software Foundation; either version 2 of the License, or (at your option) 
% any later version.
%
% This program is distributed in the hope that it will be useful, but WITHOUT
% ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or 
% FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License 
% for more details.
%
% You should have received a copy of the GNU General Public License 
% along with this program. If not, see <http://www.gnu.org/licenses/>.

scc = connected_components(g);

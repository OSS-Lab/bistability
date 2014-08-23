function print_walk(g, w)
% print_walk Display vertices and edges of a walk.
% print_walk(G, W) displays the vertices and edges of the walk structure W
% in the undirected multigraph G.
% A walk structure W is composed by the fields 'vertices' and 'edges',
% such that for every i in 1:length(W):
% G.vertices{W.vertices(i)} is the i-th vertex of the walk;
% G.edges{W.vertices(i)}(W.edges(i)) is the i-th edge of the walk.

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

string = g.vertices{w.vertices(1)};
for i = 1:numel(w.edges)
    string = [string ' -(' g.edges{w.vertices(i)}(w.edges(i)).label ',' int2str(g.edges{w.vertices(i)}(w.edges(i)).weight) ')-> ' g.vertices{w.vertices(mod(i, numel(w.vertices)) + 1)}];
end
disp(string)

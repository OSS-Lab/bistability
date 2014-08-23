function g_w = walk2graph(g, w)
% walk2graph Transform a walk structure to an undirected submultigraph.
% walk2graph(G, W) returns an undirected multigraph equal to the walk in
% the undirected multigraph G represented by the walk structure W.
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

g_w = umultigraph(g.vertices, cell(0, 4));
for i = 1:numel(w.edges)
    g_w = add_edge(g_w, w.vertices(i), w.vertices(i+1), g.edges{w.vertices(i)}(w.edges(i)).label, g.edges{w.vertices(i)}(w.edges(i)).weight);
end
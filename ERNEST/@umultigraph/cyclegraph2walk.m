function w = cyclegraph2walk(g, g_w)
% cyclegraph2walk Transform an undirected submultigraph to a walk structure.
% cyclegraph2walk(G, G_W) returns a walk structure equal to the walk in the
% undirected multigraph G represented by the undirected submultigraph G_W
% of G.
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

for i = 1:numel(g_w.vertices)
    if numel(g_w.edges{i}) > 0
        v1 = i; % v1 is the first vertex of w
        break
    end
end

n_edges = count_edges(g_w);
for i = 1:n_edges
    w.vertices(i) = v1;
    v2 = g_w.edges{v1}(1).vertex;
    label = g_w.edges{v1}(1).label;
    for j = 1:numel(g.edges{v1})
        if (g.edges{v1}(j).vertex == v2) && strcmp(g.edges{v1}(j).label, label)
            break % j is the index of edge (v1, label, v2) in g
        end
    end
    w.edges(i) = j;
    g_w = remove_edge(g_w, v1, v2, label);
    v1 = v2; % v2 is the start vertex of the next edge in the cycle
end
w.vertices(n_edges + 1) = v2;
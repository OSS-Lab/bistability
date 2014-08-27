function fc = fundamental_cycles(g)
% fundamental_cycles Find the fundamental cycles of an undirected multigraph.
% fundamental_cycles(G) returns a cell vector of walk structures,
% representing the fundamental cycles of the undirected multigraph G with
% respect to a spanning forest.
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

[s n_cc] = spanning_forest(g);
fc = cell(count_edges(g) - numel(g.vertices) + n_cc, 1);
next = 1;
for i = 1:numel(g.vertices)
    for j = 1:numel(g.edges{i})
        if i <= g.edges{i}(j).vertex && ~find_edge(s, i, g.edges{i}(j).vertex, g.edges{i}(j).label) % seach generator edges, i.e. present in g but not in s
            p = find_path(s, g.edges{i}(j).vertex, i); % find the only path in the spanning tree between two vertices connected by a generator edge
            g_p = walk2graph(s, p); % transform the path in a subgraph
            g_p = add_edge(g_p, i, g.edges{i}(j).vertex, g.edges{i}(j).label, g.edges{i}(j).weight); % add the generator edge to create the fundamental cycle
            fc{next} = cyclegraph2walk(g, g_p); % transform the subgraph in a walk in g
            next = next + 1;
        end
    end
end

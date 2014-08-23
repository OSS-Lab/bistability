function [s n_cc] = spanning_forest(g)
% spanning forest Spanning forest of an undirected multigraph
% [S N_CC] = spanning_forest(G) returns an undirected multigraph S
% containing the spanning forest of the undirected multigraph G. Returns
% also the number N_CC of connected components of G.

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

function visit(v) % breadth first search
    visited(v) = true;
    to_finish = v;
    while ~isempty(to_finish)
        v1 = to_finish(end);
        to_finish(end) = [];
        for j = 1:numel(g.edges{v1})
            v2 = g.edges{v1}(j).vertex;
            if ~visited(v2)
                s.edges{v1}(end+1) = struct('vertex', v2, 'label', g.edges{v1}(j).label, 'weight', g.edges{v1}(j).weight);
                s.edges{v2}(end+1) = struct('vertex', v1, 'label', g.edges{v1}(j).label, 'weight', g.edges{v1}(j).weight);
                visited(v2) = true;
                to_finish(end+1) = v2;
            end
        end
    end
end

s = umultigraph(g.vertices, cell(0, 4));
visited = false(numel(g.vertices), 1);
n_cc = 0;
for i = 1:numel(g.vertices)
    if ~visited(i)
        n_cc = n_cc + 1;
        visit(i);
    end
end
end
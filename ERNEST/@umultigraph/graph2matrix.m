function M = graph2matrix(g)
% graph2matrix Transform an undirected multigraph to a matrix.
% M = graph2matrix(G) returns a symmetric matrix M such that for each pair
% of vertices (v1, v2) of the undirected multigraph G, M(v1, v2) is the sum
% of the weights of the edges between v1 and v2.

% Copyright (C) 2009 Nicola Soranzo <soranzo@crs4.it>
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

M = zeros(numel(g.vertices));
for v1 = 1:numel(g.vertices)
    for j = 1:numel(g.edges{v1})
        v2 = g.edges{v1}(j).vertex;
        if v1 <= v2
            M(v1, v2) = M(v1, v2) + g.edges{v1}(j).weight;
            M(v2, v1) = M(v1, v2);
        end
    end
end

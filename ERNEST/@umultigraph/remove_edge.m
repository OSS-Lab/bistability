function g = remove_edge(g, v1, v2, label)
% remove_edge Remove an edge from an undirected multigraph.
% remove_edge(G, V1, V2, LABEL) returns an undirected multigraph equal to G
% without the edge (V1, V2) having label LABEL.

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

if ischar(v1) && ischar(v2)
    v1 = find(strcmp(v1, g.vertices));
    v2 = find(strcmp(v2, g.vertices));
end
for i = 1:numel(g.edges{v1})
    if g.edges{v1}(i).vertex == v2 && strcmp(g.edges{v1}(i).label, label)
        g.edges{v1}(i) = [];
        break;
    end
end
for i = 1:numel(g.edges{v2})
    if g.edges{v2}(i).vertex == v1 && strcmp(g.edges{v2}(i).label, label)
        g.edges{v2}(i) = [];
        break;
    end
end

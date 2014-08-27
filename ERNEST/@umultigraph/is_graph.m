function ret = is_graph(g)
% is_graph True if an undirected multigraph is a graph.
% is_graph(G) returns logical true if the undirected multigraph G is a
% graph (i.e. there are no multiple edges between two vertices), returns
% logical false otherwise.

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

ret = true;
for i = 1:numel(g.vertices)
    for j = 1:numel(g.edges{i})-1
        v2 = g.edges{i}(j).vertex;
        for k = j+1:numel(g.edges{i})
            if v2 == g.edges{i}(k).vertex
                ret = false;
                return
            end
        end
    end
end

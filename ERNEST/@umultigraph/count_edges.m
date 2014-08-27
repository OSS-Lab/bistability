function sum = count_edges(g)
% count_edges Number of edges of an undirected multigraph.
% count_edges(G) returns the number of edges of an undirected multigraph G.
% (v1, v2) and (v2, v1) are considered the same edge.

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

sum = 0;
for i = 1:numel(g.vertices)
    sum = sum + numel(g.edges{i});
end
sum = sum / 2;

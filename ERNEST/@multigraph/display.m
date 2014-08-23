function display(g)
% display Display vertices and edges of a directed multigraph.
% display(G) displays the vertices and edges of the directed multigraph G.

% Copyright (C) 2009 Nicola Soranzo <soranzo@sissa.it>
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

disp([inputname(1) ' ='])
disp('Vertices:')
disp(g.vertices)
disp('Edges (v1, v2, label, weight):')
for i = 1:numel(g.vertices)
    for j = 1:numel(g.edges{i})
        disp(['    ' g.vertices{i} ', ' g.vertices{g.edges{i}(j).vertex} ', ' g.edges{i}(j).label ', ' num2str(g.edges{i}(j).weight)])
    end
end
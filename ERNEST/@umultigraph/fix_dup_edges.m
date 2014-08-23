function g = fix_dup_edges(g)
% fix_dup_edges Fix duplicate edges in an undirected multigraph.
% fix_dup_edges(G) return an undirected multigraph equal to G except that
% each set of duplicated edges, i.e. edges with the same endpoints and the
% same label, is substituted with an edge with weigth equal to the sum of
% their weights.

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

fixed_edges = 0;
for i = 1:numel(g.vertices)
    j = 1;
    while j <= numel(g.edges{i})-1
        v2 = g.edges{i}(j).vertex;
        label = g.edges{i}(j).label;
        k = j + 1;
        while k <= numel(g.edges{i})
            if v2 == g.edges{i}(k).vertex && strcmp(label, g.edges{i}(k).label)
                g.edges{i}(j).weight = g.edges{i}(j).weight + g.edges{i}(k).weight;
                g.edges{i}(k) = [];
                if i < v2
                    disp(['Duplicated edge: ' g.vertices{i} ' -(' label ')-> ' g.vertices{v2}])
                end
                fixed_edges = fixed_edges + 1;
            else
                k = k + 1;
            end
        end
        j = j + 1;
    end
end
if fixed_edges > 0
    disp(['Summary: fixed ' int2str(fixed_edges / 2) ' duplicated edges'])
end

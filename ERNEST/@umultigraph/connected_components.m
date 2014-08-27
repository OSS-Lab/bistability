function cc = connected_components(g)
% connected_components Calculate the connected components of an undirected multigraph.
% CC = connected_components(G) returns a vector CC such that for each 
% vertex i of the undirected multigraph G, CC(i) is its connected 
% component number.
% max(CC) is the number of connected components.

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

    function visit(v)
        cc(v) = n_cc;
        to_finish = [v];
        while ~isempty(to_finish)
            v1 = to_finish(end);
            to_finish(end) = [];
            for j = 1:numel(g.edges{v1})
                v2 = g.edges{v1}(j).vertex;
                if cc(v2) == 0 % not yet visited
                    cc(v2) = n_cc;
                    to_finish(end+1) = v2;
                end
            end
        end
    end

cc = zeros(numel(g.vertices), 1);
n_cc = 0;
for i = 1:numel(g.vertices)
    if cc(i) == 0 % not yet visited
        n_cc = n_cc + 1;
        visit(i);
    end
end
end
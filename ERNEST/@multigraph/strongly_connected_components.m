function scc = strongly_connected_components(g)
% strongly_connected_components Calculate the strongly connected components of a directed multigraph.
% SCC = strongly_connected_components(G) returns a vector SCC such that for
% each vertex i of the directed multigraph G, SCC(i) is its strongly 
% connected component number.
% max(SCC) is the number of strongly connected components.

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
        dtime(v) = time;
        scc_dtime(v) = time;
        time = time + 1;
        stack(end+1) = v;
        on_stack(v) = true;
        for j = 1:numel(g.edges{v})
            v2 = g.edges{v}(j).vertex;
            if dtime(v2) == 0
                visit(v2);
                scc_dtime(v) = min(scc_dtime(v), scc_dtime(v2)); % scc_dtime(v2) < scc_dtime(v) iff a vertex in the stack before v is reachable from v2 (and so they are all in the same scc)
            elseif on_stack(v2) % v2 was visited before v
                scc_dtime(v) = min(scc_dtime(v), scc_dtime(v2)); % so v and v2 are in the same component, and they must have the same scc_dtime
            end
        end
        if scc_dtime(v) == dtime(v) % v is the first visited node of its scc, all the other vertices of the scc follow it on the stack
            while true
                v2 = stack(end);
                stack(end) = [];
                on_stack(v2) = false;
                scc(v2) = n_cc;
                if v2 == v
                    break
                end
            end
            n_cc = n_cc + 1;
        end
    end

dtime = zeros(numel(g.vertices), 1); % vertex discovery times by visit()
scc_dtime = zeros(numel(g.vertices), 1); % discovery time of (the first visited node of) the vertex scc
time = 1;
stack = [];
on_stack = false(numel(g.vertices), 1);
scc = zeros(numel(g.vertices), 1);
n_cc = 1;
for i = 1:numel(g.vertices)
    if scc(i) == 0
        visit(i);
    end
end
end
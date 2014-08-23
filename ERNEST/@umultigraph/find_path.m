function p = find_path(g, v_start, v_end)
% find_path Find a path between two vertices in and undirected multigraph.
% P = find_path(G, V_START, V_END) returns a walk structure P containing a
% path between the vertices V_START and V_END in the undirected multigraph
% G.
% V_START and V_END should be both character arrays with the vertex names,
% or should be both indexes of the vertexes in G.
% A walk structure P is composed by the fields 'vertices' and 'edges',
% such that for every i in 1:length(P):
% G.vertices{P.vertices(i)} is the i-th vertex of the walk;
% G.edges{P.vertices(i)}(P.edges(i)) is the i-th edge of the walk.
% If there is no path between V_START and V_END, then find_path returns [].

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

p = [];
if ischar(v_start) && ischar(v_end)
    v_start = find(strcmp(v_start, g.vertices));
    v_end = find(strcmp(v_end, g.vertices));
end

if v_start == v_end
    for j = 1:numel(g.edges{v_start})
        if g.edges{v_start}(j).vertex == v_end
            p = struct('vertices', {v_start v_start}, 'edges', {j []}); % a loop
            return
        end
    end
    p = struct('vertices', v_start, 'edges', []); % empty path
    return
end

visited = false(numel(g.vertices), 1);
pred = zeros(numel(g.vertices), 2);
found_end = false;

visited(v_start) = true;
to_finish = v_start;
while ~isempty(to_finish)
    v1 = to_finish(end);
    to_finish(end) = [];
    for j = 1:numel(g.edges{v1})
        v2 = g.edges{v1}(j).vertex;
        if ~visited(v2)
            pred(v2, :) = [v1, j];
            if v2 == v_end
                found_end = true;
                break;
            end
            visited(v2) = true;
            to_finish(end+1) = v2;
        end
    end
    if found_end
        break;
    end
end

if ~found_end % there is no path
    return
end

v_queue = [v_end];
e_queue = [];
node = v_end;
while node ~= v_start
    v_queue = [pred(node, 1) v_queue];
    e_queue = [pred(node, 2) e_queue];
    node = pred(node, 1);
end
p = struct('vertices', v_queue, 'edges', e_queue);
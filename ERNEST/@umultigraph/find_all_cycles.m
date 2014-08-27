function [cycles cycles_scc] = find_all_cycles(g)
% find_all_cycles Find all cycles of an undirected multigraph.
% [CYCLES CYCLES_SCC] = find_all_cycles(G) returns a cell vector CYCLES of
% walk structures representing all the cycles of the undirected multigraph
% G using a backtracking algorithm ([1]). CYCLES_SCC is a logical vector
% such that for each cycle i of CYCLES, CYCLES_SCC(i) is its strongly
% connected component.
% A walk structure W is composed by the fields 'vertices' and 'edges',
% such that for every i in 1:length(W):
% G.vertices{W.vertices(i)} is the i-th vertex of the walk;
% G.edges{W.vertices(i)}(W.edges(i)) is the i-th edge of the walk.
%
% [1] Loizou, G., Thanisch, P. - Enumerating the Cycles of a Digraph: A New
% Preprocessing Strategy - Information Sciences 27 - pp. 163-182 - 1982

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

    function f = cycle(g, v)
        function nocycle(x, y, j)
            B{y}(end + 1) = x;
            suspended_edges{x}(j) = true;
        end
        
        function unmark(y)
            mark(y) = false;
            for j = 1:numel(B{y})
                x = B{y}(j);
                for j2 = 1:numel(g.edges{x})
                    if g.edges{x}(j2).vertex == y
                        suspended_edges{x}(j2) = false;
                    end
                end
                if mark(x)
                    unmark(x);
                end
            end
            B{y} = [];
        end
        
        mark(v) = true;
        f = false;
        v_stack(end + 1) = v;
        e_stack(end + 1) = 0;
        for i2 = 1:numel(g.edges{v})
            if suspended_edges{v}(i2)
                continue
            end
            w = g.edges{v}(i2).vertex;
            if scc(v) ~= scc(w) % for directed graphs, don't exit from the scc
                continue
            end
            e_stack(end) = i2;
            if ~mark(w)
                if cycle(g, w)
                    f = true;
                else
                    nocycle(v, w, i2);
                end
            elseif ~reach(w) && (~is_undirected(g) || numel(v_stack) == 1 || v_stack(end - 1) ~= w || ~strcmp(g.edges{v_stack(end - 1)}(e_stack(end - 1)).label, g.edges{v}(i2).label))
                    % output cycles from stack from w to v, then w
                    start = find(v_stack == w, 1);
                    cycles(end + 1) = struct('vertices', [v_stack(start:end) w], 'edges', e_stack(start:end));
                    cycles_scc(end + 1) = i_scc;
                    f = true;
            else
                nocycle(v, w, i2);
            end
        end
        v_stack(end) = [];
        e_stack(end) = [];
        if f
            unmark(v);
        end
        reach(v) = true;
    end

v_stack = [];
e_stack = [];
scc = strongly_connected_components(g);
mark = false(numel(g.vertices), 1);
reach = false(numel(g.vertices), 1);
B = cell(numel(g.vertices), 1);
suspended_edges = cell(numel(g.vertices), 1);
for i = 1:numel(g.vertices)
    suspended_edges{i} = false(numel(g.edges{i}), 1);
end
cycles = struct('vertices', {}, 'edges', {});
cycles_scc = [];
for i_scc = 1:max(scc)
    % choose a vertex s of scc{i_scc}
    s = find(scc == i_scc, 1);
    cycle(g, s);
end
end

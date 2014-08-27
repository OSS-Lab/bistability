function [ret] = can_have_mult_pos_eq(g, species_vertices)
% can_have_mult_pos_eq True if a CRN can have multiple positive equilibria.
% can_have_mult_pos_eq(G, SPECIES_VERTICES) returns logical false if the
% chemical reaction network represented by the SR graph ([1]) G is
% injectieve, and so does not have the capacity for multiple non-degenerate
% equilibria ([1]). If instead the function returns logical true, the SR
% graph may have multiple positive equilibria.
% SPECIES_VERTICES should be a vector such that for each vertex i of G,
% SPECIES_VERTICES(i) is true if and only if i is a species.
%
% [1] Craciun G., Feinberg, M. - Multiple equilibria in complex chemical
% reaction networks: II. The Species-Reaction graph - SIAM J. Appl. Math
% 66(4) - pp. 1321-1338 - 2006

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

[c c_cc] = find_all_cycles(g);
o_cycles = false(size(c)); % arbitrary initialization
for i = 1:numel(c)
    o_cycles(i) = is_o_cycle(g, species_vertices, c(i));
end

ret = false;
for i = 1:numel(c)
    if ~o_cycles(i) && ~is_s_cycle(g, c(i))
        disp('In the SR graph the following cycle is neither an o-cycle nor an s-cycle:')
        print_walk(g, c(i))
        ret = true;
        return
    end
end

for i = 1:numel(c) - 1
    if ~o_cycles(i)
        g_c_i = walk2graph(g, c(i)); % to use find_edge on the cycle
        for j = i+1:numel(c)
            if ~o_cycles(j) && c_cc(i) == c_cc(j)
                intersections = struct('first', {}, 'last', {}); % first and last vertex of the paths formed by the intersection of c(i) and c(j)
                to_finish = false; % true while adding edges to an intersection path
                for k = 1:numel(c(j).edges)
                    if find_edge(g_c_i, c(j).vertices(k), c(j).vertices(k+1), g.edges{c(j).vertices(k)}(c(j).edges(k)).label)
                        if to_finish
                        	intersections(end).last = c(j).vertices(k+1);
                        else
                            intersections(end+1).first = c(j).vertices(k);
                        	intersections(end).last = c(j).vertices(k+1);
                        	to_finish = true;
                        end
                    else
                        to_finish = false;
                    end
                end
                if numel(intersections) > 1 && intersections(end).last == intersections(1).first % if last and first intersection paths are connected
                    intersections(1).first = intersections(end).first; % merge them
                    intersections(end) = [];
                end
                all_StoR = numel(intersections) > 0; % initialize to true iff the intersection is not empty
                for k = 1:numel(intersections)
                    if species_vertices(intersections(k).first) == species_vertices(intersections(k).last)
                        all_StoR = false; % some intersection path of c{i} and c{j} is R-to-R or S-to-S
                        break
                    end
                end
                if all_StoR % the intersection of c{j} and c{j} form a set of disjoint S-to-R paths
                    disp('In the SR graph the following two cycles have an S-to-R intersection:')
                    print_walk(g, c(i))
                    print_walk(g, c(j))
                    ret = true;
                    return
                end
            end
        end
    end
end
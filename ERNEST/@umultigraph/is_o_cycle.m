function ret = is_o_cycle(g, species_vertices, c)
% is_o_cycle True if a cycle in an SR graph is an o-cycle.
% is_o_cycle(G, SPECIES_VERTICES, C) returns logical true if the cycle C in
% the Species-Reaction graph G is an o-cycle ([1]), and logical false
% otherwise.
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

n_c_pairs = 0;
if species_vertices(c.vertices(1))
    start = 1;
else
    start = 2;
end
for i = start:2:numel(c.edges)
    if strcmp(g.edges{c.vertices(i)}(c.edges(i)).label, g.edges{c.vertices(i+1)}(c.edges(mod(i, numel(c.edges)) + 1)).label)
        n_c_pairs = n_c_pairs + 1;
    end
end
ret = logical(mod(n_c_pairs, 2));
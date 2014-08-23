function ret = is_s_cycle(g, c)
% is_s_cycle True if a cycle in an SR graph is an s-cycle.
% is_s_cycle(G, C) returns logical true if the cycle C in the
% Species-Reaction graph G is an s-cycle ([1]), and logical false
% otherwise.
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

if rem(numel(c.edges), 2) ~= 0
    error('The cycle must have even length')
end
odd_edges_prod = 1;
even_edges_prod = 1;
for i = 1:2:numel(c.edges)
    odd_edges_prod = odd_edges_prod * g.edges{c.vertices(i)}(c.edges(i)).weight;
    even_edges_prod = even_edges_prod * g.edges{c.vertices(i+1)}(c.edges(i+1)).weight;
end
ret = odd_edges_prod == even_edges_prod;
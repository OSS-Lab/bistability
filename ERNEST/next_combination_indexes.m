function next = next_combination_indexes(n, k, prev)
% next_combination_indexes Next combination of indexes.
% next_combination_indexes(N, K, PREV) returns the next combination of K 
% elements (K <= N) taken from 1:N (i.e. a combination of vector 
% indexes), where PREV is the previous combination. If PREV is an empty 
% vector, returns the first combination. If PREV is the last 
% combination, returns an empty vector.

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

if k > n
    error('k must be <= n.')
end
if isempty(prev)
    next = 1:k;
else
    first_to_incr = 0;
    for i = k:-1:1
        if prev(i) < n + i - k
            first_to_incr = i;
            break
        end
    end
    if first_to_incr == 0
        next = [];
    else
        next = prev;
        next(first_to_incr) = next(first_to_incr) + 1;
        for i = first_to_incr+1:k
            next(i) = next(i-1) + 1;
        end
    end
end
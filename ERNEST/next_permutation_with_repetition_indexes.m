function next = next_permutation_with_repetition_indexes(n, k, prev)
% next_permutation_with_repetition_indexes Next permutation with repetition of indexes.
% next_permutation_with_repetition_indexes(N, K, PREV) returns the next 
% permutation with repetition of K elements taken from 1:N (i.e. a
% permutation with repetition of vector indexes), where PREV is the 
% previous permutation. If PREV is an empty vector, returns the first
% permutation. If PREV is the last permutation, returns an empty vector.

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

if isequal(prev, [])
    next = ones(1, k);
elseif isequal(prev, n * ones(1, k))
    next = [];
else
    next = prev;
    for i = k:-1:1
        if next(i) < n
            next(i) = next(i) + 1;
            break
        else
            next(i) = 1;
        end
    end
end
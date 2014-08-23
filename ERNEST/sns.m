function r = sns(A)
% sns Determines whether a square matrix is sign-nonsingular.
% sns(A) returns:
% 1  if A is a sign-nonsingular (SNS) matrix, i.e. every matrix in the 
%    qualitative class Q(A) of A is nonsingular
% 0  if A is singular
% -1 if A is not SNS and not singular

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

% A signing of order k is a nonzero diagonal matrix of order k whose
% entries are in the set {-1, 0, 1}.
% A row signing of a m x n matrix A is a matrix DA where D is a signing of
% order m.
% A vector is unisigned if it is nonzero and it is either nonnegative or
% nonpositive.
%
% Theorem: A is SNS if and only if every row signing of A contains a
% unisigned column.
%
% Klee, V., Ladner R., Manber, R. - Signsolvability Revisited - Linear
% Algebra Appl. 59 - pp. 131-157 - 1984

if det(A) == 0 % this will also check that A is a square matrix
    r = 0;
else
    n = size(A, 1);
    r = 1;
    if n > 1
        sigma = [];
        while true
            sigma = next_permutation_with_repetition_indexes(3, n, sigma); % the diagonal of a signing + 2
            if isempty(sigma) % all signing have been examined
                break
            end
            if isequal(sigma, 2 .* ones(1, n)) % a signing should be nonzero
                continue
            end
            DA = diag(sigma-2) * A; % corresponding row signing of A
            found_unisigned_column = false;
            for j = 1:n
                if any(DA(:, j)) && (all(DA(:, j) >= 0) || all(DA(:, j) <= 0))
                    found_unisigned_column = true;
                    continue
                end
            end
            if ~found_unisigned_column
                r = -1; % there is a row signing of A that does not contain a unisigned column
                break
            end
        end
    end
end
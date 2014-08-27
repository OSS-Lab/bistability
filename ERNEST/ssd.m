function [r failing_rows failing_cols] = ssd(A)
% ssd True if a matrix is a strongly sign determined.
% ssd(A) returns logical true if the matrix A is strongly sign 
% determined, i.e. if all its square submatrices are either SNS or 
% singular, and logical false otherwise.

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

if ndims(A) ~= 2
    error('Matrix must have 2 dimensions.')
end

rem_rows = 1:size(A, 1); % indexes of the rows not dropped in the following while cycle
rem_cols = 1:size(A, 2); % indexes of the columns not dropped in the following while cycle
A_changed = true;
while A_changed
    A_changed = false;
    % simplify A by dropping rows/columns with zero or one non-zero element
    to_drop = [];
    for i1 = size(A, 1):-1:1
        if nnz(A(i1, :)) <= 1
            to_drop = [to_drop i1];
        end
    end
    if ~isempty(to_drop)
        rem_rows(to_drop) = [];
        A(to_drop, :) = [];
        A_changed = true;
    end

    to_drop = [];
    for j1 = size(A, 2):-1:1
        if nnz(A(:, j1)) <= 1
            to_drop = [to_drop j1];
        end
    end
    if ~isempty(to_drop)
        rem_cols(to_drop) = [];
        A(:, to_drop) = [];
        A_changed = true;
    end

    % simplify A by dropping rows/columns multiple of another row/column
    for i1 = size(A, 1):-1:2
        to_drop = [];
        for i2 = i1 - 1:-1:1
            if isequal(find(A(i1, :)), find(A(i2, :))) && var(nonzeros(A(i1, :)) ./ nonzeros(A(i2, :))) == 0 % the i2-th row is multiple of the i1-th row
                to_drop = [to_drop i2];
            end
        end
        if ~isempty(to_drop)
            rem_rows(to_drop) = [];
            A(to_drop, :) = [];
            A_changed = true;
            i1 = i1 - numel(to_drop);
        end
    end

    for j1 = size(A, 2):-1:2
        to_drop = [];
        for j2 = j1 - 1:-1:1
            if isequal(find(A(:, j1)), find(A(:, j2))) && var(nonzeros(A(:, j1)) ./ nonzeros(A(:, j2))) == 0 % the j2-th column is multiple of the j1-th column
                to_drop = [to_drop j2];
            end
        end
        if ~isempty(to_drop)
            rem_cols(to_drop) = [];
            A(:, to_drop) = [];
            A_changed = true;
            j1 = j1 - numel(to_drop);
        end
    end
end

[n_rows, n_cols] = size(A);
min_dim = min(n_rows, n_cols);
r = true;
failing_rows = [];
failing_cols = [];
for sub_dim = 2:min_dim
    rows = [];
    while true
        % change the selection of rows of A as combinations of sub_dim
        % elements taken from 1:n_rows
        rows = next_combination_indexes(n_rows, sub_dim, rows);
        if isempty(rows) % done all combinations
            break
        end
        
        B = A(rows, :);
        % simplify B by dropping columns with zero or one non-zero element
        to_drop = [];
        for j1 = size(B, 2):-1:1
            if nnz(B(:, j1)) <= 1
                to_drop = [to_drop j1];
            end
        end
        B(:, to_drop) = [];

        n_cols_B = size(B, 2);
        if n_cols_B >= sub_dim
            cols = [];
            while true
                % change the selection of cols of B as combinations of sub_dim
                % elements taken from 1:n_cols_B
                cols = next_combination_indexes(n_cols_B, sub_dim, cols);
                if isempty(cols) % done all combinations
                    break
                end
                
                if sns(B(:, cols)) < 0
                    r = false;
                    failing_rows = rem_rows(rows);
                    rem_cols(to_drop) = [];
                    failing_cols = rem_cols(cols);
                    return
                end
            end
        end
    end
end
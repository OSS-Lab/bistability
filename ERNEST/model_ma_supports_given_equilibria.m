function [response constants] = model_ma_supports_given_equilibria(am, eq)
% model_ma_supports_given_equilibria
% [RESPONSE CONSTANTS] = model_ma_supports_given_equilibria(AM, EQ)
% determines whether a previously analyzed SBML model AM, as returned by
% model_analysis function, with mass action kinetics supports a set of
% equilibria given in the matrix EQ (n. of equilibria x n. of species).
% If all those equilibria are supported, RESPONSE will be logical true 
% and COSTANTS will be a vector of compatible reaction rate constants.
% Otherwise RESPONSE will be logical false and CONSTANTS will be empty.
%
% Example:
%
% model = TranslateSBML('file.xml');
% am = model_analysis(model);
% [response rate_constants] = ma_model_supports_given_equilibria(am, eq);

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

options = optimset('Display', 'off', 'LargeScale', 'off', 'Simplex', 'On');
TolFun = 1e-6;
[n r] = size(am.reactant_complexes);
n_eq = size(eq, 2);
if size(eq, 1) ~= n
    error('The matrix of equilibria must have a number of species equal to the one of the model')
end
f = [1; zeros(r, 1)];
A = -[ones(r, 1) eye(r)];
b = zeros(r, 1);
Aeq = zeros(n_eq * n, r + 1);
for i = 1:n_eq
    for k = 1:r
        Aeq((i-1) * n + 1:i * n, k+1) = am.S(:, k) * prod(eq(:, i) .^ am.reactant_complexes(:, k));
    end
end
beq = zeros(size(Aeq, 1), 1);
lb = -10000 .*  ones(size(f));
[x, lambda, exitflag, output] = linprog(f, A, b, Aeq, beq, lb, [], [], options);
if exitflag == 1 && x(1) < 0 && (((isempty(A) || all(A * x <= b)) && (isempty(Aeq) || isequal(Aeq * x, beq))) || -x(1) >= TolFun)
    response = true;
    constants = x(2:end);
else
    response = false;
    constants = [];
end
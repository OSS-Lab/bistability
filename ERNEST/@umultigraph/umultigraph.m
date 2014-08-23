function ug = umultigraph(varargin)
% umultigraph Create a new undirected multigraph.
% umultigraph() returns an empty undirected multigraph.
%
% umultigraph(G), where G is an undirected multigraph, returns a copy of G.
%
% umultigraph(M), where M is a symmetric real matrix N x N, returns an
% undirected graph with N vertices having name '1', '2', ..., 'N', and for
% each nonzero element (i, j) of M an edge with endpoints 'i' and 'j',
% empty label and weight M(i, j).
%
% umultigraph(V, E), where V is a cell vector of strings and E is a cell
% matrix with 3 or 4 columns such the first two columns contain strings
% present in V, the third column contains strings and the potential fourth
% columns contains numbers, returns an undirected multigraph with the
% vertex names specified in V, and for each row i of E an edge with
% endpoints E{i, 1} and E{i, 2}, with label E{i, 3} and with weight E{i, 4}
% or 1 if E has just 3 columns.

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

if nargin == 0
    ug.vertices = {};
    ug.edges = {};
    ug = class(ug, 'umultigraph');
elseif nargin == 1 && isa(varargin{1}, 'umultigraph')
    ug = varargin{1};
elseif nargin == 1 && isreal(varargin{1}) && ~ischar(varargin{1}) && isequal(varargin{1}, varargin{1}')
    ug.vertices = cell(size(varargin{1}, 1), 1);
    for i = 1:size(varargin{1}, 1)
        ug.vertices{i} = num2str(i);
    end
    ug.edges = cell(numel(ug.vertices), 1);
    for i = 1:size(varargin{1}, 1)
        for j = i:size(varargin{1}, 2)
            if varargin{1}(i, j)
                ug.edges{i}(end+1) = struct('vertex', j, 'label', '', 'weight', varargin{1}(i, j));
                if i ~= j
                    ug.edges{j}(end+1) = struct('vertex', i, 'label', '', 'weight', varargin{1}(i, j));
                end
            end
        end
    end
    ug = class(ug, 'umultigraph');
elseif nargin == 2 && isvector(varargin{1}) && iscellstr(varargin{1}) && ndims(varargin{2}) == 2 && iscell(varargin{2}) && size(varargin{2}, 2) >= 3 && size(varargin{2}, 2) <= 4 && iscellstr(varargin{2}(:, 1:3))
    if size(varargin{2}, 2) == 4 && (~isreal(cell2mat(varargin{2}(:, 4))) || ischar(cell2mat(varargin{2}(:, 4))))
        error('Wrong arguments: the edge weights should be real numbers.')
    end
    ug.vertices = varargin{1};
    ug.edges = cell(numel(ug.vertices), 1);
    for i = 1:size(varargin{2}, 1)
        v1 = find(strcmp(varargin{2}{i, 1}, ug.vertices), 1);
        v2 = find(strcmp(varargin{2}{i, 2}, ug.vertices), 1);
        if size(varargin{2}, 2) == 3
            ug.edges{v1}(end+1) = struct('vertex', v2, 'label', varargin{2}{i, 3}, 'weight', 1);
            if v1 ~= v2
                ug.edges{v2}(end+1) = struct('vertex', v1, 'label', varargin{2}{i, 3}, 'weight', 1);
            end
        else
            ug.edges{v1}(end+1) = struct('vertex', v2, 'label', varargin{2}{i, 3}, 'weight', varargin{2}{i, 4});
            if v1 ~= v2
                ug.edges{v2}(end+1) = struct('vertex', v1, 'label', varargin{2}{i, 3}, 'weight', varargin{2}{i, 4});
            end
        end
    end
    ug = class(ug, 'umultigraph');
    ug = fix_dup_edges(ug);
else
    error('Wrong arguments.');
end
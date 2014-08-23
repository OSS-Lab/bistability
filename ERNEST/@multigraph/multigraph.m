function g = multigraph(varargin)
% multigraph Create a new directed multigraph.
% multigraph() returns an empty directed multigraph.
%
% multigraph(G), where G is a directed multigraph, returns a copy of G.
%
% multigraph(M), where M is a square real matrix N x N, returns a directed
% graph with N vertices having name '1', '2', ..., 'N', and for 
% each nonzero element (i, j) of M an edge with endpoints 'i' and 'j',
% empty label and weight M(i, j).
%
% multigraph(V, E), where V is a cell vector of strings and E is a cell
% matrix with 3 or 4 columns such the first two columns contain strings
% present in V, the third column contains strings and the potential fourth
% columns contains numbers, returns a directed multigraph with the vertex
% names specified in V, and for each row i of E an edge with endpoints E{i,
% 1} and E{i, 2}, with label E{i, 3} and with weight E{i, 4} or 1 if E has
% just 3 columns.

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
    g.vertices = {};
    g.edges = {};
    g = class(g, 'multigraph');
elseif nargin == 1 && isa(varargin{1}, 'multigraph')
    g = varargin{1};
elseif nargin == 1 && isreal(varargin{1}) && ~ischar(varargin{1}) && ndims(varargin{1}) == 2 && size(varargin{1}, 1) == size(varargin{1}, 2)
    g.vertices = cell(size(varargin{1}, 1), 1);
    for i = 1:size(varargin{1}, 1)
        g.vertices{i} = num2str(i);
    end
    g.edges = cell(numel(g.vertices), 1);
    for i = 1:size(varargin{1}, 1)
        for j = 1:size(varargin{1}, 2)
            if varargin{1}(i, j)
                g.edges{i}(end+1) = struct('vertex', j, 'label', '', 'weight', varargin{1}(i, j));
            end
        end
    end
    g = class(g, 'multigraph');
elseif nargin == 2 && isvector(varargin{1}) && iscellstr(varargin{1}) && ndims(varargin{2}) == 2 && iscell(varargin{2}) && size(varargin{2}, 2) >= 3 && size(varargin{2}, 2) <= 4 && iscellstr(varargin{2}(:, 1:3))
    if size(varargin{2}, 2) == 4 && (~isreal(cell2mat(varargin{2}(:, 4))) || ischar(cell2mat(varargin{2}(:, 4))))
        error('Wrong arguments: the edge weights should be real numbers.')
    end
    g.vertices = varargin{1};
    g.edges = cell(numel(g.vertices), 1);
    for i = 1:size(varargin{2}, 1)
        v1 = find(strcmp(varargin{2}{i, 1}, g.vertices), 1);
        v2 = find(strcmp(varargin{2}{i, 2}, g.vertices), 1);
        if size(varargin{2}, 2) == 3
            g.edges{v1}{end+1} = struct('vertex', v2, 'label', varargin{2}{i, 3}, 'weight', 1);
        else
            g.edges{v1}{end+1} = struct('vertex', v2, 'label', varargin{2}{i, 3}, 'weight', varargin{2}{i, 4});
        end
    end
    g = class(g, 'multigraph');
else
    error('Wrong arguments.');
end
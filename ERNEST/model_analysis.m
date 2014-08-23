function [ret] = model_analysis(model)
% model_analysis Analyze a chemical reaction network.
% model_analysis(MODEL) analyzes a chemical reaction network MODEL,
% previously imported from a SBML file with TranlateSBML(), using
% deficiency theory [1,2], P matrix theory [3] and species-reaction graph
% theory [4].
%
% NB: Extra information in the SBML file, like compartments, 
% constraints, reaction modifiers and kinetic laws, are ignored.
%
% [1] Feinberg, M. - Chemical reaction network structure and the stability
% of complex isothermal reactors - I. The deficiency zero and deficiency
% one theorems - Chemical Engineering Science 42(10) - pp. 2229-2268 - 1987
%
% [2] Feinberg, M. - Chemical reaction network structure and the stability of
% complex isothermal reactors - II. Multiple steady states for networks of 
% deficiency one - Chemical Engineering Science 43(1) - pp. 1-25 - 1988
%
% [3] Banaji, M., Donnell, P., Baigent - P matrix properties, injectivity,
% and stability in chemical reaction systems - SIAM J. Appl. Math 67(6) -
% pp. 1523-1547 - 2007
%
% [4] Craciun G., Feinberg, M. - Multiple equilibria in complex chemical
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

    function [f, g, H] = sqr_distance(x)
    % Calculate the square of the distance of x from 0 in n dimensions
    % g is the gradient vector of f
    % H is the Hessian matrix of f
        f = -sum(x .^ 2);
        if nargout > 1
            g = -2 .* x;
            if nargout > 2
                H = -2 .* eye(numel(x));
            end
        end
    end

species = {model.species.id};
n = numel(species); % number of species
reactions = {model.reaction.id};
reactant_complexes = []; % matrix of reactant complexes (species x irrev. reactions)
product_complexes = []; % matrix of product complexes (species x irrev. reactions)
S = []; % stoichiometric matrix (species x irrev. reactions)
sr_edges = cell(0, 4);
for i = 1:numel(reactions)
    if isfield(model.reaction(i), 'modifier') && ~isempty(model.reaction(i).modifier)
        warning(['Reaction ' num2str(i) ' contains modifiers, which will be ignored. Specify all species in a reaction as reactants or products.'])
    end
    reactant_complexes(:, end+1) = zeros(n, 1);
    for j = 1:numel(model.reaction(i).reactant)
        reactant_complexes(find(strcmp(model.reaction(i).reactant(j).species, species), 1), end) = model.reaction(i).reactant(j).stoichiometry;
    end
    product_complexes(:, end+1) = zeros(n, 1);
    for j = 1:numel(model.reaction(i).product)
        product_complexes(find(strcmp(model.reaction(i).product(j).species, species), 1), end) = model.reaction(i).product(j).stoichiometry;
    end
    S(:, end + 1) = product_complexes(:, end) - reactant_complexes(:, end);
    if model.reaction(i).reversible
        reactant_complexes(:, end+1) = product_complexes(:, end);
        product_complexes(:, end+1) = reactant_complexes(:, end-1);
        S(:, end + 1) = -S(:, end);
    end

    if numel(model.reaction(i).reactant) > 0 && numel(model.reaction(i).product) > 0
        label = [num2str(model.reaction(i).reactant(1).stoichiometry) ' ' model.reaction(i).reactant(1).species];
        for j = 2:numel(model.reaction(i).reactant)
            label = [label ' + ' num2str(model.reaction(i).reactant(j).stoichiometry) ' ' model.reaction(i).reactant(j).species];
        end
        for j = 1:numel(model.reaction(i).reactant)
            sr_edges(end+1, :) = {model.reaction(i).reactant(j).species, reactions{i}, label, model.reaction(i).reactant(j).stoichiometry};
        end
        label = [num2str(model.reaction(i).product(1).stoichiometry) ' ' model.reaction(i).product(1).species];
        for j = 2:numel(model.reaction(i).product)
            label = [label ' + ' num2str(model.reaction(i).product(j).stoichiometry) ' ' model.reaction(i).product(j).species];
        end
        for j = 1:numel(model.reaction(i).product)
            sr_edges(end+1, :) = {model.reaction(i).product(j).species, reactions{i}, label, model.reaction(i).product(j).stoichiometry};
        end
    end
end
clear label

[Y, ind, ind2] = unique([reactant_complexes product_complexes]', 'rows'); % ind2(i) is the index in Y of the reactant complex in reaction i, ind(i + r) is the index in Y of the product complex in reaction i
Y = Y'; % complexes matrix (species x complexes)
m = size(Y, 2); % number of complexes
reacts_to = false(m, m); % matrix (complexes x complexes) for the reacts_to relation: reacts_to(i, j) = true iff i->j
r = size(reactant_complexes, 2); % number of irrev. reactions
reacts_in = zeros(m, r); % matrix (complexes x irrev. reactions) for the reacts_in relation: (reacts_in(i, r) = -1 && reacts_in(j, r) = 1) iff i->j
for i = 1:r
    reacts_to(ind2(i), ind2(i + r)) = true;
    reacts_in(ind2(i), i) = -1;
    reacts_in(ind2(i+r), i) = 1;
end

is_reversible = isequal(reacts_to, reacts_to');
complexes_ugraph_cc = connected_components(umultigraph(reacts_to | reacts_to')); % linkage classes
l = max(complexes_ugraph_cc); % number of linkage classes
if is_reversible
    complexes_graph_scc = complexes_ugraph_cc;
else
    complexes_graph_scc = strongly_connected_components(multigraph(reacts_to)); % strong-linkage classes
end
n_slc = max(complexes_graph_scc); % number of strong-linkage classes
is_weakly_reversible = n_slc == l; % the reaction network is weakly reversible if and only if each linkage class is a strong-linkage class
s = rank(S); % reaction network rank
d = m - l - s; % reaction network deficiency

options = optimset('Display', 'off', 'LargeScale', 'off', 'Simplex', 'On');
TolFun = 1e-6;
% Verify first condition for network regularity: There exists a positive
% vector alpha (irrev. reactions x 1) such that S * alpha = 0
R1 = true;
f = [1; zeros(r, 1)];
A = -[ones(r, 1) eye(r)];
b = zeros(size(A, 1), 1);
Aeq = [zeros(n, 1) S];
beq = zeros(n, 1);
lb = -100 .*  ones(size(f)); % allowing unbounded solutions can create BIG problems! Moreover, the absolute values of lb should be limited to 100 because otherwise linprog can find a solution where -TolFun < x(1) < 0 and the following tests will succeed due to rounding errors
[x, lambda, exitflag] = linprog(f, A, b, Aeq, beq, lb, [], [], options);
if exitflag == 1 && x(1) < 0 && (((isempty(A) || all(A * x <= b)) && (isempty(Aeq) || isequal(Aeq * x, beq))) || x(1) <= -TolFun) % the last check is needed because linprog sometimes returns with exitflag == 1, but x does not satisfy all constraints: if -TolFun < x(1) < 0, this is really a bug, otherwise x(1) ~= -100, there is just a rounding error and the system is feasible
else
    disp('The reaction vectors are not positively dependent, so the reaction network has no positive equilibria (at least one species is 0 at equilibrium).')
    R1 = false;
end
alpha = x(2:end);
clear f A b Aeq beq x lambda exitflag

if d == 0
    if is_weakly_reversible
        disp('The reaction network is weakly reversible and has deficiency 0, so with mass action kinetics each positive stoichiometric compatibility class contains precisely one equilibrium, which is asymptotically stable.')
    else
        disp('The reaction network is not weakly reversible and has deficiency 0, so it has neither a positive equilibrium, nor a positive periodic orbit.')
    end
else
    disp(['The deficiency of the reaction network is ' num2str(d) '.'])
    % A strong-linkage class is terminal if it does not contain any complex
    % that reacts to a complex in a different strong-linkage class.
    % A complex is terminal if its strong-linkage class is terminal.
    % A terminal strong-linkage class is nontrivial if it contains more
    % than one complex.
    if is_weakly_reversible
        t = n_slc; % each (strong-)linkage class is terminal
        is_nontrivial_terminal_slc = true(n_slc, 1);
        is_terminal_complex = true(m, 1);
        is_reactive = true(m, 1);
    else
        t = 0; % number of terminal strong-linkage classes
        is_nontrivial_terminal_slc = false(n_slc, 1);
        is_terminal_complex = false(m, 1);
        for i = 1:n_slc
            complexes_i = find(complexes_graph_scc == i); % indexes in Y of the complexes present in strong-linkage class i
            products_of_complexes_i = find(any(reacts_to(complexes_i, :), 1)); % indexes in Y of the complexes which in some reactions are products of complexes_i
            if all(ismember(products_of_complexes_i, complexes_i)) % products_of_complexes_i is a subset of complexes_i, so the strong-linkage class i is terminal
                t = t + 1;
                is_terminal_complex(complexes_i) = true;
                if numel(complexes_i) > 1
                    is_nontrivial_terminal_slc(i) = true;
                end
            end
        end
        is_reactive = any(reacts_in < 0, 2); % a complex is reactive if it is the reactant in at least one reaction
    end

    d_lc = zeros(1, l); % deficiencies of the linkage classes
    for i = 1:l
        complexes_i = find(complexes_ugraph_cc == i); % indexes in Y of the complexes present in linkage class i
        m_i = numel(complexes_i); % number of complexes of linkage class i
        % the linkage classes of a linkage class are just the same linkage class, so l_i = 1
        reactions_present_in_i = false(1, r); % indexes in S of the reactions present in linkage class i
        for j = 1:m_i
            complex = Y(:, complexes_i(j));
            for k = 1:r
                if isequal(complex, reactant_complexes(:, k)) || isequal(complex, product_complexes(:, k))
                    reactions_present_in_i(k) = true;
                end
            end
        end
        s_i = rank(S(:, reactions_present_in_i)); % rank of linkage class i
        d_lc(i) = m_i - 1 - s_i;
    end
    if any(d_lc > 1)
        disp('There is some linkage class with deficiency > 1, so Deficiency-One Theorem does not apply.')
    elseif d > sum(d_lc) % the deficiency of a reaction network is always greater than or equal to the sum of the deficiencies of its linkage classes
        disp('The reaction network deficiency is greater than the sum of the deficiencies of its linkage classes, so Deficiency-One Theorem does not apply.')
    elseif is_weakly_reversible
        disp('The reaction network is weakly reversible and satisfy the conditions for Deficiency-One theorem, so with mass action kinetics each positive stoichiometric compatibility class contains precisely one positive equilibrium.')
    else
        if t > l % each linkage class contains one or more strong-linkage classes, and one or more of these are terminal, so t >= l
            disp('There is some linkage class which contains more than one terminal strong-linkage class, so Deficiency-One Theorem does not apply.')
        else
            disp('The reaction network is not weakly reversible and satisfy the conditions for Deficiency-One theorem, so with mass action kinetics each positive stoichiometric compatibility class admits at most one positive equilibrium.')
        end
    end
    
    if d == 1 && d > sum(d_lc) && R1 % d > sum(d_lc) is there to NOT use deficiency one algorithm if deficiency one theorem was applied before
        % Step 1
        % Find a confluence vector g (complexes x 1) such that g ~= 0 and
        % the sum of the g(i) corresponding to complexes in each linkage
        % class is zero
        g = reacts_in * alpha;
        if is_reversible && isequal(g, zeros(m, 1))
            Aeq = Y;
            for i = 1:l
                Aeq(end + 1, :) = (complexes_ugraph_cc == i)';
            end
            beq = zeros(size(Aeq, 1), 1);
            lb = -100 .* ones(m, 1);
            [g, lambda, exitflag] = linprog(zeros(m, 1), [], [], Aeq, beq, lb, [], [], options);
            if exitflag ~= 1 || isequal(g, zeros(m, 1)) || ~isequal(Aeq * g, beq) % linprog did not find a suitable g (usually it will find g == zeros(m, 1))
                x0 = rand(m, 1);
                while isequal(x0, zeros(m, 1))
                    x0 = rand(m, 1);
                end
                [g, fval, exitflag] = fmincon(@sqr_distance, x0, [], [], Aeq, beq, lb, [], [], optimset('Display', 'off', 'GradObj', 'on', 'LargeScale', 'Off', 'TolCon', 0));
                if exitflag < 0 || isequal(g, zeros(m, 1)) || ~isequal(Aeq * g, beq) || any(g ~= 0 & abs(g) < 1e-10) % the last check is needed because fmincon sometimes returns with exitflag >= 0, but some element of g is ~= 0, when it should really be 0, and this escapes the constraints because of rounding errors: in this case we are simply screwed
                    error('The network is reversible, fmincon did not find a suitable confluence vector. Please try with MATLAB version 2007b or later.')
                end
            end
        end

        slc_Aeq_prelim = cell(n_slc, 1); % preliminary equalities for each nontrivial terminal strong-linkage class
        slc_A_prelim = cell(n_slc, 1); % preliminary strict inequalities for each nontrivial terminal strong-linkage class
        R3 = true; % network regularity condition 3: each pair of adjacent terminal complexes is a cut pair
        for i = 1:n_slc
            if is_nontrivial_terminal_slc(i)
                complexes_i = find(complexes_graph_scc == i); % indexes in Y of the complexes present in terminal strong-linkage class i
                for j = 1:numel(complexes_i)-1
                    for k = j + 1:numel(complexes_i)
                        if reacts_to(complexes_i(j), complexes_i(k)) || reacts_to(complexes_i(k), complexes_i(j)) % complexes_i(j) and complexes_i(k) are adjacent
                            reacts_to_cut = reacts_to;
                            reacts_to_cut(complexes_i(j), complexes_i(k)) = false;
                            reacts_to_cut(complexes_i(k), complexes_i(j)) = false; % reacts_to with removed edges between complexes_i(j) and complexes_i(k)
                            complexes_ugraph_cc_cut = connected_components(umultigraph(reacts_to_cut | reacts_to_cut')); % linkage classes for reacts_to_cut relation
                            l_cut = max(complexes_ugraph_cc_cut); % number of linkage classes for reacts_to_cut relation
                            if l_cut == l % (j, k) is not a cut pair
                                R3 = false;
                                break
                            end

                            % Step 2
                            complexes_i_j_lk_cut_g_sum = sum(g(complexes_ugraph_cc_cut == complexes_ugraph_cc_cut(complexes_i(j)))); % sum of all the g of the complexes in the same linkage class of complexes_i(j) for reacts_to_cut relation
                            if complexes_i_j_lk_cut_g_sum > 0
                                slc_A_prelim{i}(end + 1, :) = (Y(:, complexes_i(k)) - Y(:, complexes_i(j)))'; % add preliminary inequality Y(:, complexes_i(k)) .* mu < Y(:, complexes_i(j)) .* mu
                            elseif complexes_i_j_lk_cut_g_sum == 0
                                slc_Aeq_prelim{i}(end + 1, :) = (Y(:, complexes_i(j)) - Y(:, complexes_i(k)))'; % add preliminary equality Y(:, complexes_i(j)) .* mu = Y(:, complexes_i(k)) .* mu
                            else
                                slc_A_prelim{i}(end + 1, :) = (Y(:, complexes_i(j)) - Y(:, complexes_i(k)))'; % add preliminary inequality Y(:, complexes_i(j)) .* mu < Y(:, complexes_i(k)) .* mu
                            end
                        end
                    end
                    if ~R3
                        break
                    end
                end
            end
            if ~R3
                break
            end
        end
        if ~R3
            disp('There is a pair of adjacent terminal complexes which is not a cut pair, so the network is not regular and Deficiency-One Algorithm does not apply.')
        elseif t > l
            disp('Each pair of adjacent terminal complexes is a cut pair, but there is some linkage class which contains more than one terminal strong-linkage class, so the reaction network with mass action kinetics admit multiple equilibria.')
        else
            % the network is regular
            
            % Sign compatibility
            % A vector v is sign compatible with the stoichiometric
            % subspace if there's a vector in the subspace with the same
            % signs of v.
            % Find all the possible signs of the vectors in the
            % stoichiometric subspace
            possible_signs = []; % a vector sigma is in the stoichiometric subspace iff there exists j such that possible_signs(:, j) == sign(sigma)
            possible_signs_x = []; % set of vectors (reactions x 1) generating all possible signs, i.e. sign(S * possible_signs_x(:, j)) = possible_signs(:, j)
            signs_permutation = []; % assignment of a sign to each species ( + 2)
            while true
                signs_permutation = next_permutation_with_repetition_indexes(3, n, signs_permutation);
                if isempty(signs_permutation) % if needed, the number of signs permutation can be halved, but this would depend on next_permutation_with_repetition_indexes() implementation
                    break
                end
                if isequal(signs_permutation, 2 .* ones(1, n)) % mu should be ~= 0, so we are NOT interested to be sign compatible with sigma == 0
                    continue
                end
                A = [];
                Aeq = [];
                for i = 1:n
                    if signs_permutation(i) == 1 % < 0
                        A(end + 1, :) = S(i, :);
                    elseif signs_permutation(i) == 2 % == 0
                        Aeq(end + 1, :) = S(i, :);
                    else % > 0
                        A(end + 1, :) = -S(i, :);
                    end
                end
                f = [1; zeros(r, 1)];
                A = [-ones(size(A, 1), 1) A];
                b = zeros(size(A, 1), 1);
                Aeq = [zeros(size(Aeq, 1), 1) Aeq];
                beq = zeros(size(Aeq, 1), 1);
                lb = -100 .*  ones(size(f));
                [x, lambda, exitflag] = linprog(f, A, b, Aeq, beq, lb, [], [], options);
                if exitflag == 1 && x(1) < 0 && (((isempty(A) || all(A * x <= b)) && (isempty(Aeq) || isequal(Aeq * x, beq))) || x(1) <= -TolFun)
                    possible_signs(:, end + 1) = signs_permutation' - 2;
                    possible_signs_x(:, end + 1) = x(2:end); % S * x(2:end) satisfies the signs
                end
            end

            partition_mult_pos_eq = false;
            nontrivial_terminal_slc = find(is_nontrivial_terminal_slc); % indexes of the strong-linkage classes that are nontrivial terminal
            % Step 3
            % Partitioning of the reactive complexes in 3 partitions
            % (upper, middle, lower): all nonterminal complexes must be in
            % the middle partition; all complexes in the same terminal
            % strong-linkage class must be in the same partition.
            % If a complex is terminal, then it is reactive (i.e. no need
            % to check that the complex is reactive, if it is in a tslc).
            % A terminal strong-linkage class is nontrivial iff its
            % complexes are reactive (i.e. no need to consider trivial
            % tslc).
            nontrivial_tslc_partition_indexes = [];
            while true
                nontrivial_tslc_partition_indexes = next_permutation_with_repetition_indexes(3, numel(nontrivial_terminal_slc), nontrivial_tslc_partition_indexes); % for each nontrivial terminal strong-linkage class the index (1, 2 or 3) of the partition (upper, middle, lower) were to put the relative complexes
                if isequal(nontrivial_tslc_partition_indexes, []) % done all permutations with repetition
                    break
                end
                complexes_in_upper = find(ismember(complexes_graph_scc, nontrivial_terminal_slc(nontrivial_tslc_partition_indexes == 1))); % complexes whose terminal strong-linkage classes were put in upper partition
                complexes_in_middle = find((is_reactive & ~is_terminal_complex) | ismember(complexes_graph_scc, nontrivial_terminal_slc(nontrivial_tslc_partition_indexes == 2))); % complexes (reactive AND nonterminal) OR (whose terminal strong-linkage classes were put in middle partition)
                complexes_in_lower = find(ismember(complexes_graph_scc, nontrivial_terminal_slc(nontrivial_tslc_partition_indexes == 3))); % complexes whose terminal strong-linkage classes were put in lower partition

                % Step 4-5
                % Inequalities for chosen partition
                A_step_4_5 = zeros(0, n);
                Aeq = zeros(0, n);
                for i = 1:numel(complexes_in_upper)
                    for j = 1:numel(complexes_in_middle)
                        A_step_4_5(end + 1, :) = (Y(:, complexes_in_middle(j)) - Y(:, complexes_in_upper(i)))'; % add inequality Y(:, complexes_in_middle(j)) .* mu < Y(:, complexes_in_upper(i)) .* mu
                    end
                end
                for i = 1:numel(complexes_in_middle)
                    for j = i + 1:numel(complexes_in_middle)
                        Aeq(end + 1, :) = (Y(:, complexes_in_middle(i)) - Y(:, complexes_in_middle(j)))'; % add equality Y(:, complexes_in_middle(i)) .* mu = Y(:, complexes_in_middle(j)) .* mu
                    end
                    for j = 1:numel(complexes_in_lower)
                        A_step_4_5(end + 1, :) = (Y(:, complexes_in_lower(j)) - Y(:, complexes_in_middle(i)))'; % add inequality Y(:, complexes_in_lower(j)) .* mu < Y(:, complexes_in_middle(i)) .* mu
                    end
                end
                if isempty(complexes_in_middle)
                    for i = 1:numel(complexes_in_upper)
                        for j = 1:numel(complexes_in_lower)
                            A_step_4_5(end + 1, :) = (Y(:, complexes_in_lower(j)) - Y(:, complexes_in_upper(i)))'; % add inequality Y(:, complexes_in_lower(j)) .* mu < Y(:, complexes_in_upper(i)) .* mu
                        end
                    end
                end

                % Step 6
                % Preliminary inequalities adapted for chosen partition
                A_step_6 = zeros(0, n);
                for i = 1:numel(nontrivial_terminal_slc)
                    if nontrivial_tslc_partition_indexes(i) == 1 % the nontrivial terminal strong-linkage class were put in upper partition
                        Aeq = [Aeq; slc_Aeq_prelim{nontrivial_terminal_slc(i)}]; % add the corresponding preliminary equalities
                        A_step_6 = [A_step_6; slc_A_prelim{nontrivial_terminal_slc(i)}]; % add the corresponding preliminary inequalities
                    elseif nontrivial_tslc_partition_indexes(i) == 3 % the nontrivial terminal strong-linkage class were put in lower partition
                        Aeq = [Aeq; slc_Aeq_prelim{nontrivial_terminal_slc(i)}]; % add the corresponding preliminary equalities
                        A_step_6 = [A_step_6; -slc_A_prelim{nontrivial_terminal_slc(i)}]; % add the corresponding sign-reversed preliminary inequalities
                    end
                end

                f = [1; zeros(n, 1)];
                Aeq = [zeros(size(Aeq, 1), 1) Aeq];
                beq = zeros(size(Aeq, 1), 1);
                lb = -100 .*  ones(size(f));
                for step_7_8_rep = 1:1 + is_reversible
                    % Step 7
                    if step_7_8_rep == 1
                        A = [A_step_4_5; A_step_6];
                    else % changing  the confluence vector g to its opposite means reversing the preliminary strict inequalities in Step 2, which are then used in Step 6
                        A = [A_step_4_5; -A_step_6];
                    end

                    % Step 8
                    % Find a nonzero vector mu (species x 1) which
                    % satisfies the inequalities and is sign compatible
                    % with the stoichiometric subspace
                    A = [-ones(size(A, 1), 1) A];
                    b = zeros(size(A, 1), 1);
                    [x, lambda, exitflag] = linprog(f, A, b, Aeq, beq, lb, [], [], options); % without sign compatibility (nonlinear constraints)
                    if exitflag == 1 && x(1) < 0 && (((isempty(A) || all(A * x <= b)) && (isempty(Aeq) || isequal(Aeq * x, beq))) || x(1) <= -TolFun)
                    else
                        continue
                    end
                    for j = 1:size(possible_signs, 2)
                        A_with_signs = A;
                        Aeq_with_signs = Aeq;
                        for i = 1:n % add sign compatibility constraints for possible_signs(:, j)
                            if possible_signs(i, j) == -1 % < 0
                                A_with_signs(end + 1, :) = [-1, zeros(1, n)];
                                A_with_signs(end, i + 1) = 1; % mu(i) < 0
                            elseif possible_signs(i, j) == 0
                                Aeq_with_signs(end + 1, :) = zeros(1, n + 1);
                                Aeq_with_signs(end, i + 1) = 1; % mu(i) == 0
                            else % > 0
                                A_with_signs(end + 1, :) = [-1, zeros(1, n)];
                                A_with_signs(end, i + 1) = -1; % mu(i) > 0
                            end
                        end
                        b_with_signs = zeros(size(A_with_signs, 1), 1);
                        beq_with_signs = zeros(size(Aeq_with_signs, 1), 1);
                        [x, lambda, exitflag, output] = linprog(f, A_with_signs, b_with_signs, Aeq_with_signs, beq_with_signs, lb, [], [], options); % with sign compatibility, which includes x(2:n+1) ~= 0
                        if exitflag == 1 && x(1) < 0 && (((isempty(A_with_signs) || all(A_with_signs * x <= b_with_signs)) && (isempty(Aeq_with_signs) || isequal(Aeq_with_signs * x, beq_with_signs))) || x(1) <= -TolFun)
                        else
                            continue
                        end
                        mu = x(2:end);
                        partition_mult_pos_eq = true; % the system of inequalities is feasible
                        % Find two equilibria c1 and c2, and the
                        % corresponding rate constants for the mass action
                        % system
                        sigma = S * possible_signs_x(:, j); % vector in the stoichiometric subspace which has the same signs of mu
                        % Scale the values of mu and sigma so that they
                        % stay in the unit ball, to have better c1 and c2
                        % values
                        mu = mu / max(abs(mu));
                        sigma = sigma / max(abs(sigma));
                        c2 = sigma ./ (exp(mu) - 1);
                        c1 = sigma + c2;
                        % c1 - c2 == sigma and log(c1 ./ c2) == mu
                        % Find a posivite vector constants for which c1 and
                        % c2 are equilibria of the mass action system
                        f = [1; zeros(r, 1)];
                        A = -[ones(r, 1) eye(r)];
                        b = zeros(r, 1);
                        Aeq = zeros(2 * n, r + 1);
                        for k = 1:r
                            Aeq(1:n, k+1) = S(:, k) * prod(c1 .^ reactant_complexes(:, k));
                            Aeq(n+1:2*n, k+1) = S(:, k) * prod(c2 .^ reactant_complexes(:, k));
                        end
                        beq = zeros(2 * n, 1);
                        lb = -100 .*  ones(size(f));
                        [x, lambda, exitflag, output] = linprog(f, A, b, Aeq, beq, lb, [], [], options);
                        if exitflag == 1 && x(1) < 0 && (((isempty(A) || all(A * x <= b)) && (isempty(Aeq) || isequal(Aeq * x, beq))) || x(1) <= -TolFun)
                        else
                            error('Cannot find rate constants even if they should exist!')
                        end
                        constants = x(2:end);
                        break % for i = 1:size(possible_signs, 1)
                    end
                    if partition_mult_pos_eq
                        break % for step_7_8_rep = 1:n_step_7_8_rep
                    end
                end % for step_7_8_rep = 1:n_step_7_8_rep
                if partition_mult_pos_eq
                    break % while true
                end
                % return to Step 3
            end % while true
            % Step 9
            if partition_mult_pos_eq
                disp('The network is regular and the Deficiency-One Algorithm determines that the reaction network with mass action kinetics admits multiple positive equilibria within a stoichiometric compatibility class. For example for the rate constants')
                constants
                disp('the mass action system admits at least these 2 equilibria in the same stoichiometric compatibility class')
                c1
                c2
            else
                disp('The network is regular and the Deficiency-One Algorithm determines that the reaction network with mass action kinetics does not admit multiple positive equilibria within a stoichiometric compatibility class.')
            end
        end
    end % if d == 1 && d > sum(d_lc)
end % if d == 0

is_autocatalytic = any(any(reactant_complexes & product_complexes));
if is_autocatalytic
    disp('The reaction network with mass action or Michaelis-Menten kinetics is autocatalytic.')
    is_SSD = 'NA';

    sr_graph = umultigraph([species reactions], sr_edges);
    species_vertices = [true(size(species)) false(size(reactions))];
    if ~can_have_mult_pos_eq(sr_graph, species_vertices)
        disp('The reaction network with mass action kinetics does not have the capacity for multiple non-degenerate equilibria.')
    else
        disp('The reaction network has the capacity for multiple equilibria.')
    end
else
    disp('The reaction network with mass action or Michaelis-Menten kinetics is non-autocatalytic.')
    [is_SSD failing_rows failing_cols] = ssd(S);
    if is_SSD
        disp('The stoichiometric matrix is SSD. With said kinetics, the Jacobian matrix of the system of ODEs is a P0(-) matrix, so the reaction system is injective and does not have the capacity for multiple non-degenerate equilibria.')
    else
        disp('The stoichiometric matrix is not SSD. The reaction network has the capacity for multiple equilibria.');
        disp('One set of species and reactions because of which the stoichiometric matrix is not SSD: ')
        species(failing_rows)
        for i = 1:numel(failing_cols)
            reaction_string = [];
            reactants_ind = find(reactant_complexes(:, failing_cols(i)));
            for j = 1:numel(reactants_ind)
                reaction_string = [reaction_string num2str(reactant_complexes(reactants_ind(j), failing_cols(i))) ' ' species{reactants_ind(j)} ' + '];
            end
            reaction_string(end-2:end) = [];
            reaction_string = [reaction_string ' -> '];

            products_ind = find(product_complexes(:, failing_cols(i)));
            for j = 1:numel(products_ind)
                reaction_string = [reaction_string num2str(product_complexes(products_ind(j), failing_cols(i))) ' ' species{products_ind(j)} ' + '];
            end
            reaction_string(end-2:end) = []
        end
    end
end

ret = struct('reactant_complexes', reactant_complexes, 'S', S, 'd', d, 'is_reversible', is_reversible, 'is_weakly_reversible', is_weakly_reversible, 'is_autocatalytic', is_autocatalytic, 'is_SSD', is_SSD);
end % model_analysis()
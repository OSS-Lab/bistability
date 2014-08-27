% Examples of Feinberg, M. - Chemical reaction network structure and the
% stability of complex isothermal reactors  - I. The deficiency zero and
% deficiency one theorems - Chem. Eng. Sci. 42(10) - pp. 2229-2268 - 1987
clear model am

model(1).id = 'Feinberg87_ex4.9'; % deficiency 1, regular, reversible, multiple equilibria
model(1).name = 'Edelstein biochemical reactor';
model(1).species = struct('id', {'A1', 'A2', 'A3'});
model(1).reaction(1) = struct('id', 'A1<->2A1', 'reactant', struct('species', 'A1', 'stoichiometry', 1), 'product', struct('species', 'A1', 'stoichiometry', 2), 'reversible', true);
model(1).reaction(2) = struct('id', 'A1+A2<->A3', 'reactant', struct('species', {'A1' 'A2'}, 'stoichiometry', {1 1}), 'product', struct('species', 'A3', 'stoichiometry', 1), 'reversible', true);
model(1).reaction(3) = struct('id', 'A3<->A2', 'reactant', struct('species', 'A3', 'stoichiometry', 1), 'product', struct('species', 'A2', 'stoichiometry', 1), 'reversible', true);

model(2).id = 'Feinberg87_ex5.3'; % deficiency 0, NO multiple equilibria
model(2).species = struct('id', {'A1', 'A2'});
model(2).reaction(1) = struct('id', 'A1<->2A2', 'reactant', struct('species', 'A1', 'stoichiometry', 1), 'product', struct('species', 'A2', 'stoichiometry', 2), 'reversible', true);

% Examples of Feinberg, M. - Chemical reaction network structure and the
% stability of complex isothermal reactors  - II. Multiple steady states
% for networks of deficiency one - Chem. Eng. Sci. 43(1) - pp. 1-25 - 1988

model(3).id = 'Feinberg88_ex1.3'; % deficiency 1, reversible, NO multiple equilibria with mass action, autocatalytic
model(3).species = struct('id', {'A1', 'A2'});
model(3).reaction(1) = struct('id', '0<->A1', 'reactant', struct([]), 'product', struct('species', 'A1', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(2) = struct('id', 'A1<->A2', 'reactant', struct('species', 'A1', 'stoichiometry', 1), 'product', struct('species', 'A2', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(3) = struct('id', '2A1+A2<->3A1', 'reactant', struct('species', {'A1' 'A2'}, 'stoichiometry', {2 1}), 'product', struct('species', 'A1', 'stoichiometry', 3), 'reversible', true);

model(4).id = 'Feinberg88_ex4.1'; % deficiency 1, regular, multiple positive equilibria
model(4).species = struct('id', {'A1', 'A2', 'A3'});
model(4).reaction(1) = struct('id', 'A1<->2A1', 'reactant', struct('species', 'A1', 'stoichiometry', 1), 'product', struct('species', 'A1', 'stoichiometry', 2), 'reversible', true);
model(4).reaction(2) = struct('id', 'A1+A2->A3', 'reactant', struct('species', {'A1' 'A2'}, 'stoichiometry', {1 1}), 'product', struct('species', 'A3', 'stoichiometry', 1), 'reversible', false);
model(4).reaction(3) = struct('id', 'A3<->A2', 'reactant', struct('species', 'A3', 'stoichiometry', 1), 'product', struct('species', 'A2', 'stoichiometry', 1), 'reversible', true);

model(5).id = 'Feinberg88_ex4.24'; % equivalent to Feinberg87_ex6.24, deficiency 1, regular, multiple positive equilibria
model(5).species = struct('id', {'A1', 'A2'});
model(5).reaction(1) = struct('id', 'A2->A1', 'reactant', struct('species', 'A2', 'stoichiometry', 1), 'product', struct('species', 'A1', 'stoichiometry', 1), 'reversible', false);
model(5).reaction(2) = struct('id', 'A1+2A2->3A2', 'reactant', struct('species', {'A1' 'A2'}, 'stoichiometry', {1 2}), 'product', struct('species', 'A2', 'stoichiometry', 3), 'reversible', false);

% Examples of Feinberg, M. - The Existence and Uniqueness of Steady States
% for a Class of Chemical Reaction Networks - Archive for Rational
% Mechanics and Analysis 132(4) - pp. 311-370 - 1995
model(6).id = 'Feinberg95_1_ex1.1'; % deficiency 0, weekly reversible, interesting since the stoichiometric matrix is not SSD, and in the SR graph there is a cycle which is neither an o-cycle nor an s-cycle!!
model(6).species = struct('id', {'A', 'B', 'C', 'D', 'E'});
model(6).reaction(1) = struct('id', 'A<->2B', 'reactant', struct('species', 'A', 'stoichiometry', 1), 'product', struct('species', 'B', 'stoichiometry', 2), 'reversible', true);
model(6).reaction(2) = struct('id', 'A+C<->D', 'reactant', struct('species', {'A' 'C'}, 'stoichiometry', {1 1}), 'product', struct('species', 'D', 'stoichiometry', 1), 'reversible', true);
model(6).reaction(3) = struct('id', 'D->B+E', 'reactant', struct('species', 'D', 'stoichiometry', 1), 'product', struct('species', {'B' 'E'}, 'stoichiometry', {1 1}), 'reversible', false);
model(6).reaction(4) = struct('id', 'B+E->A+C', 'reactant', struct('species', {'B' 'E'}, 'stoichiometry', {1 1}), 'product', struct('species', {'A' 'C'}, 'stoichiometry', {1 1}), 'reversible', false);

model(7).id = 'Feinberg95_1_ex2.1'; % deficiency 0, not weakly reversible
model(7).species = struct('id', {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J'});
model(7).reaction(1) = struct('id', 'C->D+E', 'reactant', struct('species', 'C', 'stoichiometry', 1), 'product', struct('species', {'D' 'E'}, 'stoichiometry', {1 1}), 'reversible', false);
model(7).reaction(2) = struct('id', 'D+E<->F', 'reactant', struct('species', {'D' 'E'}, 'stoichiometry', {1 1}), 'product', struct('species', 'F', 'stoichiometry', 1), 'reversible', true);
model(7).reaction(3) = struct('id', 'C<->A+B', 'reactant', struct('species', 'C', 'stoichiometry', 1), 'product', struct('species', {'A' 'B'}, 'stoichiometry', {1 1}), 'reversible', true);
model(7).reaction(4) = struct('id', 'A+B->G', 'reactant', struct('species', {'A' 'B'}, 'stoichiometry', {1 1}), 'product', struct('species', 'G', 'stoichiometry', 1), 'reversible', false);
model(7).reaction(5) = struct('id', 'G->H', 'reactant', struct('species', 'G', 'stoichiometry', 1), 'product', struct('species', 'H', 'stoichiometry', 1), 'reversible', false);
model(7).reaction(6) = struct('id', '2J->G', 'reactant', struct('species', 'J', 'stoichiometry', 2), 'product', struct('species', 'G', 'stoichiometry', 1), 'reversible', false);
model(7).reaction(6) = struct('id', '2J->H', 'reactant', struct('species', 'J', 'stoichiometry', 2), 'product', struct('species', 'H', 'stoichiometry', 1), 'reversible', false);

model(8).id = 'Feinberg95_1_ex4.3'; % deficiency 1, not weakly reversible, at most one positive equilibrium, autocatalytic
model(8).species = struct('id', {'A', 'B'});
model(8).reaction(1) = struct('id', '2A<->A+B', 'reactant', struct('species', 'A', 'stoichiometry', 2), 'product', struct('species', {'A' 'B'}, 'stoichiometry', {1 1}), 'reversible', true);
model(8).reaction(2) = struct('id', 'A+B->2B', 'reactant', struct('species', {'A' 'B'}, 'stoichiometry', {1 1}), 'product', struct('species', 'B', 'stoichiometry', 2), 'reversible', false);

% Examples of Feinberg, M. - Multiple Steady States for Chemical Reaction
% Networks of Deficiency One - Archive for Rational Mechanics and Analysis
% 132(4) - pp. 371-406 - 1995

model(9).id = 'Feinberg95_2_ex2.6'; % deficiency 1, does not satisfy R.3, so Deficiency-One algorithm does not apply
model(9).species = struct('id', {'A', 'B', 'C', 'D', 'E', 'F', 'G'});
model(9).reaction(1) = struct('id', '2A->B', 'reactant', struct('species', 'A', 'stoichiometry', 2), 'product', struct('species', 'B', 'stoichiometry', 1), 'reversible', false);
model(9).reaction(2) = struct('id', 'B<->C+D', 'reactant', struct('species', 'B', 'stoichiometry', 1), 'product', struct('species', {'C' 'D'}, 'stoichiometry', {1 1}), 'reversible', true);
model(9).reaction(3) = struct('id', 'C+D<->E', 'reactant', struct('species', {'C' 'D'}, 'stoichiometry', {1 1}), 'product', struct('species', 'E', 'stoichiometry', 1), 'reversible', true);
model(9).reaction(4) = struct('id', 'C+D<->F', 'reactant', struct('species', {'C' 'D'}, 'stoichiometry', {1 1}), 'product', struct('species', 'F', 'stoichiometry', 1), 'reversible', true);
model(9).reaction(5) = struct('id', 'E->F', 'reactant', struct('species', 'E', 'stoichiometry', 1), 'product', struct('species', 'F', 'stoichiometry', 1), 'reversible', false);
model(9).reaction(6) = struct('id', 'C<->D', 'reactant', struct('species', 'C', 'stoichiometry', 1), 'product', struct('species', 'D', 'stoichiometry', 1), 'reversible', true);
model(9).reaction(7) = struct('id', 'D->A', 'reactant', struct('species', 'D', 'stoichiometry', 1), 'product', struct('species', 'A', 'stoichiometry', 1), 'reversible', false);
model(9).reaction(8) = struct('id', 'D->2G', 'reactant', struct('species', 'D', 'stoichiometry', 1), 'product', struct('species', 'G', 'stoichiometry', 2), 'reversible', false);
model(9).reaction(9) = struct('id', '2G->C', 'reactant', struct('species', 'G', 'stoichiometry', 2), 'product', struct('species', 'C', 'stoichiometry', 1), 'reversible', false);

model(10).id = 'Feinberg95_2_ex3.1'; % equivalent to Feinberg87_ex4.6 and Feinberg88_ex2.5, deficiency 1, regular, multiple positive equilibria
model(10).species = struct('id', {'A', 'B', 'C', 'S', 'AS', 'BS'});
model(10).reaction(1) = struct('id', 'A<->0', 'reactant', struct('species', 'A', 'stoichiometry', 1), 'product', struct([]), 'reversible', true);
model(10).reaction(2) = struct('id', '0<->B', 'reactant', struct([]), 'product', struct('species', 'B', 'stoichiometry', 1), 'reversible', true);
model(10).reaction(3) = struct('id', 'C->0', 'reactant', struct('species', 'C', 'stoichiometry', 1), 'product', struct([]), 'reversible', false);
model(10).reaction(4) = struct('id', 'A+S<->AS', 'reactant', struct('species', {'A' 'S'}, 'stoichiometry', {1 1}), 'product', struct('species', 'AS', 'stoichiometry', 1), 'reversible', true);
model(10).reaction(5) = struct('id', 'B+S<->BS', 'reactant', struct('species', {'B' 'S'}, 'stoichiometry', {1 1}), 'product', struct('species', 'BS', 'stoichiometry', 1), 'reversible', true);
model(10).reaction(6) = struct('id', 'AS+BS->C+2S', 'reactant', struct('species', {'AS' 'BS'}, 'stoichiometry', {1 1}), 'product', struct('species', {'C' 'S'}, 'stoichiometry', {1 2}), 'reversible', false);

for i = 1:numel(model)
    i
    am(i) = model_analysis(model(i));
end
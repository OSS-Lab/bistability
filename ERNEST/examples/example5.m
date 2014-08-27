% Examples of Schlosser, P. M., Feinberg, M. - A theory of multiple steady
% states in isothermal homogeneous CFSTRs with many reactions - Chemical
% Engineering Science 49(11) - pp. 1749-1767 - 1994

clear model am

model(1).id = 'Schlosser93_T1_entry1'; % multiple equilibria
model(1).species = struct('id', {'A', 'B', 'C', 'P', 'Q'});
model(1).reaction(1) = struct('id', 'A+B<->P', 'reactant', struct('species', {'A' 'B'}, 'stoichiometry', {1 1}), 'product', struct('species', 'P', 'stoichiometry', 1), 'reversible', true);
model(1).reaction(end+1) = struct('id', 'B+C<->Q', 'reactant', struct('species', {'B' 'C'}, 'stoichiometry', {1 1}), 'product', struct('species', 'Q', 'stoichiometry', 1), 'reversible', true);
model(1).reaction(end+1) = struct('id', 'C<->2A', 'reactant', struct('species', 'C', 'stoichiometry', 1), 'product', struct('species', 'A', 'stoichiometry', 2), 'reversible', true);
model(1).reaction(end+1) = struct('id', '0<->A', 'reactant', struct([]), 'product', struct('species', 'A', 'stoichiometry', 1), 'reversible', true);
model(1).reaction(end+1) = struct('id', '0<->B', 'reactant', struct([]), 'product', struct('species', 'B', 'stoichiometry', 1), 'reversible', true);
model(1).reaction(end+1) = struct('id', '0<->C', 'reactant', struct([]), 'product', struct('species', 'C', 'stoichiometry', 1), 'reversible', true);
model(1).reaction(end+1) = struct('id', '0<->P', 'reactant', struct([]), 'product', struct('species', 'P', 'stoichiometry', 1), 'reversible', true);
model(1).reaction(end+1) = struct('id', '0<->Q', 'reactant', struct([]), 'product', struct('species', 'Q', 'stoichiometry', 1), 'reversible', true);

model(2).id = 'Schlosser93_T1_entry2'; % NO multiple equilibria
model(2).species = struct('id', {'A', 'B', 'C', 'D', 'P', 'Q', 'R'});
model(2).reaction(1) = struct('id', 'A+B<->P', 'reactant', struct('species', {'A' 'B'}, 'stoichiometry', {1 1}), 'product', struct('species', 'P', 'stoichiometry', 1), 'reversible', true);
model(2).reaction(end+1) = struct('id', 'B+C<->Q', 'reactant', struct('species', {'B' 'C'}, 'stoichiometry', {1 1}), 'product', struct('species', 'Q', 'stoichiometry', 1), 'reversible', true);
model(2).reaction(end+1) = struct('id', 'C+D<->R', 'reactant', struct('species', {'C' 'D'}, 'stoichiometry', {1 1}), 'product', struct('species', 'R', 'stoichiometry', 1), 'reversible', true);
model(2).reaction(end+1) = struct('id', 'D<->2A', 'reactant', struct('species', 'D', 'stoichiometry', 1), 'product', struct('species', 'A', 'stoichiometry', 2), 'reversible', true);
model(2).reaction(end+1) = struct('id', '0<->A', 'reactant', struct([]), 'product', struct('species', 'A', 'stoichiometry', 1), 'reversible', true);
model(2).reaction(end+1) = struct('id', '0<->B', 'reactant', struct([]), 'product', struct('species', 'B', 'stoichiometry', 1), 'reversible', true);
model(2).reaction(end+1) = struct('id', '0<->C', 'reactant', struct([]), 'product', struct('species', 'C', 'stoichiometry', 1), 'reversible', true);
model(2).reaction(end+1) = struct('id', '0<->D', 'reactant', struct([]), 'product', struct('species', 'D', 'stoichiometry', 1), 'reversible', true);
model(2).reaction(end+1) = struct('id', '0<->P', 'reactant', struct([]), 'product', struct('species', 'P', 'stoichiometry', 1), 'reversible', true);
model(2).reaction(end+1) = struct('id', '0<->Q', 'reactant', struct([]), 'product', struct('species', 'Q', 'stoichiometry', 1), 'reversible', true);
model(2).reaction(end+1) = struct('id', '0<->R', 'reactant', struct([]), 'product', struct('species', 'R', 'stoichiometry', 1), 'reversible', true);

model(3).id = 'Schlosser93_T1_entry3'; % multiple equilibria
model(3).species = struct('id', {'A', 'B', 'C', 'D', 'E', 'P', 'Q', 'R', 'S'});
model(3).reaction(1) = struct('id', 'A+B<->P', 'reactant', struct('species', {'A' 'B'}, 'stoichiometry', {1 1}), 'product', struct('species', 'P', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(end+1) = struct('id', 'B+C<->Q', 'reactant', struct('species', {'B' 'C'}, 'stoichiometry', {1 1}), 'product', struct('species', 'Q', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(end+1) = struct('id', 'C+D<->R', 'reactant', struct('species', {'C' 'D'}, 'stoichiometry', {1 1}), 'product', struct('species', 'R', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(end+1) = struct('id', 'D+E<->S', 'reactant', struct('species', {'D' 'E'}, 'stoichiometry', {1 1}), 'product', struct('species', 'S', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(end+1) = struct('id', 'E<->2A', 'reactant', struct('species', 'E', 'stoichiometry', 1), 'product', struct('species', 'A', 'stoichiometry', 2), 'reversible', true);
model(3).reaction(end+1) = struct('id', '0<->A', 'reactant', struct([]), 'product', struct('species', 'A', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(end+1) = struct('id', '0<->B', 'reactant', struct([]), 'product', struct('species', 'B', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(end+1) = struct('id', '0<->C', 'reactant', struct([]), 'product', struct('species', 'C', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(end+1) = struct('id', '0<->D', 'reactant', struct([]), 'product', struct('species', 'D', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(end+1) = struct('id', '0<->E', 'reactant', struct([]), 'product', struct('species', 'E', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(end+1) = struct('id', '0<->P', 'reactant', struct([]), 'product', struct('species', 'P', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(end+1) = struct('id', '0<->Q', 'reactant', struct([]), 'product', struct('species', 'Q', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(end+1) = struct('id', '0<->R', 'reactant', struct([]), 'product', struct('species', 'R', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(end+1) = struct('id', '0<->S', 'reactant', struct([]), 'product', struct('species', 'S', 'stoichiometry', 1), 'reversible', true);

model(4).id = 'Schlosser93_T1_entry4'; % NO multiple equilibria
model(4).species = struct('id', {'A', 'B', 'C', 'P', 'Q'});
model(4).reaction(1) = struct('id', 'A+B<->P', 'reactant', struct('species', {'A' 'B'}, 'stoichiometry', {1 1}), 'product', struct('species', 'P', 'stoichiometry', 1), 'reversible', true);
model(4).reaction(end+1) = struct('id', 'B+C<->Q', 'reactant', struct('species', {'B' 'C'}, 'stoichiometry', {1 1}), 'product', struct('species', 'Q', 'stoichiometry', 1), 'reversible', true);
model(4).reaction(end+1) = struct('id', 'C<->A', 'reactant', struct('species', 'C', 'stoichiometry', 1), 'product', struct('species', 'A', 'stoichiometry', 1), 'reversible', true);
model(4).reaction(end+1) = struct('id', '0<->A', 'reactant', struct([]), 'product', struct('species', 'A', 'stoichiometry', 1), 'reversible', true);
model(4).reaction(end+1) = struct('id', '0<->B', 'reactant', struct([]), 'product', struct('species', 'B', 'stoichiometry', 1), 'reversible', true);
model(4).reaction(end+1) = struct('id', '0<->C', 'reactant', struct([]), 'product', struct('species', 'C', 'stoichiometry', 1), 'reversible', true);
model(4).reaction(end+1) = struct('id', '0<->P', 'reactant', struct([]), 'product', struct('species', 'P', 'stoichiometry', 1), 'reversible', true);
model(4).reaction(end+1) = struct('id', '0<->Q', 'reactant', struct([]), 'product', struct('species', 'Q', 'stoichiometry', 1), 'reversible', true);

model(5).id = 'Schlosser93_T1_entry5'; % multiple equilibria
model(5).species = struct('id', {'A', 'B', 'C', 'D', 'E', 'F', 'G'});
model(5).reaction(1) = struct('id', 'A+B<->F', 'reactant', struct('species', {'A' 'B'}, 'stoichiometry', {1 1}), 'product', struct('species', 'F', 'stoichiometry', 1), 'reversible', true);
model(5).reaction(end+1) = struct('id', 'A+C<->G', 'reactant', struct('species', {'A' 'C'}, 'stoichiometry', {1 1}), 'product', struct('species', 'G', 'stoichiometry', 1), 'reversible', true);
model(5).reaction(end+1) = struct('id', 'C+D<->B', 'reactant', struct('species', {'C' 'D'}, 'stoichiometry', {1 1}), 'product', struct('species', 'B', 'stoichiometry', 1), 'reversible', true);
model(5).reaction(end+1) = struct('id', 'C+E<->D', 'reactant', struct('species', {'C' 'E'}, 'stoichiometry', {1 1}), 'product', struct('species', 'D', 'stoichiometry', 1), 'reversible', true);
model(5).reaction(end+1) = struct('id', '0<->A', 'reactant', struct([]), 'product', struct('species', 'A', 'stoichiometry', 1), 'reversible', true);
model(5).reaction(end+1) = struct('id', '0<->B', 'reactant', struct([]), 'product', struct('species', 'B', 'stoichiometry', 1), 'reversible', true);
model(5).reaction(end+1) = struct('id', '0<->C', 'reactant', struct([]), 'product', struct('species', 'C', 'stoichiometry', 1), 'reversible', true);
model(5).reaction(end+1) = struct('id', '0<->D', 'reactant', struct([]), 'product', struct('species', 'D', 'stoichiometry', 1), 'reversible', true);
model(5).reaction(end+1) = struct('id', '0<->E', 'reactant', struct([]), 'product', struct('species', 'E', 'stoichiometry', 1), 'reversible', true);
model(5).reaction(end+1) = struct('id', '0<->F', 'reactant', struct([]), 'product', struct('species', 'F', 'stoichiometry', 1), 'reversible', true);
model(5).reaction(end+1) = struct('id', '0<->G', 'reactant', struct([]), 'product', struct('species', 'G', 'stoichiometry', 1), 'reversible', true);

model(6).id = 'Schlosser93_T1_entry6'; % NO multiple equilibria for mass action
model(6).species = struct('id', {'A', 'B'});
model(6).reaction(1) = struct('id', 'A+B<->2A', 'reactant', struct('species', {'A' 'B'}, 'stoichiometry', {1 1}), 'product', struct('species', 'A', 'stoichiometry', 2), 'reversible', true);
model(6).reaction(end+1) = struct('id', '0<->A', 'reactant', struct([]), 'product', struct('species', 'A', 'stoichiometry', 1), 'reversible', true);
model(6).reaction(end+1) = struct('id', '0<->B', 'reactant', struct([]), 'product', struct('species', 'B', 'stoichiometry', 1), 'reversible', true);

model(7).id = 'Schlosser93_T1_entry7'; % multiple equilibria
model(7).species = struct('id', {'A', 'B'});
model(7).reaction(1) = struct('id', '2A+B<->3A', 'reactant', struct('species', {'A' 'B'}, 'stoichiometry', {2 1}), 'product', struct('species', 'A', 'stoichiometry', 3), 'reversible', true);
model(7).reaction(end+1) = struct('id', '0<->A', 'reactant', struct([]), 'product', struct('species', 'A', 'stoichiometry', 1), 'reversible', true);
model(7).reaction(end+1) = struct('id', '0<->B', 'reactant', struct([]), 'product', struct('species', 'B', 'stoichiometry', 1), 'reversible', true);

model(8).id = 'Schlosser93_T1_entry8'; % NO multiple equilibria for mass action
model(8).species = struct('id', {'A', 'B'});
model(8).reaction(1) = struct('id', 'A+2B<->3A', 'reactant', struct('species', {'A' 'B'}, 'stoichiometry', {1 2}), 'product', struct('species', 'A', 'stoichiometry', 3), 'reversible', true);
model(8).reaction(end+1) = struct('id', '0<->A', 'reactant', struct([]), 'product', struct('species', 'A', 'stoichiometry', 1), 'reversible', true);
model(8).reaction(end+1) = struct('id', '0<->B', 'reactant', struct([]), 'product', struct('species', 'B', 'stoichiometry', 1), 'reversible', true);

for i = 1:numel(model)
    i
%    disp(['Model: ' model(i).name])
    am(i) = model_analysis(model(i));
end
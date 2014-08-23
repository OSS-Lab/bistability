% Examples of Angeli, D., De Leenheeer, P., Sontag E. - Graph-theoretic
% characterizations of monotonicity of chemical networks in reaction
% coordinates - J. Math. Biol.
clear model am

model(1).id = 'Angeli_J_Math_Biol_Ex1';
model(1).name = 'Single phosphorylation';
model(1).species = struct('id', {'S1', 'S2', 'E', 'F', 'ES1', 'FS2'});
model(1).reaction(1) = struct('id', 'S1+E<->ES1', 'reactant', struct('species', {'S1', 'E'}, 'stoichiometry', {1, 1}), 'product', struct('species', 'ES1', 'stoichiometry', 1), 'reversible', true);
model(1).reaction(2) = struct('id', 'ES1->S2+E', 'reactant', struct('species', 'ES1', 'stoichiometry', 1), 'product', struct('species', {'S2', 'E'}, 'stoichiometry', {1, 1}), 'reversible', false);
model(1).reaction(3) = struct('id', 'S2+F<->FS2', 'reactant', struct('species', {'S2', 'F'}, 'stoichiometry', {1, 1}), 'product', struct('species', 'FS2', 'stoichiometry', 1), 'reversible', true);
model(1).reaction(4) = struct('id', 'FS2->S1+F', 'reactant', struct('species', 'FS2', 'stoichiometry', 1), 'product', struct('species', {'S1', 'F'}, 'stoichiometry', {1, 1}), 'reversible', false);

model(2).id = 'Angeli_J_Math_Biol_Ex2';
model(2).name = 'EGF pathway (RKIP network)';
model(2).species = struct('id', {'Raf1', 'RKIP', 'Raf1_RKIP', 'ERK_PP', 'Raf1_RKIP_ERK_PP', 'ERK', 'RKIP_P', 'MEK_PP', 'MEK_PP_ERK', 'RP', 'RKIP_P_RP'});
model(2).reaction(1) = struct('id', 'Raf1+RKIP<->Raf1_RKIP', 'reactant', struct('species', {'Raf1', 'RKIP'}, 'stoichiometry', {1, 1}), 'product', struct('species', 'Raf1_RKIP', 'stoichiometry', 1), 'reversible', true);
model(2).reaction(2) = struct('id', 'Raf1_RKIP+ERK_PP<->Raf1_RKIP_ERK_PP', 'reactant', struct('species', {'Raf1_RKIP', 'ERK_PP'}, 'stoichiometry', {1, 1}), 'product', struct('species', 'Raf1_RKIP_ERK_PP', 'stoichiometry', 1), 'reversible', true);
model(2).reaction(3) = struct('id', 'Raf1_RKIP_ERK_PP->Raf1+ERK+RKIP_P', 'reactant', struct('species', 'Raf1_RKIP_ERK_PP', 'stoichiometry', 1), 'product', struct('species', {'Raf1', 'ERK', 'RKIP_P'}, 'stoichiometry', {1, 1, 1}), 'reversible', false);
model(2).reaction(4) = struct('id', 'MEK_PP+ERK<->MEK_PP_ERK', 'reactant', struct('species', {'MEK_PP', 'ERK'}, 'stoichiometry', {1, 1}), 'product', struct('species', 'MEK_PP_ERK', 'stoichiometry', 1), 'reversible', true);
model(2).reaction(5) = struct('id', 'MEK_PP_ERK->MEK_PP+ERK_PP', 'reactant', struct('species', 'MEK_PP_ERK', 'stoichiometry', 1), 'product', struct('species', {'MEK_PP', 'ERK_PP'}, 'stoichiometry', {1, 1}), 'reversible', false);
model(2).reaction(6) = struct('id', 'RKIP_P+RP<->RKIP_P_RP', 'reactant', struct('species', {'RKIP_P', 'RP'}, 'stoichiometry', {1, 1}), 'product', struct('species', 'RKIP_P_RP', 'stoichiometry', 1), 'reversible', true);
model(2).reaction(7) = struct('id', 'RKIP_P_RP->RKIP+RP', 'reactant', struct('species', 'RKIP_P_RP', 'stoichiometry', 1), 'product', struct('species', {'RKIP', 'RP'}, 'stoichiometry', {1, 1}), 'reversible', false);

for i = 1:numel(model)
    i
    disp(['Model: ' model(i).name])
    model_analysis(model(i));
end
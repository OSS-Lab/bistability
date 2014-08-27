% Possible models of MAPK activation/deactivation, Conradi, C., et al. -
% Using chemical reaction network theory to discard a kinetic mechanism
% hypothesis - IEE Proc. Syst. Biol. 152(4) - pp. 243-248 - 2005
clear model am
model(1).id = 'Conradi_IEE_Proc_Syst_Biol_2005_m1'; % multiple equilibria
model(1).name = 'Distributive mechanism for both phosphorylation and dephosphorylation';
model(1).species = struct('id', {'MAPK', 'MAPKK', 'MAPK_MAPKK', 'MAPKp', 'MAPKp_MAPKK', 'MAPKpp', 'phosphatase', 'MAPKpp_phosphatase', 'MAPKp_phosphatase'});
model(1).reaction(1) = struct('id', 'MAPK+MAPKK<->MAPK_MAPKK', 'reactant', struct('species', {'MAPK' 'MAPKK'}, 'stoichiometry', {1 1}), 'product', struct('species', 'MAPK_MAPKK', 'stoichiometry', 1), 'reversible', true);
model(1).reaction(2) = struct('id', 'MAPK_MAPKK->MAPKp+MAPKK', 'reactant', struct('species', 'MAPK_MAPKK', 'stoichiometry', 1), 'product', struct('species', {'MAPKp', 'MAPKK'}, 'stoichiometry', {1 1}), 'reversible', false);
model(1).reaction(3) = struct('id', 'MAPKp+MAPKK<->MAPKp_MAPKK', 'reactant', struct('species', {'MAPKp' 'MAPKK'}, 'stoichiometry', {1 1}), 'product', struct('species', 'MAPKp_MAPKK', 'stoichiometry', 1), 'reversible', true);
model(1).reaction(4) = struct('id', 'MAPKp_MAPKK->MAPKpp+MAPKK', 'reactant', struct('species', 'MAPKp_MAPKK', 'stoichiometry', 1), 'product', struct('species', {'MAPKpp', 'MAPKK'}, 'stoichiometry', {1 1}), 'reversible', false);
model(1).reaction(5) = struct('id', 'MAPKpp+phosphatase<->MAPKpp_phosphatase', 'reactant', struct('species', {'MAPKpp' 'phosphatase'}, 'stoichiometry', {1 1}), 'product', struct('species', 'MAPKpp_phosphatase', 'stoichiometry', 1), 'reversible', true);
model(1).reaction(6) = struct('id', 'MAPKpp_phosphatase->MAPKp+phosphatase', 'reactant', struct('species', 'MAPKpp_phosphatase', 'stoichiometry', 1), 'product', struct('species', {'MAPKp', 'phosphatase'}, 'stoichiometry', {1 1}), 'reversible', false);
model(1).reaction(7) = struct('id', 'MAPKp+phosphatase<->MAPKp_phosphatase', 'reactant', struct('species', {'MAPKp' 'phosphatase'}, 'stoichiometry', {1 1}), 'product', struct('species', 'MAPKp_phosphatase', 'stoichiometry', 1), 'reversible', true);
model(1).reaction(8) = struct('id', 'MAPKp_phosphatase->MAPK+phosphatase', 'reactant', struct('species', 'MAPKp_phosphatase', 'stoichiometry', 1), 'product', struct('species', {'MAPK', 'phosphatase'}, 'stoichiometry', {1 1}), 'reversible', false);

model(2).id = 'Conradi_IEE_Proc_Syst_Biol_2005_m2'; % NO multiple equilibria for mass action kinetics
model(2).name = 'Processive mechanism for phosphorylation and distributive mechanism for dephosphorylation';
model(2).species = struct('id', {'MAPK', 'MAPKK', 'MAPK_MAPKK', 'MAPKp', 'MAPKp_MAPKK', 'MAPKpp', 'phosphatase', 'MAPKpp_phosphatase', 'MAPKp_phosphatase'});
model(2).reaction(1) = struct('id', 'MAPK+MAPKK<->MAPK_MAPKK', 'reactant', struct('species', {'MAPK' 'MAPKK'}, 'stoichiometry', {1 1}), 'product', struct('species', 'MAPK_MAPKK', 'stoichiometry', 1), 'reversible', true);
model(2).reaction(2) = struct('id', 'MAPK_MAPKK<->MAPKp_MAPKK', 'reactant', struct('species', 'MAPK_MAPKK', 'stoichiometry', 1), 'product', struct('species', 'MAPKp_MAPKK', 'stoichiometry', 1), 'reversible', true);
model(2).reaction(3) = struct('id', 'MAPKp_MAPKK->MAPKpp+MAPKK', 'reactant', struct('species', 'MAPKp_MAPKK', 'stoichiometry', 1), 'product', struct('species', {'MAPKpp', 'MAPKK'}, 'stoichiometry', {1 1}), 'reversible', false);
model(2).reaction(4) = struct('id', 'MAPKpp+phosphatase<->MAPKpp_phosphatase', 'reactant', struct('species', {'MAPKpp' 'phosphatase'}, 'stoichiometry', {1 1}), 'product', struct('species', 'MAPKpp_phosphatase', 'stoichiometry', 1), 'reversible', true);
model(2).reaction(5) = struct('id', 'MAPKpp_phosphatase->MAPKp+phosphatase', 'reactant', struct('species', 'MAPKpp_phosphatase', 'stoichiometry', 1), 'product', struct('species', {'MAPKp', 'phosphatase'}, 'stoichiometry', {1 1}), 'reversible', false);
model(2).reaction(6) = struct('id', 'MAPKp+phosphatase<->MAPKp_phosphatase', 'reactant', struct('species', {'MAPKp' 'phosphatase'}, 'stoichiometry', {1 1}), 'product', struct('species', 'MAPKp_phosphatase', 'stoichiometry', 1), 'reversible', true);
model(2).reaction(7) = struct('id', 'MAPKp_phosphatase->MAPK+phosphatase', 'reactant', struct('species', 'MAPKp_phosphatase', 'stoichiometry', 1), 'product', struct('species', {'MAPK', 'phosphatase'}, 'stoichiometry', {1 1}), 'reversible', false);

model(3).id = 'Conradi_IEE_Proc_Syst_Biol_2005_m3'; % NO multiple equilibria
model(3).name = 'Processive mechanism for both phosphorylation and dephosphorylation';
model(3).species = struct('id', {'MAPK', 'MAPKK', 'MAPK_MAPKK', 'MAPKp_MAPKK', 'MAPKpp', 'phosphatase', 'MAPKpp_phosphatase', 'MAPKp_phosphatase'});
model(3).reaction(1) = struct('id', 'MAPK+MAPKK<->MAPK_MAPKK', 'reactant', struct('species', {'MAPK' 'MAPKK'}, 'stoichiometry', {1 1}), 'product', struct('species', 'MAPK_MAPKK', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(2) = struct('id', 'MAPK_MAPKK<->MAPKp_MAPKK', 'reactant', struct('species', 'MAPK_MAPKK', 'stoichiometry', 1), 'product', struct('species', 'MAPKp_MAPKK', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(3) = struct('id', 'MAPKp_MAPKK->MAPKpp+MAPKK', 'reactant', struct('species', 'MAPKp_MAPKK', 'stoichiometry', 1), 'product', struct('species', {'MAPKpp', 'MAPKK'}, 'stoichiometry', {1 1}), 'reversible', false);
model(3).reaction(4) = struct('id', 'MAPKpp+phosphatase<->MAPKpp_phosphatase', 'reactant', struct('species', {'MAPKpp' 'phosphatase'}, 'stoichiometry', {1 1}), 'product', struct('species', 'MAPKpp_phosphatase', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(5) = struct('id', 'MAPKpp_phosphatase<->MAPKp_phosphatase', 'reactant', struct('species', 'MAPKpp_phosphatase', 'stoichiometry', 1), 'product', struct('species', 'MAPKp_phosphatase', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(6) = struct('id', 'MAPKp_phosphatase->MAPK+phosphatase', 'reactant', struct('species', 'MAPKp_phosphatase', 'stoichiometry', 1), 'product', struct('species', {'MAPK', 'phosphatase'}, 'stoichiometry', {1 1}), 'reversible', false);

for i = 1:numel(model)
    i
    disp(['Model: ' model(i).name])
    am(i) = model_analysis(model(i));
end
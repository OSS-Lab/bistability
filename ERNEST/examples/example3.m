% Example 1.1 of Craciun, G., Feinberg, M. - Multiple Equilibria in Complex
% Chemical Reaction Networks II: The Specie-Reaction Graph - SIAM J. Appl.
% Math. 66(4) - pp. 1321-1338 - 2006
clear model am

model.typecode = 'SBML_MODEL';
model.metaid = '';
model.notes = '';
model.annotation = '';
model.SBML_level = 2;
model.SBML_version = 1;
model.functionDefinition = [];
model.unitDefinition = [];
model.compartment = [];
model.parameter = [];
model.rule = [];
model.event = [];
model.id = 'Craciun_SIAM_J_Appl_Math_2006_Ex1.1'; % NO multiple equilibria
model.name = 'Example 1.1 of Craciun, Feinberg (2006)';
model.species = struct('typecode', 'SBML_SPECIES', 'metaid', '', 'notes', '', 'annotation', '', 'name', '', 'id', {'A', 'B', 'M', 'N', 'R', 'X', 'Y', 'Z'}, 'compartment', '', 'initialAmount', '', 'initialConcentration', '', 'substanceUnits', '', 'spatialSizeUnits', '', 'hasOnlySubstanceUnits', '', 'boundaryCondition', '', 'charge', '', 'constant', 0, 'isSetInitialAmount', 0, 'isSetInitialConcentration', 0, 'isSetCharge', 0);
model.reaction(1) = struct('id', 'A+M<->X', 'reactant', struct('species', {'A' 'M'}, 'stoichiometry', {1 1}), 'product', struct('species', 'X', 'stoichiometry', 1), 'reversible', true);
model.reaction(2) = struct('id', 'B+N<->Y', 'reactant', struct('species', {'B' 'N'}, 'stoichiometry', {1 1}), 'product', struct('species', 'Y', 'stoichiometry', 1), 'reversible', true);
model.reaction(3) = struct('id', 'Y->2A+N', 'reactant', struct('species', 'Y', 'stoichiometry', 1), 'product', struct('species', {'A' 'N'}, 'stoichiometry', {2 1}), 'reversible', false);
model.reaction(4) = struct('id', 'B+X<->Z', 'reactant', struct('species', {'B' 'X'}, 'stoichiometry', {1 1}), 'product', struct('species', 'Z', 'stoichiometry', 1), 'reversible', true);
model.reaction(5) = struct('id', 'Z->R+M', 'reactant', struct('species', 'Z', 'stoichiometry', 1), 'product', struct('species', {'R' 'M'}, 'stoichiometry', {1 1}), 'reversible', false);
model.reaction(6) = struct('id', '0<->A', 'reactant', struct([]), 'product', struct('species', 'A', 'stoichiometry', 1), 'reversible', true);
model.reaction(7) = struct('id', '0<->B', 'reactant', struct([]), 'product', struct('species', 'B', 'stoichiometry', 1), 'reversible', true);
model.reaction(8) = struct('id', '0<->M', 'reactant', struct([]), 'product', struct('species', 'M', 'stoichiometry', 1), 'reversible', true);
model.reaction(9) = struct('id', '0<->N', 'reactant', struct([]), 'product', struct('species', 'N', 'stoichiometry', 1), 'reversible', true);
model.reaction(10) = struct('id', '0<->R', 'reactant', struct([]), 'product', struct('species', 'R', 'stoichiometry', 1), 'reversible', true);
model.reaction(11) = struct('id', '0<->X', 'reactant', struct([]), 'product', struct('species', 'X', 'stoichiometry', 1), 'reversible', true);
model.reaction(12) = struct('id', '0<->Y', 'reactant', struct([]), 'product', struct('species', 'Y', 'stoichiometry', 1), 'reversible', true);
model.reaction(13) = struct('id', '0<->Z', 'reactant', struct([]), 'product', struct('species', 'Z', 'stoichiometry', 1), 'reversible', true);

disp(['Model: ' model.name])
am = model_analysis(model);
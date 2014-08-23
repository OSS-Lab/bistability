% Examples of Craciun, G., Tang, Y., Feinberg, M. - Understanding
% bistability in complex enzyme-driven reaction networks - PNAS 103(23) -
% pp. 8697-8702 - 2006
clear model am

model(1).id = 'Craciun_PNAS_2006_T1_entry1'; % NO multiple equilibria
model(1).name = 'Elementary enzyme catalysis: S -> P';
model(1).species = struct('id', {'E', 'S', 'ES', 'P'});
model(1).reaction(1) = struct('id', 'E+S<->ES', 'reactant', struct('species', {'E' 'S'}, 'stoichiometry', {1 1}), 'product', struct('species', 'ES', 'stoichiometry', 1), 'reversible', true);
model(1).reaction(2) = struct('id', 'ES->E+P', 'reactant', struct('species', 'ES', 'stoichiometry', 1), 'product', struct('species', {'E' 'P'}, 'stoichiometry', {1 1}), 'reversible', false);
model(1).reaction(3) = struct('id', '0<->S', 'reactant', struct([]), 'product', struct('species', 'S', 'stoichiometry', 1), 'reversible', true);
model(1).reaction(4) = struct('id', 'P->0', 'reactant', struct('species', 'P', 'stoichiometry', 1), 'product', struct([]), 'reversible', false);

model(2).id = 'Craciun_PNAS_2006_T1_entry2'; % NO multiple equilibria
model(2).name = 'Elementary enzyme catalysis with competitive inhibition: S -> P';
model(2).species = struct('id', {'E', 'S', 'ES', 'P', 'I', 'EI'});
model(2).reaction(1) = struct('id', 'E+S<->ES', 'reactant', struct('species', {'E' 'S'}, 'stoichiometry', {1 1}), 'product', struct('species', 'ES', 'stoichiometry', 1), 'reversible', true);
model(2).reaction(2) = struct('id', 'ES->E+P', 'reactant', struct('species', 'ES', 'stoichiometry', 1), 'product', struct('species', {'E' 'P'}, 'stoichiometry', {1 1}), 'reversible', false);
model(2).reaction(3) = struct('id', 'E+I<->EI', 'reactant', struct('species', {'E' 'I'}, 'stoichiometry', {1 1}), 'product', struct('species', 'EI', 'stoichiometry', 1), 'reversible', true);
model(2).reaction(4) = struct('id', '0<->S', 'reactant', struct([]), 'product', struct('species', 'S', 'stoichiometry', 1), 'reversible', true);
model(2).reaction(5) = struct('id', '0<->I', 'reactant', struct([]), 'product', struct('species', 'I', 'stoichiometry', 1), 'reversible', true);
model(2).reaction(6) = struct('id', 'P->0', 'reactant', struct('species', 'P', 'stoichiometry', 1), 'product', struct([]), 'reversible', false);

model(3).id = 'Craciun_PNAS_2006_T1_entry3'; % NO multiple equilibria
model(3).name = 'Elementary enzyme catalysis with uncompetitive inhibition: S -> P';
model(3).species = struct('id', {'E', 'S', 'ES', 'P', 'I', 'ESI'});
model(3).reaction(1) = struct('id', 'E+S<->ES', 'reactant', struct('species', {'E' 'S'}, 'stoichiometry', {1 1}), 'product', struct('species', 'ES', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(2) = struct('id', 'ES->E+P', 'reactant', struct('species', 'ES', 'stoichiometry', 1), 'product', struct('species', {'E' 'P'}, 'stoichiometry', {1 1}), 'reversible', false);
model(3).reaction(3) = struct('id', 'ES+I<->ESI', 'reactant', struct('species', {'ES' 'I'}, 'stoichiometry', {1 1}), 'product', struct('species', 'ESI', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(4) = struct('id', '0<->S', 'reactant', struct([]), 'product', struct('species', 'S', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(5) = struct('id', '0<->I', 'reactant', struct([]), 'product', struct('species', 'I', 'stoichiometry', 1), 'reversible', true);
model(3).reaction(6) = struct('id', 'P->0', 'reactant', struct('species', 'P', 'stoichiometry', 1), 'product', struct([]), 'reversible', false);

model(4).id = 'Craciun_PNAS_2006_T1_entry4'; % multiple equilibria
model(4).name = 'Elementary enzyme catalysis with mixed inhibition: S -> P';
model(4).species = struct('id', {'E', 'S', 'ES', 'P', 'I', 'EI', 'ESI'});
model(4).reaction(1) = struct('id', 'E+S<->ES', 'reactant', struct('species', {'E' 'S'}, 'stoichiometry', {1 1}), 'product', struct('species', 'ES', 'stoichiometry', 1), 'reversible', true);
model(4).reaction(2) = struct('id', 'ES->E+P', 'reactant', struct('species', 'ES', 'stoichiometry', 1), 'product', struct('species', {'E' 'P'}, 'stoichiometry', {1 1}), 'reversible', false);
model(4).reaction(3) = struct('id', 'E+I<->EI', 'reactant', struct('species', {'E' 'I'}, 'stoichiometry', {1 1}), 'product', struct('species', 'EI', 'stoichiometry', 1), 'reversible', true);
model(4).reaction(4) = struct('id', 'ES+I<->ESI', 'reactant', struct('species', {'ES' 'I'}, 'stoichiometry', {1 1}), 'product', struct('species', 'ESI', 'stoichiometry', 1), 'reversible', true);
model(4).reaction(5) = struct('id', 'ESI<->EI+S', 'reactant', struct('species', 'ESI', 'stoichiometry', 1), 'product', struct('species', {'EI' 'S'}, 'stoichiometry', {1 1}), 'reversible', true);
model(4).reaction(6) = struct('id', '0<->S', 'reactant', struct([]), 'product', struct('species', 'S', 'stoichiometry', 1), 'reversible', true);
model(4).reaction(7) = struct('id', '0<->I', 'reactant', struct([]), 'product', struct('species', 'I', 'stoichiometry', 1), 'reversible', true);
model(4).reaction(8) = struct('id', 'P->0', 'reactant', struct('species', 'P', 'stoichiometry', 1), 'product', struct([]), 'reversible', false);

model(5).id = 'Craciun_PNAS_2006_T1_entry5'; % NO multiple equilibria
model(5).name = 'Two-substrate enzyme catalysis with ordered substrate binding: S1 + S2 -> P';
model(5).species = struct('id', {'E', 'S1', 'ES1', 'S2', 'ES1S2', 'P'});
model(5).reaction(1) = struct('id', 'E+S1<->ES1', 'reactant', struct('species', {'E' 'S1'}, 'stoichiometry', {1 1}), 'product', struct('species', 'ES1', 'stoichiometry', 1), 'reversible', true);
model(5).reaction(2) = struct('id', 'S2+ES1<->ES1S2', 'reactant', struct('species', {'S2' 'ES1'}, 'stoichiometry', {1 1}), 'product', struct('species', 'ES1S2', 'stoichiometry', 1), 'reversible', true);
model(5).reaction(3) = struct('id', 'ES1S2->E+P', 'reactant', struct('species', 'ES1S2', 'stoichiometry', 1), 'product', struct('species', {'E' 'P'}, 'stoichiometry', {1 1}), 'reversible', false);
model(5).reaction(4) = struct('id', '0<->S1', 'reactant', struct([]), 'product', struct('species', 'S1', 'stoichiometry', 1), 'reversible', true);
model(5).reaction(5) = struct('id', '0<->S2', 'reactant', struct([]), 'product', struct('species', 'S2', 'stoichiometry', 1), 'reversible', true);
model(5).reaction(6) = struct('id', 'P->0', 'reactant', struct('species', 'P', 'stoichiometry', 1), 'product', struct([]), 'reversible', false);

model(6).id = 'Craciun_PNAS_2006_T1_entry6'; % multiple equilibria
model(6).name = 'Two-substrate enzyme catalysis with unordered substrate binding: S1 + S2 -> P';
model(6).species = struct('id', {'E', 'S1', 'ES1', 'S2', 'ES2', 'ES1S2', 'P'});
model(6).reaction(1) = struct('id', 'E+S1<->ES1', 'reactant', struct('species', {'E' 'S1'}, 'stoichiometry', {1 1}), 'product', struct('species', 'ES1', 'stoichiometry', 1), 'reversible', true);
model(6).reaction(2) = struct('id', 'E+S2<->ES2', 'reactant', struct('species', {'E' 'S2'}, 'stoichiometry', {1 1}), 'product', struct('species', 'ES2', 'stoichiometry', 1), 'reversible', true);
model(6).reaction(3) = struct('id', 'S2+ES1<->ES1S2', 'reactant', struct('species', {'S2' 'ES1'}, 'stoichiometry', {1 1}), 'product', struct('species', 'ES1S2', 'stoichiometry', 1), 'reversible', true);
model(6).reaction(4) = struct('id', 'ES1S2<->S1+ES2', 'reactant', struct('species', 'ES1S2', 'stoichiometry', 1), 'product', struct('species', {'S1' 'ES2'}, 'stoichiometry', {1 1}), 'reversible', true);
model(6).reaction(5) = struct('id', 'ES1S2->E+P', 'reactant', struct('species', 'ES1S2', 'stoichiometry', 1), 'product', struct('species', {'E' 'P'}, 'stoichiometry', {1 1}), 'reversible', false);
model(6).reaction(6) = struct('id', '0<->S1', 'reactant', struct([]), 'product', struct('species', 'S1', 'stoichiometry', 1), 'reversible', true);
model(6).reaction(7) = struct('id', '0<->S2', 'reactant', struct([]), 'product', struct('species', 'S2', 'stoichiometry', 1), 'reversible', true);
model(6).reaction(8) = struct('id', 'P->0', 'reactant', struct('species', 'P', 'stoichiometry', 1), 'product', struct([]), 'reversible', false);

model(7).id = 'Craciun_PNAS_2006_T1_entry7'; % NO multiple equilibria
model(7).name = 'Two-substrate enzyme catalysis with ordered substrate binding: S1 + S2 -> P; Elementary enzyme catalysis: S2 -> 2 S1';
model(7).species = struct('id', {'E1', 'S1', 'E1S1', 'S2', 'E1S1S2', 'P', 'E2', 'E2S2'});
model(7).reaction(1) = struct('id', 'E1+S1<->E1S1', 'reactant', struct('species', {'E1' 'S1'}, 'stoichiometry', {1 1}), 'product', struct('species', 'E1S1', 'stoichiometry', 1), 'reversible', true);
model(7).reaction(2) = struct('id', 'S2+E1S1<->E1S1S2', 'reactant', struct('species', {'S2' 'E1S1'}, 'stoichiometry', {1 1}), 'product', struct('species', 'E1S1S2', 'stoichiometry', 1), 'reversible', true);
model(7).reaction(3) = struct('id', 'E1S1S2->E1+P', 'reactant', struct('species', 'E1S1S2', 'stoichiometry', 1), 'product', struct('species', {'E1' 'P'}, 'stoichiometry', {1 1}), 'reversible', false);
model(7).reaction(4) = struct('id', 'E2+S2<->E2S2', 'reactant', struct('species', {'E2' 'S2'}, 'stoichiometry', {1 1}), 'product', struct('species', 'E2S2', 'stoichiometry', 1), 'reversible', true);
model(7).reaction(5) = struct('id', 'E2S2->E2+2S1', 'reactant', struct('species', 'E2S2', 'stoichiometry', 1), 'product', struct('species', {'E2' 'S1'}, 'stoichiometry', {1 2}), 'reversible', false);
model(7).reaction(6) = struct('id', '0<->S1', 'reactant', struct([]), 'product', struct('species', 'S1', 'stoichiometry', 1), 'reversible', true);
model(7).reaction(7) = struct('id', '0<->S2', 'reactant', struct([]), 'product', struct('species', 'S2', 'stoichiometry', 1), 'reversible', true);
model(7).reaction(8) = struct('id', 'P->0', 'reactant', struct('species', 'P', 'stoichiometry', 1), 'product', struct([]), 'reversible', false);

model(8).id = 'Craciun_PNAS_2006_T1_entry8'; % multiple equilibria
model(8).name = 'Two-substrate enzyme catalysis with ordered substrate binding: S1 + S2 -> P1; Two-substrate enzyme catalysis with ordered substrate binding: S2 + S3 -> P2; Elementary enzyme catalysis: S3 -> 2 S1';
model(8).species = struct('id', {'E1', 'S1', 'E1S1', 'S2', 'E1S1S2', 'P1', 'E2', 'E2S2', 'S3', 'E2S2S3', 'P2', 'E3', 'E3S3'});
model(8).reaction(1) = struct('id', 'E1+S1<->E1S1', 'reactant', struct('species', {'E1' 'S1'}, 'stoichiometry', {1 1}), 'product', struct('species', 'E1S1', 'stoichiometry', 1), 'reversible', true);
model(8).reaction(2) = struct('id', 'S2+E1S1<->E1S1S2', 'reactant', struct('species', {'S2' 'E1S1'}, 'stoichiometry', {1 1}), 'product', struct('species', 'E1S1S2', 'stoichiometry', 1), 'reversible', true);
model(8).reaction(3) = struct('id', 'E1S1S2->E1+P1', 'reactant', struct('species', 'E1S1S2', 'stoichiometry', 1), 'product', struct('species', {'E1' 'P1'}, 'stoichiometry', {1 1}), 'reversible', false);
model(8).reaction(4) = struct('id', 'E2+S2<->E2S2', 'reactant', struct('species', {'E2' 'S2'}, 'stoichiometry', {1 1}), 'product', struct('species', 'E2S2', 'stoichiometry', 1), 'reversible', true);
model(8).reaction(5) = struct('id', 'S3+E2S2<->E2S2S3', 'reactant', struct('species', {'S3' 'E2S2'}, 'stoichiometry', {1 1}), 'product', struct('species', 'E2S2S3', 'stoichiometry', 1), 'reversible', true);
model(8).reaction(6) = struct('id', 'E2S2S3->E2+P2', 'reactant', struct('species', 'E2S2S3', 'stoichiometry', 1), 'product', struct('species', {'E2' 'P2'}, 'stoichiometry', {1 1}), 'reversible', false);
model(8).reaction(7) = struct('id', 'E3+S3<->E3S3', 'reactant', struct('species', {'E3' 'S3'}, 'stoichiometry', {1 1}), 'product', struct('species', 'E3S3', 'stoichiometry', 1), 'reversible', true);
model(8).reaction(8) = struct('id', 'E3S3->E3+2S1', 'reactant', struct('species', 'E3S3', 'stoichiometry', 1), 'product', struct('species', {'E3' 'S1'}, 'stoichiometry', {1 2}), 'reversible', false);
model(8).reaction(9) = struct('id', '0<->S1', 'reactant', struct([]), 'product', struct('species', 'S1', 'stoichiometry', 1), 'reversible', true);
model(8).reaction(10) = struct('id', '0<->S2', 'reactant', struct([]), 'product', struct('species', 'S2', 'stoichiometry', 1), 'reversible', true);
model(8).reaction(11) = struct('id', '0<->S3', 'reactant', struct([]), 'product', struct('species', 'S3', 'stoichiometry', 1), 'reversible', true);
model(8).reaction(12) = struct('id', 'P1->0', 'reactant', struct('species', 'P1', 'stoichiometry', 1), 'product', struct([]), 'reversible', false);
model(8).reaction(13) = struct('id', 'P2->0', 'reactant', struct('species', 'P2', 'stoichiometry', 1), 'product', struct([]), 'reversible', false);

model(9).id = 'Craciun_PNAS_2006_T1_entry9'; % NO multiple equilibria
model(9).name = 'Two-substrate enzyme catalysis with ordered substrate binding: S1 + S2 -> P1; Two-substrate enzyme catalysis with ordered substrate binding: S2 + S3 -> P2; Two-substrate enzyme catalysis with ordered substrate binding: S3 + S4 -> P3; Elementary enzyme catalysis: S4 -> 2 S1';
model(9).species = struct('id', {'E1', 'S1', 'E1S1', 'S2', 'E1S1S2', 'P1', 'E2', 'E2S2', 'S3', 'E2S2S3', 'P2', 'E3', 'E3S3', 'S4', 'E3S3S4', 'P3', 'E4', 'E4S4'});
model(9).reaction(1) = struct('id', 'E1+S1<->E1S1', 'reactant', struct('species', {'E1' 'S1'}, 'stoichiometry', {1 1}), 'product', struct('species', 'E1S1', 'stoichiometry', 1), 'reversible', true);
model(9).reaction(2) = struct('id', 'S2+E1S1<->E1S1S2', 'reactant', struct('species', {'S2' 'E1S1'}, 'stoichiometry', {1 1}), 'product', struct('species', 'E1S1S2', 'stoichiometry', 1), 'reversible', true);
model(9).reaction(3) = struct('id', 'E1S1S2->E1+P1', 'reactant', struct('species', 'E1S1S2', 'stoichiometry', 1), 'product', struct('species', {'E1' 'P1'}, 'stoichiometry', {1 1}), 'reversible', false);
model(9).reaction(4) = struct('id', 'E2+S2<->E2S2', 'reactant', struct('species', {'E2' 'S2'}, 'stoichiometry', {1 1}), 'product', struct('species', 'E2S2', 'stoichiometry', 1), 'reversible', true);
model(9).reaction(5) = struct('id', 'S3+E2S2<->E2S2S3', 'reactant', struct('species', {'S3' 'E2S2'}, 'stoichiometry', {1 1}), 'product', struct('species', 'E2S2S3', 'stoichiometry', 1), 'reversible', true);
model(9).reaction(6) = struct('id', 'E2S2S3->E2+P2', 'reactant', struct('species', 'E2S2S3', 'stoichiometry', 1), 'product', struct('species', {'E2' 'P2'}, 'stoichiometry', {1 1}), 'reversible', false);
model(9).reaction(7) = struct('id', 'E3+S3<->E3S3', 'reactant', struct('species', {'E3' 'S3'}, 'stoichiometry', {1 1}), 'product', struct('species', 'E3S3', 'stoichiometry', 1), 'reversible', true);
model(9).reaction(8) = struct('id', 'S4+E3S3<->E3S3S4', 'reactant', struct('species', {'S4' 'E3S3'}, 'stoichiometry', {1 1}), 'product', struct('species', 'E3S3S4', 'stoichiometry', 1), 'reversible', true);
model(9).reaction(9) = struct('id', 'E3S3S4->E3+P3', 'reactant', struct('species', 'E3S3S4', 'stoichiometry', 1), 'product', struct('species', {'E3' 'P3'}, 'stoichiometry', {1 1}), 'reversible', false);
model(9).reaction(10) = struct('id', 'E4+S4<->E4S4', 'reactant', struct('species', {'E4' 'S4'}, 'stoichiometry', {1 1}), 'product', struct('species', 'E4S4', 'stoichiometry', 1), 'reversible', true);
model(9).reaction(11) = struct('id', 'E4S4->E4+2S1', 'reactant', struct('species', 'E4S4', 'stoichiometry', 1), 'product', struct('species', {'E4' 'S1'}, 'stoichiometry', {1 2}), 'reversible', false);
model(9).reaction(12) = struct('id', '0<->S1', 'reactant', struct([]), 'product', struct('species', 'S1', 'stoichiometry', 1), 'reversible', true);
model(9).reaction(13) = struct('id', '0<->S2', 'reactant', struct([]), 'product', struct('species', 'S2', 'stoichiometry', 1), 'reversible', true);
model(9).reaction(14) = struct('id', '0<->S3', 'reactant', struct([]), 'product', struct('species', 'S3', 'stoichiometry', 1), 'reversible', true);
model(9).reaction(15) = struct('id', '0<->S4', 'reactant', struct([]), 'product', struct('species', 'S4', 'stoichiometry', 1), 'reversible', true);
model(9).reaction(16) = struct('id', 'P1->0', 'reactant', struct('species', 'P1', 'stoichiometry', 1), 'product', struct([]), 'reversible', false);
model(9).reaction(17) = struct('id', 'P2->0', 'reactant', struct('species', 'P2', 'stoichiometry', 1), 'product', struct([]), 'reversible', false);
model(9).reaction(18) = struct('id', 'P3->0', 'reactant', struct('species', 'P3', 'stoichiometry', 1), 'product', struct([]), 'reversible', false);

for i = 1:numel(model)
    i
    disp(['Model: ' model(i).name])
    am(i) = model_analysis(model(i));
end
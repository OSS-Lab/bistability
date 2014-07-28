##########################################################################
# Allosteric Network Compiler (ANC) model file
# Created by BioJazz version ALPHA-02 released on 2012/06/15
# 2014年 5月20日 星期二 23时27分51秒 BST
##########################################################################

##########################################################################
# PARAMETERS
##########################################################################
$max_external_iterations = -1
$max_internal_iterations = -1
$max_complex_size = 4
$max_species = 512
$max_csite_bound_to_msite_number = 1
$default_steric_factor = 1000
$export_graphviz = "network,collapse_states,collapse_complexes"
        

##########################################################################
# OBJECTS:
##########################################################################
#-------------------------
MODEL:  # G0000
#-------------------------
ReactionSite : {
    name => "PD0057",
    type => "csite",
    Keq_ratio => 0.0248265807923431,
}

ReactionSite : {
    name => "PD0227",
    type => "bsite",
    Keq_ratio => 2.02740433821009,
}

ReactionSite : {
    name => "PD0397",
    type => "csite",
    Keq_ratio => 28.8675919079404,
}
AllostericStructure : {
    name => "D0022",
    allosteric_flag => 1,
    allosteric_transition_rates => [2.36271606752329,6.53505529858691],
    Phi => 1,
    elements => [PD0057,PD0227,PD0397],
}
Structure : {  # IC of G0000 = 23.7337612310613
    name => "G0000",
    elements => [D0022],
    max_count => 2,
}


# Initial concentrations
Init : {
	structure => G0000,
	IC => 23.7337612310613,
}

#-------------------------
MODEL:  # LG0000
#-------------------------
ReactionSite : {
    name => "LPD0057",
    type => "bsite",
    Keq_ratio => 0.01,
}
AllostericStructure : {
    name => "LD0022",
    allosteric_flag => 0,
    allosteric_transition_rates => [0.01,0.01],
    Phi => 0,
    elements => [LPD0057],
}
Structure : {  # IC of LG0000 = 0.001
    name => "LG0000",
    elements => [LD0022],
    max_count => 2,
}


# Initial concentrations
Init : {
	structure => LG0000,
	IC => 0.001,
}

#-------------------------
MODEL:  # TG0000
#-------------------------
ReactionSite : {
    name => "TPD0057",
    type => "msite",
    Keq_ratio => 0.01,
}
AllostericStructure : {
    name => "TD0022",
    allosteric_flag => 0,
    allosteric_transition_rates => [0.01,0.01],
    Phi => 0,
    elements => [TPD0057],
}
Structure : {  # IC of TG0000 = 9.99999999999999
    name => "TG0000",
    elements => [TD0022],
    max_count => 2,
}


# Initial concentrations
Init : {
	structure => TG0000,
	IC => 9.99999999999999,
}

        

##########################################################################
# RULES:
##########################################################################
MODEL:

CanBindRule : {
  name => "PD0057 TPD0057 (0 R 0 .)",
  ligand_names => ["PD0057", "TPD0057"],
  ligand_msite_states => ["0", "0"],
  ligand_allosteric_labels => ["R", "."],
  kf => 251.188643150958,
  kb => 0.125892541179417,
  kp => 0.0317297226293716,
}

CanBindRule : {
  name => "PD0057 TPD0057 (0 T 0 .)",
  ligand_names => ["PD0057", "TPD0057"],
  ligand_msite_states => ["0", "0"],
  ligand_allosteric_labels => ["T", "."],
  kf => 15.8489319246111,
  kb => 0.251188643150958,
  kp => 598.585372268854,
}

CanBindRule : {
  name => "PD0227 LPD0057 (0 R 0 .)",
  ligand_names => ["PD0227", "LPD0057"],
  ligand_msite_states => ["0", "0"],
  ligand_allosteric_labels => ["R", "."],
  kf => 0.00794328234724282,
  kb => 125.892541179417,
}

CanBindRule : {
  name => "PD0227 LPD0057 (0 T 0 .)",
  ligand_names => ["PD0227", "LPD0057"],
  ligand_msite_states => ["0", "0"],
  ligand_allosteric_labels => ["T", "."],
  kf => 125.892541179417,
  kb => 15.8489319246111,
}

CanBindRule : {
  name => "PD0397 TPD0057 (0 R 1 .)",
  ligand_names => ["PD0397", "TPD0057"],
  ligand_msite_states => ["0", "1"],
  ligand_allosteric_labels => ["R", "."],
  kf => 125.892541179417,
  kb => 7.94328234724282,
  kp => 27.5348489224465,
}

CanBindRule : {
  name => "PD0397 TPD0057 (0 T 1 .)",
  ligand_names => ["PD0397", "TPD0057"],
  ligand_msite_states => ["0", "1"],
  ligand_allosteric_labels => ["T", "."],
  kf => 0.0316227766016838,
  kb => 0.001,
  kp => 24.056457337915,
}
        

##########################################################################
# EQUATIONS:
##########################################################################
EQN:

null -> LG0000; clamp_source_LG0000="(+(event_flags(1) && ~event_flags(51))*min((t-event_times(1))/60, 1)*0.2*4.0+event_flags(51)*max(1-(t-event_times(51))/60, 0)*0.2*4.0+(event_flags(2) && ~event_flags(52))*min((t-event_times(2))/60, 1)*0.2*4.0+event_flags(52)*max(1-(t-event_times(52))/60, 0)*0.2*4.0+(event_flags(3) && ~event_flags(53))*min((t-event_times(3))/60, 1)*0.2*4.0+event_flags(53)*max(1-(t-event_times(53))/60, 0)*0.2*4.0+(event_flags(4) && ~event_flags(54))*min((t-event_times(4))/60, 1)*0.2*4.0+event_flags(54)*max(1-(t-event_times(54))/60, 0)*0.2*4.0+(event_flags(5) && ~event_flags(55))*min((t-event_times(5))/60, 1)*0.2*4.0+event_flags(55)*max(1-(t-event_times(55))/60, 0)*0.2*4.0+(event_flags(6) && ~event_flags(56))*min((t-event_times(6))/60, 1)*0.2*4.0+event_flags(56)*max(1-(t-event_times(56))/60, 0)*0.2*4.0+(event_flags(7) && ~event_flags(57))*min((t-event_times(7))/60, 1)*0.2*4.0+event_flags(57)*max(1-(t-event_times(57))/60, 0)*0.2*4.0+(event_flags(8) && ~event_flags(58))*min((t-event_times(8))/60, 1)*0.2*4.0+event_flags(58)*max(1-(t-event_times(58))/60, 0)*0.2*4.0+(event_flags(9) && ~event_flags(59))*min((t-event_times(9))/60, 1)*0.2*4.0+event_flags(59)*max(1-(t-event_times(59))/60, 0)*0.2*4.0+(event_flags(10) && ~event_flags(60))*min((t-event_times(10))/60, 1)*0.2*4.0+event_flags(60)*max(1-(t-event_times(60))/60, 0)*0.2*4.0+(event_flags(11) && ~event_flags(61))*min((t-event_times(11))/60, 1)*0.2*4.0+event_flags(61)*max(1-(t-event_times(61))/60, 0)*0.2*4.0+(event_flags(12) && ~event_flags(62))*min((t-event_times(12))/60, 1)*0.2*4.0+event_flags(62)*max(1-(t-event_times(62))/60, 0)*0.2*4.0+(event_flags(13) && ~event_flags(63))*min((t-event_times(13))/60, 1)*0.2*4.0+event_flags(63)*max(1-(t-event_times(63))/60, 0)*0.2*4.0+(event_flags(14) && ~event_flags(64))*min((t-event_times(14))/60, 1)*0.2*4.0+event_flags(64)*max(1-(t-event_times(64))/60, 0)*0.2*4.0+(event_flags(15) && ~event_flags(65))*min((t-event_times(15))/60, 1)*0.2*4.0+event_flags(65)*max(1-(t-event_times(65))/60, 0)*0.2*4.0+(event_flags(16) && ~event_flags(66))*min((t-event_times(16))/60, 1)*0.2*4.0+event_flags(66)*max(1-(t-event_times(66))/60, 0)*0.2*4.0+(event_flags(17) && ~event_flags(67))*min((t-event_times(17))/60, 1)*0.2*4.0+event_flags(67)*max(1-(t-event_times(67))/60, 0)*0.2*4.0+(event_flags(18) && ~event_flags(68))*min((t-event_times(18))/60, 1)*0.2*4.0+event_flags(68)*max(1-(t-event_times(68))/60, 0)*0.2*4.0+(event_flags(19) && ~event_flags(69))*min((t-event_times(19))/60, 1)*0.2*4.0+event_flags(69)*max(1-(t-event_times(69))/60, 0)*0.2*4.0+(event_flags(20) && ~event_flags(70))*min((t-event_times(20))/60, 1)*0.2*4.0+event_flags(70)*max(1-(t-event_times(70))/60, 0)*0.2*4.0+(event_flags(21) && ~event_flags(71))*min((t-event_times(21))/60, 1)*0.2*4.0+event_flags(71)*max(1-(t-event_times(71))/60, 0)*0.2*4.0+(event_flags(22) && ~event_flags(72))*min((t-event_times(22))/60, 1)*0.2*4.0+event_flags(72)*max(1-(t-event_times(72))/60, 0)*0.2*4.0+(event_flags(23) && ~event_flags(73))*min((t-event_times(23))/60, 1)*0.2*4.0+event_flags(73)*max(1-(t-event_times(73))/60, 0)*0.2*4.0+(event_flags(24) && ~event_flags(74))*min((t-event_times(24))/60, 1)*0.2*4.0+event_flags(74)*max(1-(t-event_times(74))/60, 0)*0.2*4.0+(event_flags(25) && ~event_flags(75))*min((t-event_times(25))/60, 1)*0.2*4.0+event_flags(75)*max(1-(t-event_times(75))/60, 0)*0.2*4.0+(event_flags(26) && ~event_flags(76))*min((t-event_times(26))/60, 1)*0.2*4.0+event_flags(76)*max(1-(t-event_times(76))/60, 0)*0.2*4.0+(event_flags(27) && ~event_flags(77))*min((t-event_times(27))/60, 1)*0.2*4.0+event_flags(77)*max(1-(t-event_times(77))/60, 0)*0.2*4.0+(event_flags(28) && ~event_flags(78))*min((t-event_times(28))/60, 1)*0.2*4.0+event_flags(78)*max(1-(t-event_times(78))/60, 0)*0.2*4.0+(event_flags(29) && ~event_flags(79))*min((t-event_times(29))/60, 1)*0.2*4.0+event_flags(79)*max(1-(t-event_times(79))/60, 0)*0.2*4.0+(event_flags(30) && ~event_flags(80))*min((t-event_times(30))/60, 1)*0.2*4.0+event_flags(80)*max(1-(t-event_times(80))/60, 0)*0.2*4.0+(event_flags(31) && ~event_flags(81))*min((t-event_times(31))/60, 1)*0.2*4.0+event_flags(81)*max(1-(t-event_times(81))/60, 0)*0.2*4.0+(event_flags(32) && ~event_flags(82))*min((t-event_times(32))/60, 1)*0.2*4.0+event_flags(82)*max(1-(t-event_times(82))/60, 0)*0.2*4.0+(event_flags(33) && ~event_flags(83))*min((t-event_times(33))/60, 1)*0.2*4.0+event_flags(83)*max(1-(t-event_times(83))/60, 0)*0.2*4.0+(event_flags(34) && ~event_flags(84))*min((t-event_times(34))/60, 1)*0.2*4.0+event_flags(84)*max(1-(t-event_times(84))/60, 0)*0.2*4.0+(event_flags(35) && ~event_flags(85))*min((t-event_times(35))/60, 1)*0.2*4.0+event_flags(85)*max(1-(t-event_times(85))/60, 0)*0.2*4.0+(event_flags(36) && ~event_flags(86))*min((t-event_times(36))/60, 1)*0.2*4.0+event_flags(86)*max(1-(t-event_times(86))/60, 0)*0.2*4.0+(event_flags(37) && ~event_flags(87))*min((t-event_times(37))/60, 1)*0.2*4.0+event_flags(87)*max(1-(t-event_times(87))/60, 0)*0.2*4.0+(event_flags(38) && ~event_flags(88))*min((t-event_times(38))/60, 1)*0.2*4.0+event_flags(88)*max(1-(t-event_times(88))/60, 0)*0.2*4.0+(event_flags(39) && ~event_flags(89))*min((t-event_times(39))/60, 1)*0.2*4.0+event_flags(89)*max(1-(t-event_times(89))/60, 0)*0.2*4.0+(event_flags(40) && ~event_flags(90))*min((t-event_times(40))/60, 1)*0.2*4.0+event_flags(90)*max(1-(t-event_times(90))/60, 0)*0.2*4.0+(event_flags(41) && ~event_flags(91))*min((t-event_times(41))/60, 1)*0.2*4.0+event_flags(91)*max(1-(t-event_times(91))/60, 0)*0.2*4.0+(event_flags(42) && ~event_flags(92))*min((t-event_times(42))/60, 1)*0.2*4.0+event_flags(92)*max(1-(t-event_times(92))/60, 0)*0.2*4.0+(event_flags(43) && ~event_flags(93))*min((t-event_times(43))/60, 1)*0.2*4.0+event_flags(93)*max(1-(t-event_times(93))/60, 0)*0.2*4.0+(event_flags(44) && ~event_flags(94))*min((t-event_times(44))/60, 1)*0.2*4.0+event_flags(94)*max(1-(t-event_times(94))/60, 0)*0.2*4.0+(event_flags(45) && ~event_flags(95))*min((t-event_times(45))/60, 1)*0.2*4.0+event_flags(95)*max(1-(t-event_times(95))/60, 0)*0.2*4.0+(event_flags(46) && ~event_flags(96))*min((t-event_times(46))/60, 1)*0.2*4.0+event_flags(96)*max(1-(t-event_times(96))/60, 0)*0.2*4.0+(event_flags(47) && ~event_flags(97))*min((t-event_times(47))/60, 1)*0.2*4.0+event_flags(97)*max(1-(t-event_times(97))/60, 0)*0.2*4.0+(event_flags(48) && ~event_flags(98))*min((t-event_times(48))/60, 1)*0.2*4.0+event_flags(98)*max(1-(t-event_times(98))/60, 0)*0.2*4.0+(event_flags(49) && ~event_flags(99))*min((t-event_times(49))/60, 1)*0.2*4.0+event_flags(99)*max(1-(t-event_times(99))/60, 0)*0.2*4.0+(event_flags(50) && ~event_flags(100))*min((t-event_times(50))/60, 1)*0.2*4.0+event_flags(100)*max(1-(t-event_times(100))/60, 0)*0.2*4.0)"
LG0000 -> null; clamp_sink_LG0000=4.0        

##########################################################################
# CONFIG:
##########################################################################
CONFIG:

ode_event_times = ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~;
SS_timescale = 500.0;
t_final = 5000000;
t_vector = [t0:1.0:tf];
matlab_ode_solver = ode23s;
matlab_solver_options{InitialStep} = 1e-8;
matlab_solver_options{AbsTol} = 1e-9;
matlab_solver_options{RelTol} = 1e-3;
matlab_solver_options{MaxStep} = 500.0;

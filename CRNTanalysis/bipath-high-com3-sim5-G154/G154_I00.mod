##########################################################################
# Allosteric Network Compiler (ANC) model file
# Created by BioJazz version ALPHA-02 released on 2012/06/15
# Wed  8 Jan 2014 00:50:28 GMT
##########################################################################

##########################################################################
# PARAMETERS
##########################################################################
$max_external_iterations = -1
$max_internal_iterations = -1
$max_complex_size = 3
$max_species = 512
$max_csite_bound_to_msite_number = 1
$default_steric_factor = 1e3
$export_graphviz = "network,collapse_states,collapse_complexes"
        

##########################################################################
# OBJECTS:
##########################################################################
#-------------------------
MODEL:  # G0000
#-------------------------
ReactionSite : {
    name => "PD0458",
    type => "csite",
    Keq_ratio => 0.0605359950210121,
}

ReactionSite : {
    name => "PD0628",
    type => "csite",
    Keq_ratio => 0.207822736760518,
}
AllostericStructure : {
    name => "D0423",
    allosteric_flag => 1,
    allosteric_transition_rates => [0.83898397503098,0.0207355491991768],
    Phi => 0.300097751710655,
    elements => [PD0458,PD0628],
}
Structure : {  # IC of G0401 = 2.32578151753603
    name => "G0401",
    elements => [D0423],
    max_count => 2,
}


ReactionSite : {
    name => "PD1827",
    type => "csite",
    Keq_ratio => 7.08663202813242,
}

ReactionSite : {
    name => "PD1997",
    type => "bsite",
    Keq_ratio => 0.0466253066223076,
}
AllostericStructure : {
    name => "D1792",
    allosteric_flag => 0,
    allosteric_transition_rates => [0.0241649947859281,0.0528886715788024],
    Phi => 0.58455522971652,
    elements => [PD1827,PD1997],
}
Structure : {  # IC of G1770 = 3.78192236963763
    name => "G1770",
    elements => [D1792],
    max_count => 2,
}


ReactionSite : {
    name => "PD4015",
    type => "csite",
    Keq_ratio => 6.89778537938766,
}

ReactionSite : {
    name => "PD4185",
    type => "csite",
    Keq_ratio => 0.186540114290992,
}
AllostericStructure : {
    name => "D3980",
    allosteric_flag => 1,
    allosteric_transition_rates => [28.0983198521169,2.36271606752329],
    Phi => 0.813294232649071,
    elements => [PD4015,PD4185],
}
Structure : {  # IC of G3958 = 0.0827729746752389
    name => "G3958",
    elements => [D3980],
    max_count => 2,
}


# Initial concentrations
Init : {
	structure => G0401,
	IC => 2.32578151753603,
}
Init : {
	structure => G1770,
	IC => 3.78192236963763,
}
Init : {
	structure => G3958,
	IC => 0.0827729746752389,
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
Structure : {  # IC of TG0000 = 1000
    name => "TG0000",
    elements => [TD0022],
    max_count => 2,
}


# Initial concentrations
Init : {
	structure => TG0000,
	IC => 1000,
}

        

##########################################################################
# RULES:
##########################################################################
MODEL:

CanBindRule : {
  name => "PD0458 PD1997 (0 R 0 .)",
  ligand_names => ["PD0458", "PD1997"],
  ligand_msite_states => ["0", "0"],
  ligand_allosteric_labels => ["R", "."],
  kf => 15.8489319246111,
  kb => 0.0316227766016838,
}

CanBindRule : {
  name => "PD0458 PD1997 (0 T 0 .)",
  ligand_names => ["PD0458", "PD1997"],
  ligand_msite_states => ["0", "0"],
  ligand_allosteric_labels => ["T", "."],
  kf => 1.99526231496888,
  kb => 7.94328234724282,
}

CanBindRule : {
  name => "PD0628 TPD0057 (0 R 0 .)",
  ligand_names => ["PD0628", "TPD0057"],
  ligand_msite_states => ["0", "0"],
  ligand_allosteric_labels => ["R", "."],
  kf => 0.501187233627272,
  kb => 3.98107170553497,
  kp => 742.963950759494,
}

CanBindRule : {
  name => "PD0628 TPD0057 (0 T 0 .)",
  ligand_names => ["PD0628", "TPD0057"],
  ligand_msite_states => ["0", "0"],
  ligand_allosteric_labels => ["T", "."],
  kf => 1,
  kb => 0.251188643150958,
  kp => 0.001,
}

CanBindRule : {
  name => "PD1827 LPD0057 (0 . 0 .)",
  ligand_names => ["PD1827", "LPD0057"],
  ligand_msite_states => ["0", "0"],
  ligand_allosteric_labels => [".", "."],
  kf => 7.94328234724282,
  kb => 1,
}

CanBindRule : {
  name => "PD4185 TPD0057 (0 R 1 .)",
  ligand_names => ["PD4185", "TPD0057"],
  ligand_msite_states => ["0", "1"],
  ligand_allosteric_labels => ["R", "."],
  kf => 0.501187233627272,
  kb => 0.00398107170553497,
  kp => 5.15952796467086,
}

CanBindRule : {
  name => "PD4185 TPD0057 (0 T 1 .)",
  ligand_names => ["PD4185", "TPD0057"],
  ligand_msite_states => ["0", "1"],
  ligand_allosteric_labels => ["T", "."],
  kf => 15.8489319246111,
  kb => 31.6227766016838,
  kp => 148.943147721724,
}
        

##########################################################################
# EQUATIONS:
##########################################################################
EQN:

null -> LG0000; clamp_source_LG0000="(+(event_flags(1) && ~event_flags(101))*min((t-event_times(1))/30, 1)*0.1*4.0+event_flags(101)*max(1-(t-event_times(101))/30, 0)*0.1*4.0+(event_flags(2) && ~event_flags(102))*min((t-event_times(2))/30, 1)*0.1*4.0+event_flags(102)*max(1-(t-event_times(102))/30, 0)*0.1*4.0+(event_flags(3) && ~event_flags(103))*min((t-event_times(3))/30, 1)*0.1*4.0+event_flags(103)*max(1-(t-event_times(103))/30, 0)*0.1*4.0+(event_flags(4) && ~event_flags(104))*min((t-event_times(4))/30, 1)*0.1*4.0+event_flags(104)*max(1-(t-event_times(104))/30, 0)*0.1*4.0+(event_flags(5) && ~event_flags(105))*min((t-event_times(5))/30, 1)*0.1*4.0+event_flags(105)*max(1-(t-event_times(105))/30, 0)*0.1*4.0+(event_flags(6) && ~event_flags(106))*min((t-event_times(6))/30, 1)*0.1*4.0+event_flags(106)*max(1-(t-event_times(106))/30, 0)*0.1*4.0+(event_flags(7) && ~event_flags(107))*min((t-event_times(7))/30, 1)*0.1*4.0+event_flags(107)*max(1-(t-event_times(107))/30, 0)*0.1*4.0+(event_flags(8) && ~event_flags(108))*min((t-event_times(8))/30, 1)*0.1*4.0+event_flags(108)*max(1-(t-event_times(108))/30, 0)*0.1*4.0+(event_flags(9) && ~event_flags(109))*min((t-event_times(9))/30, 1)*0.1*4.0+event_flags(109)*max(1-(t-event_times(109))/30, 0)*0.1*4.0+(event_flags(10) && ~event_flags(110))*min((t-event_times(10))/30, 1)*0.1*4.0+event_flags(110)*max(1-(t-event_times(110))/30, 0)*0.1*4.0+(event_flags(11) && ~event_flags(111))*min((t-event_times(11))/30, 1)*0.1*4.0+event_flags(111)*max(1-(t-event_times(111))/30, 0)*0.1*4.0+(event_flags(12) && ~event_flags(112))*min((t-event_times(12))/30, 1)*0.1*4.0+event_flags(112)*max(1-(t-event_times(112))/30, 0)*0.1*4.0+(event_flags(13) && ~event_flags(113))*min((t-event_times(13))/30, 1)*0.1*4.0+event_flags(113)*max(1-(t-event_times(113))/30, 0)*0.1*4.0+(event_flags(14) && ~event_flags(114))*min((t-event_times(14))/30, 1)*0.1*4.0+event_flags(114)*max(1-(t-event_times(114))/30, 0)*0.1*4.0+(event_flags(15) && ~event_flags(115))*min((t-event_times(15))/30, 1)*0.1*4.0+event_flags(115)*max(1-(t-event_times(115))/30, 0)*0.1*4.0+(event_flags(16) && ~event_flags(116))*min((t-event_times(16))/30, 1)*0.1*4.0+event_flags(116)*max(1-(t-event_times(116))/30, 0)*0.1*4.0+(event_flags(17) && ~event_flags(117))*min((t-event_times(17))/30, 1)*0.1*4.0+event_flags(117)*max(1-(t-event_times(117))/30, 0)*0.1*4.0+(event_flags(18) && ~event_flags(118))*min((t-event_times(18))/30, 1)*0.1*4.0+event_flags(118)*max(1-(t-event_times(118))/30, 0)*0.1*4.0+(event_flags(19) && ~event_flags(119))*min((t-event_times(19))/30, 1)*0.1*4.0+event_flags(119)*max(1-(t-event_times(119))/30, 0)*0.1*4.0+(event_flags(20) && ~event_flags(120))*min((t-event_times(20))/30, 1)*0.1*4.0+event_flags(120)*max(1-(t-event_times(120))/30, 0)*0.1*4.0+(event_flags(21) && ~event_flags(121))*min((t-event_times(21))/30, 1)*0.1*4.0+event_flags(121)*max(1-(t-event_times(121))/30, 0)*0.1*4.0+(event_flags(22) && ~event_flags(122))*min((t-event_times(22))/30, 1)*0.1*4.0+event_flags(122)*max(1-(t-event_times(122))/30, 0)*0.1*4.0+(event_flags(23) && ~event_flags(123))*min((t-event_times(23))/30, 1)*0.1*4.0+event_flags(123)*max(1-(t-event_times(123))/30, 0)*0.1*4.0+(event_flags(24) && ~event_flags(124))*min((t-event_times(24))/30, 1)*0.1*4.0+event_flags(124)*max(1-(t-event_times(124))/30, 0)*0.1*4.0+(event_flags(25) && ~event_flags(125))*min((t-event_times(25))/30, 1)*0.1*4.0+event_flags(125)*max(1-(t-event_times(125))/30, 0)*0.1*4.0+(event_flags(26) && ~event_flags(126))*min((t-event_times(26))/30, 1)*0.1*4.0+event_flags(126)*max(1-(t-event_times(126))/30, 0)*0.1*4.0+(event_flags(27) && ~event_flags(127))*min((t-event_times(27))/30, 1)*0.1*4.0+event_flags(127)*max(1-(t-event_times(127))/30, 0)*0.1*4.0+(event_flags(28) && ~event_flags(128))*min((t-event_times(28))/30, 1)*0.1*4.0+event_flags(128)*max(1-(t-event_times(128))/30, 0)*0.1*4.0+(event_flags(29) && ~event_flags(129))*min((t-event_times(29))/30, 1)*0.1*4.0+event_flags(129)*max(1-(t-event_times(129))/30, 0)*0.1*4.0+(event_flags(30) && ~event_flags(130))*min((t-event_times(30))/30, 1)*0.1*4.0+event_flags(130)*max(1-(t-event_times(130))/30, 0)*0.1*4.0+(event_flags(31) && ~event_flags(131))*min((t-event_times(31))/30, 1)*0.1*4.0+event_flags(131)*max(1-(t-event_times(131))/30, 0)*0.1*4.0+(event_flags(32) && ~event_flags(132))*min((t-event_times(32))/30, 1)*0.1*4.0+event_flags(132)*max(1-(t-event_times(132))/30, 0)*0.1*4.0+(event_flags(33) && ~event_flags(133))*min((t-event_times(33))/30, 1)*0.1*4.0+event_flags(133)*max(1-(t-event_times(133))/30, 0)*0.1*4.0+(event_flags(34) && ~event_flags(134))*min((t-event_times(34))/30, 1)*0.1*4.0+event_flags(134)*max(1-(t-event_times(134))/30, 0)*0.1*4.0+(event_flags(35) && ~event_flags(135))*min((t-event_times(35))/30, 1)*0.1*4.0+event_flags(135)*max(1-(t-event_times(135))/30, 0)*0.1*4.0+(event_flags(36) && ~event_flags(136))*min((t-event_times(36))/30, 1)*0.1*4.0+event_flags(136)*max(1-(t-event_times(136))/30, 0)*0.1*4.0+(event_flags(37) && ~event_flags(137))*min((t-event_times(37))/30, 1)*0.1*4.0+event_flags(137)*max(1-(t-event_times(137))/30, 0)*0.1*4.0+(event_flags(38) && ~event_flags(138))*min((t-event_times(38))/30, 1)*0.1*4.0+event_flags(138)*max(1-(t-event_times(138))/30, 0)*0.1*4.0+(event_flags(39) && ~event_flags(139))*min((t-event_times(39))/30, 1)*0.1*4.0+event_flags(139)*max(1-(t-event_times(139))/30, 0)*0.1*4.0+(event_flags(40) && ~event_flags(140))*min((t-event_times(40))/30, 1)*0.1*4.0+event_flags(140)*max(1-(t-event_times(140))/30, 0)*0.1*4.0+(event_flags(41) && ~event_flags(141))*min((t-event_times(41))/30, 1)*0.1*4.0+event_flags(141)*max(1-(t-event_times(141))/30, 0)*0.1*4.0+(event_flags(42) && ~event_flags(142))*min((t-event_times(42))/30, 1)*0.1*4.0+event_flags(142)*max(1-(t-event_times(142))/30, 0)*0.1*4.0+(event_flags(43) && ~event_flags(143))*min((t-event_times(43))/30, 1)*0.1*4.0+event_flags(143)*max(1-(t-event_times(143))/30, 0)*0.1*4.0+(event_flags(44) && ~event_flags(144))*min((t-event_times(44))/30, 1)*0.1*4.0+event_flags(144)*max(1-(t-event_times(144))/30, 0)*0.1*4.0+(event_flags(45) && ~event_flags(145))*min((t-event_times(45))/30, 1)*0.1*4.0+event_flags(145)*max(1-(t-event_times(145))/30, 0)*0.1*4.0+(event_flags(46) && ~event_flags(146))*min((t-event_times(46))/30, 1)*0.1*4.0+event_flags(146)*max(1-(t-event_times(146))/30, 0)*0.1*4.0+(event_flags(47) && ~event_flags(147))*min((t-event_times(47))/30, 1)*0.1*4.0+event_flags(147)*max(1-(t-event_times(147))/30, 0)*0.1*4.0+(event_flags(48) && ~event_flags(148))*min((t-event_times(48))/30, 1)*0.1*4.0+event_flags(148)*max(1-(t-event_times(148))/30, 0)*0.1*4.0+(event_flags(49) && ~event_flags(149))*min((t-event_times(49))/30, 1)*0.1*4.0+event_flags(149)*max(1-(t-event_times(149))/30, 0)*0.1*4.0+(event_flags(50) && ~event_flags(150))*min((t-event_times(50))/30, 1)*0.1*4.0+event_flags(150)*max(1-(t-event_times(150))/30, 0)*0.1*4.0+(event_flags(51) && ~event_flags(151))*min((t-event_times(51))/30, 1)*0.1*4.0+event_flags(151)*max(1-(t-event_times(151))/30, 0)*0.1*4.0+(event_flags(52) && ~event_flags(152))*min((t-event_times(52))/30, 1)*0.1*4.0+event_flags(152)*max(1-(t-event_times(152))/30, 0)*0.1*4.0+(event_flags(53) && ~event_flags(153))*min((t-event_times(53))/30, 1)*0.1*4.0+event_flags(153)*max(1-(t-event_times(153))/30, 0)*0.1*4.0+(event_flags(54) && ~event_flags(154))*min((t-event_times(54))/30, 1)*0.1*4.0+event_flags(154)*max(1-(t-event_times(154))/30, 0)*0.1*4.0+(event_flags(55) && ~event_flags(155))*min((t-event_times(55))/30, 1)*0.1*4.0+event_flags(155)*max(1-(t-event_times(155))/30, 0)*0.1*4.0+(event_flags(56) && ~event_flags(156))*min((t-event_times(56))/30, 1)*0.1*4.0+event_flags(156)*max(1-(t-event_times(156))/30, 0)*0.1*4.0+(event_flags(57) && ~event_flags(157))*min((t-event_times(57))/30, 1)*0.1*4.0+event_flags(157)*max(1-(t-event_times(157))/30, 0)*0.1*4.0+(event_flags(58) && ~event_flags(158))*min((t-event_times(58))/30, 1)*0.1*4.0+event_flags(158)*max(1-(t-event_times(158))/30, 0)*0.1*4.0+(event_flags(59) && ~event_flags(159))*min((t-event_times(59))/30, 1)*0.1*4.0+event_flags(159)*max(1-(t-event_times(159))/30, 0)*0.1*4.0+(event_flags(60) && ~event_flags(160))*min((t-event_times(60))/30, 1)*0.1*4.0+event_flags(160)*max(1-(t-event_times(160))/30, 0)*0.1*4.0+(event_flags(61) && ~event_flags(161))*min((t-event_times(61))/30, 1)*0.1*4.0+event_flags(161)*max(1-(t-event_times(161))/30, 0)*0.1*4.0+(event_flags(62) && ~event_flags(162))*min((t-event_times(62))/30, 1)*0.1*4.0+event_flags(162)*max(1-(t-event_times(162))/30, 0)*0.1*4.0+(event_flags(63) && ~event_flags(163))*min((t-event_times(63))/30, 1)*0.1*4.0+event_flags(163)*max(1-(t-event_times(163))/30, 0)*0.1*4.0+(event_flags(64) && ~event_flags(164))*min((t-event_times(64))/30, 1)*0.1*4.0+event_flags(164)*max(1-(t-event_times(164))/30, 0)*0.1*4.0+(event_flags(65) && ~event_flags(165))*min((t-event_times(65))/30, 1)*0.1*4.0+event_flags(165)*max(1-(t-event_times(165))/30, 0)*0.1*4.0+(event_flags(66) && ~event_flags(166))*min((t-event_times(66))/30, 1)*0.1*4.0+event_flags(166)*max(1-(t-event_times(166))/30, 0)*0.1*4.0+(event_flags(67) && ~event_flags(167))*min((t-event_times(67))/30, 1)*0.1*4.0+event_flags(167)*max(1-(t-event_times(167))/30, 0)*0.1*4.0+(event_flags(68) && ~event_flags(168))*min((t-event_times(68))/30, 1)*0.1*4.0+event_flags(168)*max(1-(t-event_times(168))/30, 0)*0.1*4.0+(event_flags(69) && ~event_flags(169))*min((t-event_times(69))/30, 1)*0.1*4.0+event_flags(169)*max(1-(t-event_times(169))/30, 0)*0.1*4.0+(event_flags(70) && ~event_flags(170))*min((t-event_times(70))/30, 1)*0.1*4.0+event_flags(170)*max(1-(t-event_times(170))/30, 0)*0.1*4.0+(event_flags(71) && ~event_flags(171))*min((t-event_times(71))/30, 1)*0.1*4.0+event_flags(171)*max(1-(t-event_times(171))/30, 0)*0.1*4.0+(event_flags(72) && ~event_flags(172))*min((t-event_times(72))/30, 1)*0.1*4.0+event_flags(172)*max(1-(t-event_times(172))/30, 0)*0.1*4.0+(event_flags(73) && ~event_flags(173))*min((t-event_times(73))/30, 1)*0.1*4.0+event_flags(173)*max(1-(t-event_times(173))/30, 0)*0.1*4.0+(event_flags(74) && ~event_flags(174))*min((t-event_times(74))/30, 1)*0.1*4.0+event_flags(174)*max(1-(t-event_times(174))/30, 0)*0.1*4.0+(event_flags(75) && ~event_flags(175))*min((t-event_times(75))/30, 1)*0.1*4.0+event_flags(175)*max(1-(t-event_times(175))/30, 0)*0.1*4.0+(event_flags(76) && ~event_flags(176))*min((t-event_times(76))/30, 1)*0.1*4.0+event_flags(176)*max(1-(t-event_times(176))/30, 0)*0.1*4.0+(event_flags(77) && ~event_flags(177))*min((t-event_times(77))/30, 1)*0.1*4.0+event_flags(177)*max(1-(t-event_times(177))/30, 0)*0.1*4.0+(event_flags(78) && ~event_flags(178))*min((t-event_times(78))/30, 1)*0.1*4.0+event_flags(178)*max(1-(t-event_times(178))/30, 0)*0.1*4.0+(event_flags(79) && ~event_flags(179))*min((t-event_times(79))/30, 1)*0.1*4.0+event_flags(179)*max(1-(t-event_times(179))/30, 0)*0.1*4.0+(event_flags(80) && ~event_flags(180))*min((t-event_times(80))/30, 1)*0.1*4.0+event_flags(180)*max(1-(t-event_times(180))/30, 0)*0.1*4.0+(event_flags(81) && ~event_flags(181))*min((t-event_times(81))/30, 1)*0.1*4.0+event_flags(181)*max(1-(t-event_times(181))/30, 0)*0.1*4.0+(event_flags(82) && ~event_flags(182))*min((t-event_times(82))/30, 1)*0.1*4.0+event_flags(182)*max(1-(t-event_times(182))/30, 0)*0.1*4.0+(event_flags(83) && ~event_flags(183))*min((t-event_times(83))/30, 1)*0.1*4.0+event_flags(183)*max(1-(t-event_times(183))/30, 0)*0.1*4.0+(event_flags(84) && ~event_flags(184))*min((t-event_times(84))/30, 1)*0.1*4.0+event_flags(184)*max(1-(t-event_times(184))/30, 0)*0.1*4.0+(event_flags(85) && ~event_flags(185))*min((t-event_times(85))/30, 1)*0.1*4.0+event_flags(185)*max(1-(t-event_times(185))/30, 0)*0.1*4.0+(event_flags(86) && ~event_flags(186))*min((t-event_times(86))/30, 1)*0.1*4.0+event_flags(186)*max(1-(t-event_times(186))/30, 0)*0.1*4.0+(event_flags(87) && ~event_flags(187))*min((t-event_times(87))/30, 1)*0.1*4.0+event_flags(187)*max(1-(t-event_times(187))/30, 0)*0.1*4.0+(event_flags(88) && ~event_flags(188))*min((t-event_times(88))/30, 1)*0.1*4.0+event_flags(188)*max(1-(t-event_times(188))/30, 0)*0.1*4.0+(event_flags(89) && ~event_flags(189))*min((t-event_times(89))/30, 1)*0.1*4.0+event_flags(189)*max(1-(t-event_times(189))/30, 0)*0.1*4.0+(event_flags(90) && ~event_flags(190))*min((t-event_times(90))/30, 1)*0.1*4.0+event_flags(190)*max(1-(t-event_times(190))/30, 0)*0.1*4.0+(event_flags(91) && ~event_flags(191))*min((t-event_times(91))/30, 1)*0.1*4.0+event_flags(191)*max(1-(t-event_times(191))/30, 0)*0.1*4.0+(event_flags(92) && ~event_flags(192))*min((t-event_times(92))/30, 1)*0.1*4.0+event_flags(192)*max(1-(t-event_times(192))/30, 0)*0.1*4.0+(event_flags(93) && ~event_flags(193))*min((t-event_times(93))/30, 1)*0.1*4.0+event_flags(193)*max(1-(t-event_times(193))/30, 0)*0.1*4.0+(event_flags(94) && ~event_flags(194))*min((t-event_times(94))/30, 1)*0.1*4.0+event_flags(194)*max(1-(t-event_times(194))/30, 0)*0.1*4.0+(event_flags(95) && ~event_flags(195))*min((t-event_times(95))/30, 1)*0.1*4.0+event_flags(195)*max(1-(t-event_times(195))/30, 0)*0.1*4.0+(event_flags(96) && ~event_flags(196))*min((t-event_times(96))/30, 1)*0.1*4.0+event_flags(196)*max(1-(t-event_times(196))/30, 0)*0.1*4.0+(event_flags(97) && ~event_flags(197))*min((t-event_times(97))/30, 1)*0.1*4.0+event_flags(197)*max(1-(t-event_times(197))/30, 0)*0.1*4.0+(event_flags(98) && ~event_flags(198))*min((t-event_times(98))/30, 1)*0.1*4.0+event_flags(198)*max(1-(t-event_times(198))/30, 0)*0.1*4.0+(event_flags(99) && ~event_flags(199))*min((t-event_times(99))/30, 1)*0.1*4.0+event_flags(199)*max(1-(t-event_times(199))/30, 0)*0.1*4.0+(event_flags(100) && ~event_flags(200))*min((t-event_times(100))/30, 1)*0.1*4.0+event_flags(200)*max(1-(t-event_times(200))/30, 0)*0.1*4.0)"
LG0000 -> null; clamp_sink_LG0000=4.0        

##########################################################################
# CONFIG:
##########################################################################
CONFIG:

ode_event_times = ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~;
SS_timescale = 500.0;
t_final = 5000000;
t_vector = [t0:1.0:tf];
matlab_ode_solver = ode23s;
matlab_solver_options{InitialStep} = 1e-8;
matlab_solver_options{AbsTol} = 1e-9;
matlab_solver_options{RelTol} = 1e-3;
matlab_solver_options{MaxStep} = 500.0;

% File generated by Facile version 0.53a
%
function dydt = G154_I00_odes(t, y)

global event_flags;
global event_times

global ode_tot_cputime;
global ode_num_calls;
ode_start_time = cputime;
ode_num_calls = ode_num_calls + 1;
% state vector to node mapping
G0401R = y(1);
TG00000 = y(2);
G0401R_TG00000i00 = y(3);
TG00001 = y(4);
G0401T = y(5);
G0401T_TG00000i00 = y(6);
G3958R = y(7);
G3958R_TG00001i00 = y(8);
G3958T = y(9);
G3958T_TG00001i00 = y(10);
G0401R_G1770i00 = y(11);
G0401R_G1770_TG00000i00 = y(12);
G0401T_G1770i00 = y(13);
G0401T_G1770_TG00000i00 = y(14);
G1770 = y(15);
LG0000 = y(16);
G1770_LG0000i00 = y(17);
G0401R_G1770_LG0000i00 = y(18);
G0401T_G1770_LG0000i00 = y(19);

% constants and constant expressions
global ode_rate_constants;
fb00 = ode_rate_constants(1);
bb00 = ode_rate_constants(2);
kp00 = ode_rate_constants(3);
fb01 = ode_rate_constants(4);
bb01 = ode_rate_constants(5);
kp01 = ode_rate_constants(6);
bb02 = ode_rate_constants(7);
kp02 = ode_rate_constants(8);
fb02 = ode_rate_constants(9);
bb03 = ode_rate_constants(10);
kp03 = ode_rate_constants(11);
bb04 = ode_rate_constants(12);
fb03 = ode_rate_constants(13);
bb05 = ode_rate_constants(14);
fb04 = ode_rate_constants(15);
bb06 = ode_rate_constants(16);
fu00 = ode_rate_constants(17);
bu00 = ode_rate_constants(18);
fu01 = ode_rate_constants(19);
bu01 = ode_rate_constants(20);
fu02 = ode_rate_constants(21);
bu02 = ode_rate_constants(22);
fu03 = ode_rate_constants(23);
bu03 = ode_rate_constants(24);
fu04 = ode_rate_constants(25);
bu04 = ode_rate_constants(26);
fu05 = ode_rate_constants(27);
bu05 = ode_rate_constants(28);
clamp_sink_LG0000 = ode_rate_constants(29);



% dynamic rate expressions
clamp_source_LG0000 = (+(event_flags(1) && ~event_flags(4))*min((t-event_times(1))/1000, 1)*3.33333333333333*4.0+event_flags(4)*max(1-(t-event_times(4))/1000, 0)*3.33333333333333*4.0+(event_flags(2) && ~event_flags(5))*min((t-event_times(2))/1000, 1)*3.33333333333333*4.0+event_flags(5)*max(1-(t-event_times(5))/1000, 0)*3.33333333333333*4.0+(event_flags(3) && ~event_flags(6))*min((t-event_times(3))/1000, 1)*3.33333333333333*4.0+event_flags(6)*max(1-(t-event_times(6))/1000, 0)*3.33333333333333*4.0);

% differential equations for independent species
dydt(size(y,1),1) = 0;
dydt(1)= + bb00*G0401R_TG00000i00 + kp00*G0401R_TG00000i00 + bb04*G0401R_G1770i00 + bb04*G0401R_G1770_LG0000i00 + bu00*G0401T - fb00*G0401R*TG00000 - fb02*G0401R*G1770 - fb02*G0401R*G1770_LG0000i00 - fu00*G0401R ;
dydt(2)= + bb00*G0401R_TG00000i00 + bb01*G0401T_TG00000i00 + kp02*G3958R_TG00001i00 + kp03*G3958T_TG00001i00 + bb00*G0401R_G1770_TG00000i00 + bb01*G0401T_G1770_TG00000i00 - fb00*G0401R*TG00000 - fb01*G0401T*TG00000 - fb00*G0401R_G1770i00*TG00000 - fb01*G0401T_G1770i00*TG00000 ;
dydt(3)= + fb00*G0401R*TG00000 + bb04*G0401R_G1770_TG00000i00 + bu03*G0401T_TG00000i00 - bb00*G0401R_TG00000i00 - kp00*G0401R_TG00000i00 - fb02*G1770*G0401R_TG00000i00 - fu03*G0401R_TG00000i00 ;
dydt(4)= + kp00*G0401R_TG00000i00 + kp01*G0401T_TG00000i00 + bb02*G3958R_TG00001i00 + bb03*G3958T_TG00001i00 + kp00*G0401R_G1770_TG00000i00 + kp01*G0401T_G1770_TG00000i00 - fb00*G3958R*TG00001 - fb02*G3958T*TG00001 ;
dydt(5)= + bb01*G0401T_TG00000i00 + kp01*G0401T_TG00000i00 + bb05*G0401T_G1770i00 + bb05*G0401T_G1770_LG0000i00 + fu00*G0401R - fb01*G0401T*TG00000 - fb03*G0401T*G1770 - fb03*G0401T*G1770_LG0000i00 - bu00*G0401T ;
dydt(6)= + fb01*G0401T*TG00000 + bb05*G0401T_G1770_TG00000i00 + fu03*G0401R_TG00000i00 - bb01*G0401T_TG00000i00 - kp01*G0401T_TG00000i00 - fb03*G1770*G0401T_TG00000i00 - bu03*G0401T_TG00000i00 ;
dydt(7)= + bb02*G3958R_TG00001i00 + kp02*G3958R_TG00001i00 + bu01*G3958T - fb00*G3958R*TG00001 - fu01*G3958R ;
dydt(8)= + fb00*G3958R*TG00001 + bu04*G3958T_TG00001i00 - bb02*G3958R_TG00001i00 - kp02*G3958R_TG00001i00 - fu04*G3958R_TG00001i00 ;
dydt(9)= + bb03*G3958T_TG00001i00 + kp03*G3958T_TG00001i00 + fu01*G3958R - fb02*G3958T*TG00001 - bu01*G3958T ;
dydt(10)= + fb02*G3958T*TG00001 + fu04*G3958R_TG00001i00 - bb03*G3958T_TG00001i00 - kp03*G3958T_TG00001i00 - bu04*G3958T_TG00001i00 ;
dydt(11)= + bb00*G0401R_G1770_TG00000i00 + kp00*G0401R_G1770_TG00000i00 + fb02*G0401R*G1770 + bb06*G0401R_G1770_LG0000i00 + bu02*G0401T_G1770i00 - fb00*G0401R_G1770i00*TG00000 - bb04*G0401R_G1770i00 - fb04*LG0000*G0401R_G1770i00 - fu02*G0401R_G1770i00 ;
dydt(12)= + fb00*G0401R_G1770i00*TG00000 + fb02*G1770*G0401R_TG00000i00 + bu05*G0401T_G1770_TG00000i00 - bb00*G0401R_G1770_TG00000i00 - kp00*G0401R_G1770_TG00000i00 - bb04*G0401R_G1770_TG00000i00 - fu05*G0401R_G1770_TG00000i00 ;
dydt(13)= + bb01*G0401T_G1770_TG00000i00 + kp01*G0401T_G1770_TG00000i00 + fb03*G0401T*G1770 + bb06*G0401T_G1770_LG0000i00 + fu02*G0401R_G1770i00 - fb01*G0401T_G1770i00*TG00000 - bb05*G0401T_G1770i00 - fb04*LG0000*G0401T_G1770i00 - bu02*G0401T_G1770i00 ;
dydt(14)= + fb01*G0401T_G1770i00*TG00000 + fb03*G1770*G0401T_TG00000i00 + fu05*G0401R_G1770_TG00000i00 - bb01*G0401T_G1770_TG00000i00 - kp01*G0401T_G1770_TG00000i00 - bb05*G0401T_G1770_TG00000i00 - bu05*G0401T_G1770_TG00000i00 ;
dydt(15)= + bb04*G0401R_G1770i00 + bb05*G0401T_G1770i00 + bb06*G1770_LG0000i00 + bb04*G0401R_G1770_TG00000i00 + bb05*G0401T_G1770_TG00000i00 - fb02*G0401R*G1770 - fb03*G0401T*G1770 - fb04*G1770*LG0000 - fb02*G1770*G0401R_TG00000i00 - fb03*G1770*G0401T_TG00000i00 ;
dydt(16)= + bb06*G1770_LG0000i00 + bb06*G0401R_G1770_LG0000i00 + bb06*G0401T_G1770_LG0000i00 + clamp_source_LG0000 - fb04*G1770*LG0000 - fb04*LG0000*G0401R_G1770i00 - fb04*LG0000*G0401T_G1770i00 - clamp_sink_LG0000*LG0000 ;
dydt(17)= + fb04*G1770*LG0000 + bb04*G0401R_G1770_LG0000i00 + bb05*G0401T_G1770_LG0000i00 - bb06*G1770_LG0000i00 - fb02*G0401R*G1770_LG0000i00 - fb03*G0401T*G1770_LG0000i00 ;
dydt(18)= + fb02*G0401R*G1770_LG0000i00 + fb04*LG0000*G0401R_G1770i00 + bu02*G0401T_G1770_LG0000i00 - bb04*G0401R_G1770_LG0000i00 - bb06*G0401R_G1770_LG0000i00 - fu02*G0401R_G1770_LG0000i00 ;
dydt(19)= + fb03*G0401T*G1770_LG0000i00 + fb04*LG0000*G0401T_G1770i00 + fu02*G0401R_G1770_LG0000i00 - bb05*G0401T_G1770_LG0000i00 - bb06*G0401T_G1770_LG0000i00 - bu02*G0401T_G1770_LG0000i00 ;


ode_end_time = cputime;
ode_tot_cputime = ode_tot_cputime + (ode_end_time - ode_start_time);

Kp_px=1;        Ki_px=0.001;    Kd_px=0.5;
Kp_vx=15.00;    Ki_vx=0.1;      Kd_vx=2;
Kp_ax=0.75;     Ki_ax=0.1;      Kd_ax=0.00001;

Kp_py=1;        Ki_py=0.001;    Kd_py=0.5;
Kp_vy=15.00;    Ki_vy=0.1;      Kd_vy=2;
Kp_ay=0.75;     Ki_ay=0.1;      Kd_ay=0.00001;

Kp_pz=0.5;      Ki_pz=0.001;    Kd_pz=0.025;
Kp_vz=5;        Ki_vz=2.5;      Kd_vz=0.05;
Kp_az=0.75;     Ki_az=0.01;     Kd_az=0.001;

Start_POS = [ -1.00 -1.00 1.05;
              -1.00  1.00 1.10;
               1.00  0.00 1.15;
               0.00  0.00 0.50];
          
% End_POS_coop = [ 
%                0.50  0.50 0.50;
%                0.50  1.50 0.55;
%                1.75  1.00 0.60;
%                1.00  1.00 0.45];

End_POS_coop = Start_POS+0.5;
% End_POS_coop(4,:) = [2 2 0.5]; %results part 3

%Seeds for random values
s1=cputime()*10;
s2=round(s1+randn*10 + 1);
s3=round(s2+randn*10 + 32);
s4=round(s3+randn*10 + 55);

% s1=round(sqrt(now()*11));
% s2=round(sqrt(now()*12));
% s3=round(sqrt(now()*13));
% s4=round(sqrt(now()*14));

var_ranges=0.0025;
var_accel=0.0001;
var_pos=0.5^2;
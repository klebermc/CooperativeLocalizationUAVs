function [sys,x0,str,ts] = LocationAlgorithm(t,x,u,flag)
% *************** Kalman Filter S-Function*****************
% Kleber Cabral
% 05/08/2017
%
% This simulation uses the error model to predict the accel x,y and gyro z biases


switch flag,
	case 0
		[sys,x0,str,ts] = mdlInitializeSizes; % Initialization
		
	case 3
		sys = mdlOutputs(t,x,u); % Calculate outputs
        
	case 9
		sys = mdlTerminate(t,x,u);
	
	case { 1, 2, 4 }
		sys = []; % Unused flags
	
	otherwise
	error(['Unhandled flag = ',num2str(flag)]); % Error handling
end;


%
%=============================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
%=============================================================================
%
function [sys,x0,str,ts,simStateCompliance] = mdlInitializeSizes()

sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 3;
sizes.NumInputs      = 16;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;

sys = simsizes(sizes);
x0 = []; % No continuous states
str = []; % No state ordering
ts = [-1 0]; % Inherited sample time - sample time: [period, offset]
% end mdlInitializeSizes

%
%=============================================================================
% mdlOutputs
% Return the output vector for the S-function
%=============================================================================
%
function sys = mdlOutputs(t,x,u)

% Three measurements
% fixed_modules_positions = [u(1),u(2),u(3);u(4),u(5),u(6);u(7),u(8),u(9)];
% distance_readings = [u(13),u(14),u(15)];

% Four measurements (height)
fixed_modules_positions = [
    u(1),u(2),u(3);
    u(4),u(5),u(6);
    u(7),u(8),u(9);
    u(10),u(11),0];
distance_readings = [u(13),u(14),u(15),u(16)];

firt_guess = [0;0;0];
xm=0; ym=0; zm=0;

% try
if (median(abs(u(1:9)))~=0)
    [xm, ym, zm] = taylor_series( fixed_modules_positions , distance_readings, firt_guess );
    if isnan(xm)
        xm=0; ym=0; zm=0;
    end
end
% catch
%     disp('Error TS alg');
%     xm=0; ym=0; zm=0;
% end
sys = [xm, ym, zm];
% end mdlOutputs

%
%=============================================================================
% mdlTerminate
% Perform any end of simulation tasks.
%=============================================================================
%
function sys=mdlTerminate(t,x,u)
sys = [];
% end mdlTerminate
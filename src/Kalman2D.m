function [sys,x0,str,ts] = Kalman2D(t,x,u,flag)
% *************** Kalman Filter S-Function*****************
% Kleber Cabral
% 05/08/2017
%
% This simulation uses the error model to predict the accel x,y and gyro z biases
%
% The states are:  X = [Px, Py, Pz, Vx, Vy, Vz]'

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
sizes.NumOutputs     = 6;
sizes.NumInputs      = 8;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;

sys = simsizes(sizes);
x0 = []; % No continuous states
str = []; % No state ordering
ts = [-1 0]; % Inherited sample time - sample time: [period, offset]

% Access global variables from workspace
global P;
global R;
global Q;
global H;
global X_INS;
global HISTORY_P;

global rising_det_sig_10Hz;
global rising_det_sig_1Hz;

global k;
global time;

k=1;
time=[];
rising_det_sig_10Hz=0;
rising_det_sig_1Hz=0;

%**************************************************************
%All the states that are somehow needed by Kalman Filter

P = eye(6)*0.1;        %initial state error covariance matrix
% P(1,1)=1;
% P(2,2)=1;
% P(3,3)=1;
% P(4,4)=1;
% P(5,5)=1;
% P(6,6)=10;

R = diag([0.01, 0.01, 0.01]);                   % Covariance of distance range measurements
Q = diag([0.01, 0.01, 0.01, 0.01, 0.01, 0.01]); % Covariance of acccelerometer measurements
H = [eye(3) zeros(3)];

HISTORY_P=diag(P);
%**************************************************************

%******** Estados do INS **********
% inicialização dos estados (vetor X)
X_INS=[0;0;0;0;0;0];
%**********************************
% end mdlInitializeSizes

%
%=============================================================================
% mdlOutputs
% Return the output vector for the S-function
%=============================================================================
%
function sys = mdlOutputs(t,x,u)
% Access global variables from workspace
global P;
global R;
global Q;
global H;
global X_INS;
global HISTORY_P;

global rising_det_sig_10Hz;
global rising_det_sig_1Hz;

global k;
global time;

%IMU
accel = [u(1); u(2); u(3)];

%Location System and Compass
P_LS = [u(4); u(5); u(6)];

% ****** Propagation Kalman Filter******
if rising_det_sig_10Hz < u(7) %the signal went from 0 to 1
    time=[time, t];

    % ****** Last stage or propagation P_minus_k+1 ******
    [ X_INS(:,k+1), P ] = kalman_filter( X_INS(:,k), P_LS , H, Q, R, P, accel, 'prop');
    HISTORY_P = [HISTORY_P , diag(P)];
% end
    k=k+1;
    
% ****** Update of Kalman Filter ******
% if rising_det_sig_1Hz < u(8) %the signal went from 0 to 1
   [ X_INS(:,k), P ] = kalman_filter( X_INS(:,k), P_LS , H, Q, R, P, accel, 'upd');
end
% ------------------------------------------

rising_det_sig_10Hz=u(7);
rising_det_sig_1Hz=u(8);
% ------------------------------------------    

sys = X_INS(:,k);
% end mdlOutputs

%
%=============================================================================
% mdlTerminate
% Perform any end of simulation tasks.
%=============================================================================
%
function sys=mdlTerminate(t,x,u)

% Access global variables from workspace
global P;
global R;
global Q;
global H;
global X_INS;
global HISTORY_P;

global k;
global time;

save('kalman_variables.mat','P','R', 'Q', 'H', 'X_INS', 'HISTORY_P', 'time');

% figure(1);
% subplot(3,1,1); 
%     hold on; grid on; 
%     plot(time,(X_INS(1,:))');plot(time,(X_INS(2,:))');plot(time,(Xv(1,:))');plot(time,(Xv(2,:))');
%     legend('Vx INS - estimado','Vy INS - estimado','Vx - verdadeiro','Vy - verdadeiro','Location','Best');
% subplot(3,1,2); 
%     hold on; grid on; 
%     plot(time,(X_INS(3,:))');plot(time,(X_INS(4,:))');plot(time,(Xv(3,:))');plot(time,(Xv(4,:))');
%     legend('Px INS - estimado','Py INS - estimado','Px - verdadeiro','Py - verdadeiro','Location','Best');
%     for i=1:length(Px_LS)
%         plot(i, Px_LS(i), 'kx');
%         plot(i, Py_LS(i), 'kx');
%     end
% subplot(3,1,3); 
%     hold on; grid on; 
%     plot(time,(X_INS(5,:))');plot(time,(Xv(5,:))');
%     legend( 'Psi INS - estimado','Psi - verdadeiro','Location','Best');

% figure(2);
% plot(HISTORY_Bias');
% grid on;
% legend('Bias ax','Bias ay','Bias wz');

% figure(3);
subplot(2,3,1); plot(HISTORY_P(1,:)); grid on; title('Px');
subplot(2,3,2); plot(HISTORY_P(2,:)); grid on; title('Py');
subplot(2,3,3); plot(HISTORY_P(3,:)); grid on; title('Pz');
subplot(2,3,4); plot(HISTORY_P(4,:)); grid on; title('Vx');
subplot(2,3,5); plot(HISTORY_P(5,:)); grid on; title('Vy');
subplot(2,3,6); plot(HISTORY_P(6,:)); grid on; title('Vz');

% for k=1:max(size(HISTORY_P)); DV(:,k)=sqrt(HISTORY_P(:,k)); end;
% figure(4);
% subplot(3,1,1);
% plot(time,X_INS(3,:)-Xv(3,:),'r-',time,3*DV(3,:),'b-',time,-DV(3,:)*3,'b-');
% legend('Erro na posicao em x do INS [m]','+-3 * "Desvio Padrao" em x [m]','Location','Best');
% xlabel('Tempo (s)');ylabel('posição em x (m)'); grid on;
% title('Erro e desvio padrao na estimativa de posicao em x');
% 
% subplot(3,1,2);
% plot(time,X_INS(4,:)-Xv(4,:),'r-',time,3*DV(4,:),'b-',time,-DV(4,:)*3,'b-');
% legend('Erro na posicao em y do INS [m]','+-3 * "Desvio Padrao" em y [m]','Location','Best');
% xlabel('Tempo (s)');ylabel('posicao em y (m)'); grid on;
% title('Erro e desvio padrao na estimativa de posicao em y');
% 
% subplot(3,1,3);
% plot(time,(X_INS(5,:)-Xv(5,:))*180/pi,'r-',time,3*DV(5,:)*180/pi,'b-',time,-DV(5,:)*3*180/pi,'b-');
% legend('Erro no angulo de guinada [graus]','+-3 * "Desvio Padrao" em psi [graus]','Location','Best');
% xlabel('Tempo (s)'); ylabel('angulo de Guinada (graus)'); grid on;
% title('Erro e desvio padrao na estimativa do angulo de guinada');
% 
% figure(6);
% hold on; grid on;
% plot(time,X_INS(3,:)-Xv(3,:),'r');
% plot(time,X_INS(4,:)-Xv(4,:),'b');
% title('Erro na estimativa de posicao em x e y');
% legend('Erro pos x [m]','Erro pos y [m]','Location','Best');
sys = [];
% end mdlTerminate
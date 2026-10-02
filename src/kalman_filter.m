function [ x , P ] = kalman_filter( x, P_LS , H, Q, R, P, accel, step)
%Kalman filter Propagation and Update
%   use the step as a string, 'init', 'prop' or 'upd'

    A_I = accel;%R_b2I * accel;
    z = P_LS;
    dt = 0.1;
    
    if(strcmp(step,'init'))
        x=[0;0;0;0;0;0];
    end
    
    %INS State and Kalman filter update
    if(strcmp(step,'prop')) 
        %Prediction
        F = [zeros(3), eye(3); zeros(3), zeros(3)];
        G = [zeros(3), zeros(3); zeros(3), eye(3)];
        Qd = ( G*Q*G' )* dt;                % SYSTEM NOISE MATRIX
        PHI = eye(6) + F*dt;                % STATE TRANSITION MATRIX
        x = PHI*x + (G * dt) * [0;0;0; A_I(1);A_I(2);A_I(3)];         % Propagation of states through the dynamic of system
        P = PHI*P*PHI' + Qd;                % Propagation of the covariance matrix
        P = (P'+P)/2;                       % Forcing the covariance matrix to be symmetric
        % ***********************************************************    
    end
    
    if(strcmp(step,'upd'))
        %Update
        K = P * H' /(H*P*H'+ R);                        % Kalman gain calculation
        x = x + K * (z-H*x);                            % Updating the state vector
        P = (eye(6)- K*H)*P*((eye(6)- K*H)') + K*R*K';  % Corrected Covariance Matrix, Joseph Form
        % ***********************************************************
    end
end


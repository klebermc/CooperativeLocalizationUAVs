clear
ftsz=14;
lw=1.2;

% ------------- PART 1 - CANONICAL ----
% 
% load('quadrotor3_var_PT1.mat')
% 
% close all
% 
% 
% for i=2:size(X.Px_Trilateration.Data,1)
%     if X.Px_Kalman_Estimation.Data(i) ~= X.Px_Kalman_Estimation.Data(i-1)
%         X_TrilaProcessed.Data(i) = X.Px_Trilateration.Data(i);
%         X_TrilaProcessed.Time(i) = X.Px_Trilateration.Time(i);
%     end
% end
% for i=2:size(Y.Py_Trilateration.Data,1)
%     if Y.Py_Kalman_Estimation.Data(i) ~= Y.Py_Kalman_Estimation.Data(i-1)
%         Y_TrilaProcessed.Data(i) = Y.Py_Trilateration.Data(i);
%         Y_TrilaProcessed.Time(i) = Y.Py_Trilateration.Time(i);
%     end
% end
% for i=2:size(Z.Pz_Trilateration.Data,1)
%     if Z.Pz_Kalman_Estimation.Data(i) ~= Z.Pz_Kalman_Estimation.Data(i-1)
%         Z_TrilaProcessed.Data(i) = Z.Pz_Trilateration.Data(i);
%         Z_TrilaProcessed.Time(i) = Z.Pz_Trilateration.Time(i);
%     end
% end
% % hold on; grid on;
% % plot(X.Px_Trilateration,'k')
% % plot(X_TrilaProcessed.Time, X_TrilaProcessed.Data,'bx')
% % plot(X.Px_Kalman_Estimation, 'r');
% % hold off;
% 
% 
% fig1=figure(1);
% % fig1.Units='normalized';
% fig1.OuterPosition=[0 0 944 941];
% fig1.Position=[0 0 944 941];
% fig1.InnerPosition=[0 0 944 941];
% 
% % %Ascension
% % SE1=[];SE2=[];SE3=[];
% % for i=10*40:20*40; 
% % SE1=[SE1, (X.Px_real.Data(i)-X.Px_Kalman_Estimation.Data(i))^2];
% % SE2=[SE2, (Y.Py_real.Data(i)-Y.Py_Kalman_Estimation.Data(i))^2];
% % SE3=[SE3, (Z.Pz_real.Data(i)-Z.Pz_Kalman_Estimation.Data(i))^2];
% % end
% % RMSE = [sqrt(mean(SE1)),sqrt(mean(SE2)),sqrt(mean(SE3))]
% % 
% % %Hovering
% % SE1=[];SE2=[];SE3=[];
% % for i=20*40:40*40
% % SE1=[SE1, (X.Px_real.Data(i)-X.Px_Kalman_Estimation.Data(i))^2];
% % SE2=[SE2, (Y.Py_real.Data(i)-Y.Py_Kalman_Estimation.Data(i))^2];
% % SE3=[SE3, (Z.Pz_real.Data(i)-Z.Pz_Kalman_Estimation.Data(i))^2];
% % end
% % RMSE = [sqrt(mean(SE1)),sqrt(mean(SE2)),sqrt(mean(SE3))]
% % 
% % %Translation
% % SE1=[];SE2=[];SE3=[];
% % for i=40*40:60*40
% % SE1=[SE1, (X.Px_real.Data(i)-X.Px_Kalman_Estimation.Data(i))^2];
% % SE2=[SE2, (Y.Py_real.Data(i)-Y.Py_Kalman_Estimation.Data(i))^2];
% % SE3=[SE3, (Z.Pz_real.Data(i)-Z.Pz_Kalman_Estimation.Data(i))^2];
% % end
% % RMSE = [sqrt(mean(SE1)),sqrt(mean(SE2)),sqrt(mean(SE3))]
% % 
% % %Overall
% % SE1=[];SE2=[];SE3=[];
% % for i=5*40:55*40
% % SE1=[SE1, (X.Px_real.Data(i)-X.Px_Kalman_Estimation.Data(i))^2];
% % SE2=[SE2, (Y.Py_real.Data(i)-Y.Py_Kalman_Estimation.Data(i))^2];
% % SE3=[SE3, (Z.Pz_real.Data(i)-Z.Pz_Kalman_Estimation.Data(i))^2];
% % end
% % RMSE = [sqrt(mean(SE1)),sqrt(mean(SE2)),sqrt(mean(SE3))]
% 
%  % Standard deviation - height estimation
% % value=[];
% % for i=45*40:59*40
% % value=[value, Z.Pz_Trilateration.Data(i)];
% % end
% % std_deviation = std(value)
% 
% subplot(3,1,1); hold on;grid on;
% 
% plot(X.Px_real, 'k','LineWidth',lw,'DisplayName','Real');
% plot(X.Px_Reference, 'm','LineWidth',lw,'DisplayName','Reference');
% % plot(X.Px_Trilateration, 'b','LineWidth',lw,'DisplayName','Trilateration Algorithm');
% % plot(X_TrilaProcessed.Time, X_TrilaProcessed.Data, 'bx','DisplayName','Trilateration Algorithm');
% plot(X.Px_Kalman_Estimation, 'r','LineWidth',lw,'DisplayName','Kalman Filter Estimation');
% 
% title('Position','FontSize',ftsz); ylabel('X [m]','FontSize',ftsz);
% lgd = legend('show'); lgd.Location='southeast';
% ax = gca;ax.FontSize=ftsz;ax.LineWidth=1; 
% % axis([5 20 -0.2 0.2]); % ascension
% % axis([20 39 -0.2 0.2]); % hovering
% axis([40 60 -0.2 0.7]); % translation
% % axis tight; 
% hold off;
% 
% subplot(3,1,2); hold on;grid on;
% 
% plot(Y.Py_real, 'k','LineWidth',lw,'DisplayName','Real');
% plot(Y.Py_Reference, 'm','LineWidth',lw,'DisplayName','Reference');
% % plot(Y.Py_Trilateration, 'b','LineWidth',lw,'DisplayName','Trilateration Algorithm');
% % plot(Y_TrilaProcessed.Time, Y_TrilaProcessed.Data, 'bx','DisplayName','Trilateration Algorithm');
% plot(Y.Py_Kalman_Estimation, 'r','LineWidth',lw,'DisplayName','Kalman Filter Estimation');
% 
% ylabel('Y [m]','FontSize',ftsz);
% lgd = legend('show'); lgd.Location='southeast';
% ax = gca;ax.FontSize=ftsz;ax.LineWidth=1; 
% % axis([5 20 -0.2 0.2]); % ascension
% % axis([20 39 -0.2 0.2]); % hovering
% axis([40 60 -0.2 0.7]); % translation
% % axis tight;
% hold off;
% 
% subplot(3,1,3); hold on;grid on; 
% 
% plot(Z.Pz_real, 'k','LineWidth',lw,'DisplayName','Real');
% plot(Z.Pz_Reference, 'm','LineWidth',lw,'DisplayName','Reference');
% % plot(Z.Pz_Trilateration, 'b','LineWidth',lw,'DisplayName','Trilateration Algorithm');
% % plot(Z_TrilaProcessed.Time, Z_TrilaProcessed.Data, 'bx','DisplayName','Trilateration Algorithm');
% plot(Z.Pz_Kalman_Estimation, 'r','LineWidth',lw,'DisplayName','Kalman Filter Estimation');
% 
% xlabel('Time [s]','FontSize',ftsz); ylabel('Z [m]','FontSize',ftsz);
% lgd = legend('show'); lgd.Location='southeast';
% ax = gca;ax.FontSize=ftsz;ax.LineWidth=1; 
% % axis([5 20 -0.2 0.7]); % ascension
% % axis([20 39 0.3 0.7]); % hovering
% axis([40 60 0.3 1.2]); % translation
% % axis tight; 
% hold off;


% %------------- PART 2 - Translation of vehicles ----
% load('quadrotor3_var_PT2_3.mat')
% 
% close all
% 
% 
% for i=2:size(X.Px_Trilateration.Data,1)
%     if X.Px_Kalman_Estimation.Data(i) ~= X.Px_Kalman_Estimation.Data(i-1)
%         X_TrilaProcessed.Data(i) = X.Px_Trilateration.Data(i);
%         X_TrilaProcessed.Time(i) = X.Px_Trilateration.Time(i);
%     end
% end
% for i=2:size(Y.Py_Trilateration.Data,1)
%     if Y.Py_Kalman_Estimation.Data(i) ~= Y.Py_Kalman_Estimation.Data(i-1)
%         Y_TrilaProcessed.Data(i) = Y.Py_Trilateration.Data(i);
%         Y_TrilaProcessed.Time(i) = Y.Py_Trilateration.Time(i);
%     end
% end
% for i=2:size(Z.Pz_Trilateration.Data,1)
%     if Z.Pz_Kalman_Estimation.Data(i) ~= Z.Pz_Kalman_Estimation.Data(i-1)
%         Z_TrilaProcessed.Data(i) = Z.Pz_Trilateration.Data(i);
%         Z_TrilaProcessed.Time(i) = Z.Pz_Trilateration.Time(i);
%     end
% end
% % hold on; grid on;
% % plot(X.Px_Trilateration,'k')
% % plot(X_TrilaProcessed.Time, X_TrilaProcessed.Data,'bx')
% % plot(X.Px_Kalman_Estimation, 'r');
% % hold off;
% 
% 
% fig1=figure(1);
% % fig1.Units='normalized';
% % fig1.OuterPosition=[0 0 1 1];
% 
% fig1.OuterPosition=[0 0 944 941];
% fig1.Position=[0 0 944 941];
% fig1.InnerPosition=[0 0 944 941];
% 
% subplot(3,1,1); hold on;grid on;
% 
% plot(X.Px_real, 'k','LineWidth',lw,'DisplayName','Real');
% plot(X.Px_Reference, 'm','LineWidth',lw,'DisplayName','Reference');
% % plot(X.Px_Trilateration, 'b','LineWidth',lw,'DisplayName','Trilateration Algorithm');
% % plot(X_TrilaProcessed.Time, X_TrilaProcessed.Data, 'bx','DisplayName','Trilateration Algorithm');
% plot(X.Px_Kalman_Estimation, 'r','LineWidth',lw,'DisplayName','Kalman Filter Estimation');
% 
% title('Position','FontSize',ftsz); ylabel('X [m]','FontSize',ftsz);
% lgd = legend('show'); lgd.Location='northwest';
% ax = gca;ax.FontSize=ftsz;ax.LineWidth=1; 
% % axis([0 60 -0.2 0.2]); %part2_1
% axis tight;%part2_2
% hold off;
% 
% subplot(3,1,2); hold on;grid on;
% 
% plot(Y.Py_real, 'k','LineWidth',lw,'DisplayName','Real');
% plot(Y.Py_Reference, 'm','LineWidth',lw,'DisplayName','Reference');
% % plot(Y.Py_Trilateration, 'b','LineWidth',lw,'DisplayName','Trilateration Algorithm');
% % plot(Y_TrilaProcessed.Time, Y_TrilaProcessed.Data, 'bx','DisplayName','Trilateration Algorithm');
% plot(Y.Py_Kalman_Estimation, 'r','LineWidth',lw,'DisplayName','Kalman Filter Estimation');
% 
% ylabel('Y [m]','FontSize',ftsz);
% lgd = legend('show'); lgd.Location='northwest';
% ax = gca;ax.FontSize=ftsz;ax.LineWidth=1; 
% % axis([0 60 -0.2 0.2]); %part2_1
% axis tight;%part2_2
% hold off;
% 
% subplot(3,1,3); hold on;grid on; 
% 
% plot(Z.Pz_real, 'k','LineWidth',lw,'DisplayName','Real');
% plot(Z.Pz_Reference, 'm','LineWidth',lw,'DisplayName','Reference');
% % plot(Z.Pz_Trilateration, 'b','LineWidth',lw,'DisplayName','Trilateration Algorithm');
% % plot(Z_TrilaProcessed.Time, Z_TrilaProcessed.Data, 'bx','DisplayName','Trilateration Algorithm');
% plot(Z.Pz_Kalman_Estimation, 'r','LineWidth',lw,'DisplayName','Kalman Filter Estimation');
% 
% xlabel('Time [s]','FontSize',ftsz); ylabel('Z [m]','FontSize',ftsz);
% lgd = legend('show'); lgd.Location='northwest';
% ax = gca;ax.FontSize=ftsz;ax.LineWidth=1; 
% % axis([0 60 -0.2 1.2]); %part2_1
% axis tight;%part2_2
% hold off;



% %------------- PART 3 change in references -----
% load('quadrotor3_var_PT3_2_exp05.mat')
% 
% close all
% 
% 
% for i=2:size(X.Px_Trilateration.Data,1)
%     if X.Px_Kalman_Estimation.Data(i) ~= X.Px_Kalman_Estimation.Data(i-1)
%         X_TrilaProcessed.Data(i) = X.Px_Trilateration.Data(i);
%         X_TrilaProcessed.Time(i) = X.Px_Trilateration.Time(i);
%     end
% end
% for i=2:size(Y.Py_Trilateration.Data,1)
%     if Y.Py_Kalman_Estimation.Data(i) ~= Y.Py_Kalman_Estimation.Data(i-1)
%         Y_TrilaProcessed.Data(i) = Y.Py_Trilateration.Data(i);
%         Y_TrilaProcessed.Time(i) = Y.Py_Trilateration.Time(i);
%     end
% end
% for i=2:size(Z.Pz_Trilateration.Data,1)
%     if Z.Pz_Kalman_Estimation.Data(i) ~= Z.Pz_Kalman_Estimation.Data(i-1)
%         Z_TrilaProcessed.Data(i) = Z.Pz_Trilateration.Data(i);
%         Z_TrilaProcessed.Time(i) = Z.Pz_Trilateration.Time(i);
%     end
% end
% % hold on; grid on;
% % plot(X.Px_Trilateration,'k')
% % plot(X_TrilaProcessed.Time, X_TrilaProcessed.Data,'bx')
% % plot(X.Px_Kalman_Estimation, 'r');
% % hold off;
% 
% 
% fig1=figure(1);
% fig1.Units='normalized';
% fig1.OuterPosition=[0 0 1 1];
% 
% % fig1.OuterPosition=[0 0 944 941];
% % fig1.Position=[0 0 944 941];
% % fig1.InnerPosition=[0 0 944 941];
% 
% 
% subplot(3,1,1); hold on;grid on;
% 
% plot(X.Px_real, 'k','LineWidth',lw,'DisplayName','Real');
% plot(X.Px_Reference, 'm','LineWidth',lw,'DisplayName','Reference');
% % plot(X.Px_Trilateration, 'b','LineWidth',lw,'DisplayName','Trilateration Algorithm');
% plot(X_TrilaProcessed.Time, X_TrilaProcessed.Data, 'bx','DisplayName','Trilateration Algorithm');
% plot(X.Px_Kalman_Estimation, 'r','LineWidth',lw,'DisplayName','Kalman Filter Estimation');
% 
% title('Position','FontSize',ftsz); ylabel('X [m]','FontSize',ftsz);
% % lgd = legend('show'); lgd.Location='northwest';
% ax = gca;ax.FontSize=ftsz;ax.LineWidth=1; 
% axis([0 60 -0.5 0.5]); %part3_2
% % axis tight;
% hold off;
% 
% subplot(3,1,2); hold on;grid on;
% 
% plot(Y.Py_real, 'k','LineWidth',lw,'DisplayName','Real');
% plot(Y.Py_Reference, 'm','LineWidth',lw,'DisplayName','Reference');
% % plot(Y.Py_Trilateration, 'b','LineWidth',lw,'DisplayName','Trilateration Algorithm');
% plot(Y_TrilaProcessed.Time, Y_TrilaProcessed.Data, 'bx','DisplayName','Trilateration Algorithm');
% plot(Y.Py_Kalman_Estimation, 'r','LineWidth',lw,'DisplayName','Kalman Filter Estimation');
% 
% ylabel('Y [m]','FontSize',ftsz);
% % lgd = legend('show'); lgd.Location='northwest';
% ax = gca;ax.FontSize=ftsz;ax.LineWidth=1;
% axis([0 60 -0.5 0.5]); %part3_2
% % axis tight;
% hold off;
% 
% subplot(3,1,3); hold on;grid on;
% 
% plot(Z.Pz_real, 'k','LineWidth',lw,'DisplayName','Real');
% plot(Z.Pz_Reference, 'm','LineWidth',lw,'DisplayName','Reference');
% % plot(Z.Pz_Trilateration, 'b','LineWidth',lw,'DisplayName','Trilateration Algorithm');
% plot(Z_TrilaProcessed.Time, Z_TrilaProcessed.Data, 'bx','DisplayName','Trilateration Algorithm');
% plot(Z.Pz_Kalman_Estimation, 'r','LineWidth',lw,'DisplayName','Kalman Filter Estimation');
% 
% xlabel('Time [s]','FontSize',ftsz); ylabel('Z [m]','FontSize',ftsz);
% lgd = legend('show'); lgd.Location='southeast';
% ax = gca;ax.FontSize=ftsz;ax.LineWidth=1;
% axis([0 60 -0.5 0.8]);
% % axis tight;
% hold off;
% 
% % %Inside
% % SE1=[];SE2=[];SE3=[];
% % for i=10*40:20*40; 
% % %     SE1=[SE1, (X.Px_real.Data(i)-X.Px_Kalman_Estimation.Data(i))^2];
% % %     SE2=[SE2, (Y.Py_real.Data(i)-Y.Py_Kalman_Estimation.Data(i))^2];
% % %     SE3=[SE3, (Z.Pz_real.Data(i)-Z.Pz_Kalman_Estimation.Data(i))^2];
% % 
% %     SE1=[SE1, (X.Px_real.Data(i)-X.Px_Trilateration.Data(i))^2];
% %     SE2=[SE2, (Y.Py_real.Data(i)-Y.Py_Trilateration.Data(i))^2];
% %     SE3=[SE3, (Z.Pz_real.Data(i)-Z.Pz_Trilateration.Data(i))^2];
% % end
% % RMSE = [sqrt(mean(SE1)),sqrt(mean(SE2)),sqrt(mean(SE3))]
% % 
% % %Outside
% % SE1=[];SE2=[];SE3=[];
% % for i=30*40:40*40
% % %     SE1=[SE1, (X.Px_real.Data(i)-X.Px_Kalman_Estimation.Data(i))^2];
% % %     SE2=[SE2, (Y.Py_real.Data(i)-Y.Py_Kalman_Estimation.Data(i))^2];
% % %     SE3=[SE3, (Z.Pz_real.Data(i)-Z.Pz_Kalman_Estimation.Data(i))^2];
% % 
% %     SE1=[SE1, (X.Px_real.Data(i)-X.Px_Trilateration.Data(i))^2];
% %     SE2=[SE2, (Y.Py_real.Data(i)-Y.Py_Trilateration.Data(i))^2];
% %     SE3=[SE3, (Z.Pz_real.Data(i)-Z.Pz_Trilateration.Data(i))^2];
% % end
% % RMSE = [sqrt(mean(SE1)),sqrt(mean(SE2)),sqrt(mean(SE3))]

% ------------- PART 4 - CANONICAL + HEIGHT SENSOR ----

load('quadrotor3_var_PT1.mat')

close all


for i=2:size(X.Px_Trilateration.Data,1)
    if X.Px_Kalman_Estimation.Data(i) ~= X.Px_Kalman_Estimation.Data(i-1)
        X_TrilaProcessed.Data(i) = X.Px_Trilateration.Data(i);
        X_TrilaProcessed.Time(i) = X.Px_Trilateration.Time(i);
    end
end
for i=2:size(Y.Py_Trilateration.Data,1)
    if Y.Py_Kalman_Estimation.Data(i) ~= Y.Py_Kalman_Estimation.Data(i-1)
        Y_TrilaProcessed.Data(i) = Y.Py_Trilateration.Data(i);
        Y_TrilaProcessed.Time(i) = Y.Py_Trilateration.Time(i);
    end
end
for i=2:size(Z.Pz_Trilateration.Data,1)
    if Z.Pz_Kalman_Estimation.Data(i) ~= Z.Pz_Kalman_Estimation.Data(i-1)
        Z_TrilaProcessed.Data(i) = Z.Pz_Trilateration.Data(i);
        Z_TrilaProcessed.Time(i) = Z.Pz_Trilateration.Time(i);
    end
end
% hold on; grid on;
% plot(X.Px_Trilateration,'k')
% plot(X_TrilaProcessed.Time, X_TrilaProcessed.Data,'bx')
% plot(X.Px_Kalman_Estimation, 'r');
% hold off;


fig1=figure(1);
fig1.Units='normalized';
fig1.OuterPosition=[0 0 1 1];

% fig1.OuterPosition=[0 0 944 941];
% fig1.Position=[0 0 944 941];
% fig1.InnerPosition=[0 0 944 941];

% %Ascension
% SE1=[];SE2=[];SE3=[];
% for i=10*40:20*40; 
% SE1=[SE1, (X.Px_real.Data(i)-X.Px_Kalman_Estimation.Data(i))^2];
% SE2=[SE2, (Y.Py_real.Data(i)-Y.Py_Kalman_Estimation.Data(i))^2];
% SE3=[SE3, (Z.Pz_real.Data(i)-Z.Pz_Kalman_Estimation.Data(i))^2];
% end
% RMSE = [sqrt(mean(SE1)),sqrt(mean(SE2)),sqrt(mean(SE3))]
% 
% %Hovering
% SE1=[];SE2=[];SE3=[];
% for i=20*40:40*40
% SE1=[SE1, (X.Px_real.Data(i)-X.Px_Kalman_Estimation.Data(i))^2];
% SE2=[SE2, (Y.Py_real.Data(i)-Y.Py_Kalman_Estimation.Data(i))^2];
% SE3=[SE3, (Z.Pz_real.Data(i)-Z.Pz_Kalman_Estimation.Data(i))^2];
% end
% RMSE = [sqrt(mean(SE1)),sqrt(mean(SE2)),sqrt(mean(SE3))]
% 
% %Translation
% SE1=[];SE2=[];SE3=[];
% for i=40*40:60*40
% SE1=[SE1, (X.Px_real.Data(i)-X.Px_Kalman_Estimation.Data(i))^2];
% SE2=[SE2, (Y.Py_real.Data(i)-Y.Py_Kalman_Estimation.Data(i))^2];
% SE3=[SE3, (Z.Pz_real.Data(i)-Z.Pz_Kalman_Estimation.Data(i))^2];
% end
% RMSE = [sqrt(mean(SE1)),sqrt(mean(SE2)),sqrt(mean(SE3))]
% 
%Overall
SE1=[];SE2=[];SE3=[];
for i=5*40:55*40
% SE1=[SE1, (X.Px_real.Data(i)-X.Px_Kalman_Estimation.Data(i))^2];
% SE2=[SE2, (Y.Py_real.Data(i)-Y.Py_Kalman_Estimation.Data(i))^2];
% SE3=[SE3, (Z.Pz_real.Data(i)-Z.Pz_Kalman_Estimation.Data(i))^2];
    SE1=[SE1, (X.Px_real.Data(i)-X.Px_Trilateration.Data(i))^2];
    SE2=[SE2, (Y.Py_real.Data(i)-Y.Py_Trilateration.Data(i))^2];
    SE3=[SE3, (Z.Pz_real.Data(i)-Z.Pz_Trilateration.Data(i))^2];
end
RMSE = [sqrt(mean(SE1)),sqrt(mean(SE2)),sqrt(mean(SE3))]

 % Standard deviation - height estimation
% value=[];
% for i=45*40:59*40
% value=[value, Z.Pz_Trilateration.Data(i)];
% end
% std_deviation = std(value)

subplot(3,1,1); hold on;grid on;

plot(X.Px_real, 'k','LineWidth',lw,'DisplayName','Real');
% plot(X.Px_Reference, 'm','LineWidth',lw,'DisplayName','Reference');
% plot(X.Px_Trilateration, 'b','LineWidth',lw,'DisplayName','Trilateration Algorithm');
plot(X_TrilaProcessed.Time, X_TrilaProcessed.Data, 'bx','DisplayName','Trilateration Algorithm');
plot(X.Px_Kalman_Estimation, 'r','LineWidth',lw,'DisplayName','Kalman Filter Estimation');

title('Position','FontSize',ftsz); ylabel('X [m]','FontSize',ftsz);
lgd = legend('show'); lgd.Location='southeast';
ax = gca;ax.FontSize=ftsz;ax.LineWidth=1; 
% axis([5 20 -0.2 0.2]); % ascension
% axis([20 39 -0.2 0.2]); % hovering
% axis([40 60 -0.2 0.7]); % translation
axis tight; 
hold off;

subplot(3,1,2); hold on;grid on;

plot(Y.Py_real, 'k','LineWidth',lw,'DisplayName','Real');
% plot(Y.Py_Reference, 'm','LineWidth',lw,'DisplayName','Reference');
% plot(Y.Py_Trilateration, 'b','LineWidth',lw,'DisplayName','Trilateration Algorithm');
plot(Y_TrilaProcessed.Time, Y_TrilaProcessed.Data, 'bx','DisplayName','Trilateration Algorithm');
plot(Y.Py_Kalman_Estimation, 'r','LineWidth',lw,'DisplayName','Kalman Filter Estimation');

ylabel('Y [m]','FontSize',ftsz);
lgd = legend('show'); lgd.Location='southeast';
ax = gca;ax.FontSize=ftsz;ax.LineWidth=1; 
% axis([5 20 -0.2 0.2]); % ascension
% axis([20 39 -0.2 0.2]); % hovering
% axis([40 60 -0.2 0.7]); % translation
axis tight;
hold off;

subplot(3,1,3); hold on;grid on; 

plot(Z.Pz_real, 'k','LineWidth',lw,'DisplayName','Real');
% plot(Z.Pz_Reference, 'm','LineWidth',lw,'DisplayName','Reference');
% plot(Z.Pz_Trilateration, 'b','LineWidth',lw,'DisplayName','Trilateration Algorithm');
plot(Z_TrilaProcessed.Time, Z_TrilaProcessed.Data, 'bx','DisplayName','Trilateration Algorithm');
plot(Z.Pz_Kalman_Estimation, 'r','LineWidth',lw,'DisplayName','Kalman Filter Estimation');

xlabel('Time [s]','FontSize',ftsz); ylabel('Z [m]','FontSize',ftsz);
lgd = legend('show'); lgd.Location='southeast';
ax = gca;ax.FontSize=ftsz;ax.LineWidth=1; 
% axis([5 20 -0.2 0.7]); % ascension
% axis([20 39 0.3 0.7]); % hovering
% axis([40 60 0.3 1.2]); % translation
axis tight; 
hold off;


% Standard deviation - height estimation
value1=[];value2=[];value3=[];
for i=45*40:59*40
    value1=[value1, X.Px_Trilateration.Data(i)];
    value2=[value2, Y.Py_Trilateration.Data(i)];
    value3=[value3, Z.Pz_Trilateration.Data(i)];
end
std_deviation = [std(value1),std(value2),std(value3)]


% %--------Resize and save the figure---------
% fig=figure(1);
% % ax = gca;
% % ax.FontSize=ftsz;
% % ax.LineWidth=1;
% % outerpos = ax.OuterPosition;
% % ti = ax.TightInset; 
% % left = outerpos(1) + ti(1);
% % bottom = outerpos(2) + ti(2);
% % ax_width = outerpos(3) - ti(1) - ti(3);
% % ax_height = outerpos(4) - ti(2) - ti(4);
% % ax.Position = [left bottom ax_width ax_height];
% % axis tight
% saveas(fig,'Figures/results/XYZ_part4.png');
% %--------------------------------------------
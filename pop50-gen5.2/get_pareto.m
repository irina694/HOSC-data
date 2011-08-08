% Plot the final set of Pareto optimal solutions
% @optimal_solns filename containing the data (finaldata1.dat)
%   where data is Nx3 array of drag, power, and lift coefficients
% @discarded filename containing discarded solutions (discards.dat)


function [soln] = get_pareto(optimal_solns, discarded)
close all
% number of design variables (topology + kinematics)
N_vars = 1598;

% nxm array that contains n optimal solutions 
% for m-3 design variables, and 3 objective function values
optimal = importdata(optimal_solns);
discard = importdata(discarded);

[N_opt, M_opt] = size(optimal);
[N_dis, M_dis] = size(discard);


% get array of objective functions for N_opt optimal designs
soln = optimal(:, [M_opt-2:M_opt]);
disc = discard(:, [M_dis-2:M_dis]);

C_Dopt = abs(soln(:, 1)); % drag
C_Popt = abs(soln(:, 2)); % power
C_Lopt = abs(soln(:, 3)); % lift

C_Dall = abs(disc(:, 1)); % drag
C_Pall = abs(disc(:, 2)); % power
C_Lall = abs(disc(:, 3)); % lift

% C_D optimal design
[CDmin, drag_index] = min(C_Dopt)
xCDopt = optimal(drag_index, [1:M_opt-3]);
CDmin_power = C_Popt(drag_index, 1);
CDmin_lift = C_Lopt(drag_index, 1);

% C_P optimal design
[CPmin, power_index] = min(C_Popt)
xCPopt = optimal(power_index, [1:M_opt-3]);
CPmin
CPmin_drag = C_Dopt(power_index, 1)
CPmin_lift = C_Lopt(power_index, 1)

% C_L optimal design
 [CLmax, lift_index] = max(C_Lopt)
 xCLopt = optimal(lift_index, [1:M_opt-3]);
 CLmax
 CLmin_power = C_Popt(lift_index, 1)
 CLmin_drag = C_Dopt(lift_index, 1)

%plot Pareto optimal solutions for all populations
% figure(1);
% plot3(C_Dopt, C_Lopt, C_Popt, '.r', CDmin, CDmin_lift, CDmin_power, 'ok', ...
%    CPmin_drag, CPmin_lift, CPmin, '^k', CLmin_drag, CLmax, CLmin_power, 'vk');%, C_Dall, C_Lall, C_Pall, 'ok');
% %legend('final set of Pareto optimal solutions', 'all non-optimal solutions', 'Location','NorthEastOutside');
% xlabel('C_D coefficient');
% ylabel('C_L coefficient');
% zlabel('C_P coefficient');
% set(gca, 'DataAspectRatio', [1 1 1], 'View', [55.0 36.0]); 
% grid on;
% box on;
% axis([0.15 0.25 0.25 0.65 0.3 0.5]);


save('xCDopt', '-ascii', 'xCDopt');
x_topoD = optimal(drag_index, [1:M_opt-156]);
x_topoP = optimal(power_index, [1:M_opt-156]);
x_topoL = optimal(lift_index, [1:M_opt-156]);
f = flapping_fun_topo(x_topoL, 1, 100);


% plot CD vs CL
% figure(2);
% subplot(3,1,1);
% plot(C_Dopt, C_Lopt, 'or', C_Dall, C_Lall, 'ok');
% xlabel('C_D coefficient', 'fontsize', 14);
% ylabel('C_L coefficient', 'fontsize', 14);
% title('Drag-Lift trade off');
% axis([0.15 0.25 0.25 0.65]);
% 
% % plot CD vs CP
% subplot(3,1,2)
% plot(C_Dopt, C_Popt, 'or', C_Dall, C_Pall, 'ok');
% xlabel('C_D coefficient');
% ylabel('C_P coefficient');
% title('Drag-Power trade off');
% axis([0.15 0.25 0.3 0.5]);
% 
% % plot CL vs CP
% subplot(3,1,3)
% plot(C_Lopt, C_Popt, 'or', C_Lall, C_Pall, 'ok');
% xlabel('C_L coefficient');
% ylabel('C_P coefficient');
% title('Lift-Power trade off');
% axis([0.25 0.65 0.3 0.5]);
% 
% % plot each coefficient as a function of genration number
% pop0 = load('population_0.dat');
% pop1 = load('population_1.dat');
% pop2 = load('population_2.dat');
% pop3 = load('population_3.dat');
% pop4 = load('population_4.dat');
% 
% % find the mean value at each geneartion
% [n, m] = size(pop0);
% C_D0 = pop0(:,m-2);
% C_D1 = pop1(:,m-2);
% C_D2 = pop2(:,m-2);
% C_D3 = pop3(:,m-2);
% C_D4 = pop4(:,m-2);
% 
% size(C_D0);
% size(C_D1);
% size(C_D2);
% size(C_D3);
% size(C_D4);
% 
% C_D0 = mean(abs(pop0(:,m-2)));
% C_D1 = mean(abs(pop1(:,m-2)));
% C_D2 = mean(abs(pop2(:,m-2)));
% C_D3 = mean(abs(pop3(:,m-2)));
% C_D4 = mean(abs(pop4(:,m-2)));
% C_D = [C_D0 C_D1 C_D2 C_D3 C_D4];
% 
% gens = [0:4];
% 
% % plot the Pareto front
% figure(3);
% plot3(C_Dopt, C_Lopt, C_Popt, 'or');
% xlabel('C_D coefficient');
% ylabel('C_L coefficient');
% zlabel('C_P coefficient');
% set(gca, 'DataAspectRatio', [1 1 1], 'View', [55.0 36.0]); 
% axis([0.15 0.25 0.25 0.65 0.3 0.5]);
% grid on;
% box on;
end
                
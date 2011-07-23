% plot Pareto front for three objective functions (drag, power and lift)
% input file contains a 3x1 vector of doubles

function [] = plot_pareto(file_name)
close all
f = load(file_name);

% Drag coefficient data
D_max = max(f(:,1)); 
D_min = min(f(:,1));
D_mean = mean(f(:,1));
D_std = std(f(:,1));
D = [D_max, D_min, D_mean, D_std];
disp(D);

% Power coefficient data
P_max = max(f(:,2)); 
P_min = min(f(:,2));
P_mean = mean(f(:,2));
P_std = std(f(:,2));
P = [P_max, P_min, P_mean, P_std];
disp(P);

% Lift coefficient data
L_max = max(f(:,3)); 
L_min = min(f(:,3));
L_mean = mean(f(:,3));
L_std = std(f(:,3));
L = [L_max, L_min, L_mean, L_std];
disp(L);

plot3(f(:,1), f(:,2), f(:,3), '.r')
axis([D_mean-D_std D_mean+D_std P_mean-P_std P_mean+P_std L_mean-L_std L_mean+L_std])
xlabel('drag coefficient');
ylabel('power coefficient');
zlabel('lift coefficient');
title('768 function evaluations for 7 generations of inital population of 20');
end
% loads Fourier coefficients and calculates a function

function [] = fourier_test(x_filename, N)

% load x from filename
x = load(x_filename, '-ascii');

N = str2num(N); 
N_kin_vars = N*6+6; %N*2+2 for each motion
x_end = length(x) - N_kin_vars;

% find Fourier series coefficients for the plunging motion
A = x(1, x_end+1:length(x));
% n = -N, -N+1, ..., -1, 0, 1, ..., N-1, N
% and nth term in the series is a_n*exp(i*omega*n*t)
a_z0 = A(1,1);
a_z = A(1, 2:2*N+2);
N_vector = [-N:N];
kin.omega = 40;

% time info
time.N_per = 1; % how many time steps per flapping cycle?
time.N_cycles = 5; % how many flapping cycles (want to time march until initial transients die out)?
time.skip = 10; % only plot output every time.skip time steps

time.t_step = 2*pi/kin.omega/time.N_per;
time.N_steps = time.N_per*time.N_cycles;
time.t = (0:time.t_step:time.t_step*time.N_steps)';

% calculate the coefficients for the plunging motion
exponent = i*kin.omega*N_vector;
expMatrix = exp(time.t*exponent);
z = expMatrix*a_z';
kin.z = a_z0 + z;

% calculate the coefficients for the derivative
coeff_zp = i*kin.omega*N_vector.*a_z;
kin.zp = expMatrix*coeff_zp';

% calculate the coefficients for the second derivative
coeff_zpp = -kin.omega*kin.omega*N_vector.*N_vector.*a_z;
kin.zpp = expMatrix*coeff_zpp';

% sinusoidal motion

%kin.z = kin.z_m*sin(kin.omega*time.t + kin.z_shift) + kin.z_DC; % kinematic motions at each time step
%kin.zp = kin.omega*kin.z_m*cos(kin.omega*time.t + kin.z_shift);
%kin.zpp = -kin.omega*kin.omega*kin.z_m*sin(kin.omega*time.t + kin.z_shift);
end
% finds Fourier coefficients for a series from -N to N
% using fast Fourier transform.
% D the number of Fourier coefficients 
function [] = fourier_coeff(D)

close all

kin.omega = 40; 
time.N_per = 100; % how many time steps per flapping cycle?
time.N_cycles = 5; % how many flapping cycles (want to time march until initial transients die out)?
time.skip = 10; % only plot output every time.skip time steps

time.t_step = 2*pi/40/time.N_per;
time.N_steps = time.N_per*time.N_cycles;
time.t = (0:time.t_step:time.t_step*time.N_steps)'; % number of discrete points

kin.z = 0;
kin.f = pi/6*sin(40*time.t);
kin.th = pi/45;

%f = fft(kin.f);

% test on sine function 
if (mod(D, 2) == 0)
    N = D/2;
else
    N = (D-1)/2;
end

% get D data points
t_end = time.t(length(time.t),1);
X = [0:t_end/D:t_end*(D-1)/D];

y = pi/6*sin(kin.omega*X);
%y=kin.th*ones([1,101]);
yp = pi/6*kin.omega*cos(kin.omega*X);
ypp = -pi/6*kin.omega*kin.omega*sin(kin.omega*X);

k_vector = [-N:N];
Q = exp(sqrt(-1)*kin.omega*X'*k_vector);
C = 1/D*Q'*y';
Cp = sqrt(-1)*kin.omega*diag(k_vector)*C;
Cpp = -kin.omega*kin.omega*diag(k_vector.*k_vector)*C;

% reconstruct the function using the Fourier coefficients
v = Q*C;
vp = Q*Cp;
vpp = Q*Cpp;
% interpolate
v_interp = resample(v, length(time.t), length(v));
length(v_interp)
figure()
plot(time.t, real(v_interp), '.b');

%  figure(1)
%  plot(X, real(v), 'ob');
%  figure(2)
%  plot(X, y, '+r');
%  
%  figure(3)
%  plot(X, real(vp), '.r');
%  figure(4)
%  plot(X, yp, '.g');
%  
%  figure(5)
%  plot(X, real(vpp), '.m');
%  figure(6)
%  plot(X, ypp, '.b');

end
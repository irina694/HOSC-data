flapping_fun
@x_filename file that contains vector x, all design variables 
@plot_decide_string either 0 (no plots are output) or 1 
@N index to split the x vector into topology and kinematics
@return vector g (drag, power, and lift coefficients)

function [g] = flapping_fun(x_filename, plot_decide_string, N)

- load x
- setup Gvars and input variables
- setup wing geometry in structs wing and loads
- setup kinematics in struct kin
- setup time-step information
- free-stream conditions
- call create_cell(x, Gvars, input) to setup wing topology
- setup wing structure in struct mat
- set alpha integration parameters
- set number of Glauert expansions
- set number of inflow explansions
- set number of Gauss points at each span station
- describe the kinematics in struct kin (sinusoidal motion) 
- call wing_geom2 to define wing geometry 
- calculate Glauert expansion and contraction matrices
- calculate aero loading terms
- find inlfow matrices
- find FEA parameters
- set FEA boundary conditions
- call stiffness_matrix to find stiffness matrix and conversion of pressure forces
- call mass_matrix to find the mass matrix
- find natural modes
- call inertial_loads to find inertial forces
- covert pressured at Gauss points into uniform pressure over elements
- convert FEA solution into displacement at gauss points
- set initial conditions
- allocate memorry for lift, drag, & power coefficients, aerodynamic power, kinetic & strain enegy rate
- pre-compute matrices in struct interp 
- set time marching for plot output
- calculate transformation matrix
- compute aeroelastic matrices 
- assemble in struct solve
- integrate solve
- find inflow terms
- find structural terms
- find airloads
- find final forces
- calculate power
- plot
- calculate efficiency
- find final objectives (cycle-ave drag, power, and lift)
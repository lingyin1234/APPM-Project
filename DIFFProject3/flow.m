close all; clear all; 
% This Matlab code generates a vector field for the system of ODEs 
% dx/dt = f(x,y), dy/dt = g(x,y)

% This code currently will find the vector field for the EXAMPLE problem
%           dx/dt = a*x2
%           dy/dt = -x1
%--------------------------------------------------------------------------
%        THIS IS NOT THE PROBLEM YOU ARE SOLVING FOR PROJECT 3!
% (Make any necessary adjustments to this code so that it generates the 
% vector field for the Project 3 system of equations.)
%--------------------------------------------------------------------------


% Set the axis limits
vmin = -0.05; vmax = 1.2; hmin = -0.05; hmax = 2.75;

%set step size for x and y;
vstep = 0.2; hstep = 0.2; 

%generate mesh for plotting
[v, h] = meshgrid(vmin:0.1:hmax, hmin:0.1:hmax);

%set parameter values 
a = 0.15;
k = 8;
E = 0.002;
u1 = 0.2;
u2 = 0.3;

% Define the system of equations 
dv = -k.*v.*(v-a).*(v-1)-v.*h;  
dh = (E+(u1.*h./(v+u2))).*(-h-k.*v.*(v-a-1));

%normalize vectors (to help plotting)
dv = dv./sqrt(dv.^2 + dh.^2);
dh = dh./sqrt(dv.^2 + dh.^2);

% Generate the vector field

quiver(v, h, dv,dh,'AutoScaleFactor',0.5)

%change axes limits, add labels
axis([vmin vmax hmin hmax])
xlabel('$v$','Interpreter','latex')
ylabel('$h$','Interpreter','latex')

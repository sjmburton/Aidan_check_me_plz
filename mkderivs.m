function derivs = mkderivs(t,intvars)   
%
% The function takes the current value of time t, and the current
% value of a vector called intvars, which has the same dimension
% as the initial conditions vector.  In this example, intvars = [x,v].
% The function computes a column vector of derivatives.
%
% Give the elements of intvars physically meaningful names
%
x = intvars(1); 
v = intvars(2);
%
global m k c
m = 0.5;
k = 44.2;
c = 9.402;
%
derivs(1) = v;  %derivative of x
derivs(2) = 1/m*(-c*v-k*x);  %derivative of v
%
derivs = [derivs(1);derivs(2)];   % result must be a column vector,
						% not a row vector

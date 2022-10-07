% mksim.m
% mass-spring simulation
close all  % closes all plot windows
clear all  % clears variables from memory
%
% Define initial conditions and time window
xo = 0.1; 
vo = 1;
ti = 0; % start time
tf = 10; % end time
%
[T,OUT] = ode45(@mkderivs,[ti tf],[xo vo]);  
% [ti tf] is time range. [xo vo] are initial conditions.  
% mkderivs.m is a program that calculates the slopes of x and v
% ode45 takes the current values of x and v, along with the slopes,
% and finds the next value of x and v.  It does this until t = tf.
% 
global m k  % this global declaration lets us define the parameters
            % in the mkderivs.m file and use them now for post-processing

% Plot outputs
%
figure % opens new figure
subplot(2,1,1)
plot(T,OUT(:,1));  % plots “everything comma 1” of the X vector
ylabel('x [m]')
%
subplot(2,1,2)
plot(T,OUT(:,2));
ylabel('v [m/s]')
xlabel('Time [s]')
%
% Calculating and plotting spring force
%
L = length(T);  	%finds the number of elements in T
x = OUT(:,1);	%give the position column a physically meaningful
			%name
   for i = 1:L;
   Fs(i) = k*x(i);	%take the i’th element of x, multiply by k
				%to get the i’th spring force value
   end;
%
figure
plot(x,Fs)  %note that we’re plotting Fs vs. x, not vs. time
title('Spring Force')
xlabel('x [m]')
ylabel('F_s [N]')
%





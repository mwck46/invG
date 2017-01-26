function [ g ] = grav_sphere( z,rho,R,Xmin,Xmax )
% Gravity anomaly of due to a sphere
% Parameters:
% z = depth of the center of the sphere in m
% rho = density contrast in kg/m^3
% R = radius of sphere in m
% Xmin is the min value of profile
% Xmax is the max value of profile

G=6.67384e-11;
x=linspace(Xmin,Xmax);
volume = (4/3)*pi*R^3;
g = G*volume*rho*z.*(x.^2+z.^2).^(-3/2)*10^5; %change to mgal

end


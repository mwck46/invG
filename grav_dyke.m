function [ g ] = grav_dyke( x1,x2,x3,x4,z1,z2,rho,Xmin,Xmax)
% Compute the vertical gravititational attraction of a 2D dyke extends
% to infinity perpendicularly to the profile line
%
% Inputs: 
% x1=upper corner of the left edge in (km)
% x2=lower corner of the left edge in (km)
% x3=upper corner of the right edge in (km)
% x4=lower corner of the right edge in (km)
% z1=depth of the top of edge in (km)
% z2=depth of the bottom of edge in (km) 
% (positive Z axis points downward, z2 must > z1)
% rho=Density contrast in kg/m^3

G=6.6732e-11;    %Gravitational constant
% change km to m for calculation
x1=x1*1000; x2=x2*1000; x3=x3*1000; x4=x4*1000; z1=z1*1000; z2=z2*1000;
Xmin=Xmin*1000; Xmax=Xmax*1000;
t = z2 - z1;     %Thickness
x=linspace(Xmin,Xmax);
% If no Xmin and Xmax are input: x=linspace(-Z2*10,Z2*10);


%% Left slab
beta1 = atan( (x1-x2)/(z2-z1) );

% Since the analytic formula depends only on beta, it needs to be shifted to xoordinate of x1
xx=-z1*tan(beta1);    % analogous to apparent position of x1 of the calculated signal
s1=x1-xx;             % s1=shift distance of left slab, every x afterwards are shifted from x to (x-s1)

pheta1 = atan((x-s1)/z1 + tan(beta1)); 
pheta2 = atan((x-s1)/z2 + tan(beta1));

phi1 = pheta1 - beta1;
phi2 = pheta2 - beta1;

% prevent r1=0/0 situation, 
% which occur if any x locate directly above the left edge of slab
if any(phi1==0) && any(phi2==0)
    %replace phi1 and phi2 by very smal number, 1^-10 in this case
    phi1(phi1==0)=1^-10;   
    phi2(phi2==0)=1^-10;
end

r1 = sin(phi1)./sin(phi2);

gL = 2*G*rho*( (pi*t/2) + (z2*pheta2-z1*pheta1) + (x-s1).*(pheta2-pheta1)*sin(beta1)*cos(beta1) + (x-s1).*cos(beta1)^2.*log(r1) );

%% Right slab
beta2 = atan((x3-x4)/(z2-z1));

xx=-z1*tan(beta2);
s2=x3-xx;

pheta3 = atan((x-s2)/z1 + tan(beta2)); 
pheta4 = atan((x-s2)/z2 + tan(beta2));

phi3 = pheta3 - beta2;
phi4 = pheta4 - beta2;
% prevent r1=0/0 situation, 
% which occur if any x locate directly above the right edge of slab
if any(phi3==0) && any(phi4==0)
    %replace phi3 and phi4 by very smal number, 1^-10 in this case
    phi3(phi3==0)=1^-10;   
    phi4(phi4==0)=1^-10;
end

r2 = sin(phi3)./sin(phi4);


gR = 2*G*rho*( (pi*t/2) + (z2*pheta4-z1*pheta3) + (x-s2).*(pheta4-pheta3)*sin(beta2)*cos(beta2) + (x-s2).*cos(beta2)^2.*log(r2) );

%Left slab - Right slab
g = (gL - gR)*10^5;   %change from ms^-2 to mGal
end


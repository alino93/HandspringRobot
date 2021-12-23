function [ Torque,Tmf ] = flight(th1,w1,V1_y,th2,V2,clk,FTi1,FTi2,Tm)

if (FTi1==0 && FTi2==0)
    Tmf=Tm;
    t=clk; 
    Torque=polyval(Tm,t);
else
%--------------------------------------- 
g=9.8;
th2=th2*pi/180;
th1=th1*pi/180;
Il=0.01962;
mtot=2.365; %total mass
mwd=1.865;  %mass without disk %#ok<*NASGU>
mbar=0.00712; %bar mass
L0=0.06;
c=37;
k=400;
syms t
%----------------

R=0.307+.02; % +0.03 = maximum positive deformation of spring(delta x) 

w1=-w1*pi/180;
V2rel=V2/(2)^0.5; 
w2=V2rel/R;
th2p=th2+pi/4;
%-----------------
T=2*V1_y/g+0.015; %flight time

%--------------------------
th2=pi-th2;
%Rotation stance phase------
B1=th1;
B2=w1;
B3=3*(th2-th1)/T^2-2*w1/T-w2/T;
B4=2*(th1-th2)/T^3+w1/T^2+w2/T^2;

th=B1+B2*t+B3*t^2+B4*t^3;%#ok<*NODEF>
th_d=diff(th,t);
th_dd=diff(th_d,t);
%----------------------
Tm=Il*th_dd;%rotor torque
%-----------------------
Tmf=sym2poly(Tm);
Tmf=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 Tmf];
t=clk; %#ok<*NASGU>
Torque=polyval(Tmf,t);       
%-----------------------   
end
end
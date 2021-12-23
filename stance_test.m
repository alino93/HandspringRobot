function [ ] = stance_test()
V2=2.2;
La=pi/6;
%--------------------
T=0.11;  %0.4
R=0.32;
g=9.8;  %!!!!g=5.5
x2=0.11; %
Il=0.0196;
Id=0.03;
mtot=2.365; %total mass
mwd=1.865;   %mass without disk
mbar=0.00712; %bar mass
L0=0.07; %L0=30cm
c=37;
k=200; %k=400
D=0.07; %D=0.10--> TotalTime =0.8065   FlightTime =0.4065
syms t
%----------------
Ga=(2*R+T*pi-((2*R+T*pi)^2-4*T*(2*R*La+T*(pi^2/4-2)))^0.5)/2/T;
w2=V2*(La-Ga)/T;
th2=T*w2/V2;
V2rel=V2*cos(Ga); 
%-----------------------------
V1rel=V2rel; w1=w2; th1=th2;
%-----------------------------
if (th1<0.01 && th1>-0.01) 
    w1=0;  
end
%--------------------------
V1rel=-abs(V1rel);
th1=-th1;
%----------------------------------------
dL = spring( k/2,L0,D ) %spring maximum deviation
wn=(k/mtot)^0.5;
%Rotation stance phase------
B1=th1;
B2=w1;
B3=3*(th2-th1)/T^2-2*w1/T-w2/T;
B4=2*(th1-th2)/T^3+w1/T^2+w2/T^2;

th=B1+B2*t+B3*t^2+B4*t^3;
th_d=diff(th,t);
th_dd=diff(th_d,t);
%-----------------------
A1=L0;
A2=V1rel;
A3=3*(x2-L0)/T^2-(2*V1rel+V2rel)/T; 
A4=2*(L0-x2)/T^3+(V1rel+V2rel)/T^2;      

x=A1+A2*t+A3*t^2+A4*t^3;
x_d=diff(x,t);
x_dd=diff(x_d,t);
%-------------------------
R=.307+x-L0;
Fm=mtot*(x_dd-th_d*th_d*R)+k*(x-L0)+mtot*g*cs(th)+c*x_d;
f_prime=mtot*(R*th_dd+2*th_d*x_d)-mtot*g*sn(th); %force on link from ground_normal to link
N=Fm+mbar*g*cs(th)+k*(L0-x)-c*x_d-mbar*R*th_d*th_d;   
Tm=Il*th_dd+f_prime*R+N*0.03*sn(th);%rotor torque
th_dot_rel=(-int(Tm)/Id-th_d);
%-------------------------
FlightTime=2*V2*cos(La)/g %#ok<*NOPTS> %flight time
TotalTime=T+FlightTime
%-------------------------------------------------------------------------  
    
    figure(1);
    ezplot(th,[0,T]);  
    title('Robot angle relative to the normal(rad)');
    figure(2);
    ezplot(th_d,[0,T]);  
    title('Robot angular Speed(rad/s)');
    figure(3);
    ezplot(th_dd,[0,T]);  
    title('Robot angular acc(rad/s^2)');
    figure(4);
    ezplot(Tm,[0,T]);  
    title('Rotor Torque(N.m)');
    figure(5);
    ezplot(th_dot_rel,[0,T]);  
    title('Rotor angular Speed(disk relative speed)(rpm)');
    figure(6);
    ezplot(f_prime,[0,T]); %Fm=linear motor force
    title('f-prime (N)');
    figure(7);
    ezplot(Fm,[0,T]); %Fm=linear motor force
    title('Linear motor force (N)');
    figure(8);
    ezplot(x*1000,[0,T]); %x=link displacement
    title('x-spring deformation (mm)');
    figure(9);
    ezplot(x_d,[0,T]); %x=link velocity
    title('r-dot (m/s)');
    figure(10);
    ezplot(f_prime/N,[0,T]); %x=link velocity
    title('Fy/Fx (Mu_s)');
end
function y=cs(x)
    y=1-x^2/2+x^4/24;
end
function y=sn(x)
    y=x-x^3/6+x^5/120;
end
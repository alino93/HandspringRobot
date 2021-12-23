function [ Force,Torque,Fmf,Tmf ] = stance(th1,V1rel,w1,th2,V2,clk,f_prime,FTi,Fm,Tm)
T=0.07;
R=0.307+.02; % +0.03 = maximum positive deformation of spring(delta x) 
if (FTi==0)
    Fmf=Fm;
    Tmf=Tm;
    t=clk; 
    if (t>T)
        Force=0;
        Torque=f_prime*R;
    else
        Force=polyval(Fm,t);
        Torque=polyval(Tm,t);
    end
else
%--------------------------------------- 
g=9.8;
x2=0.08;
th2=th2*pi/180;
th1=abs(th1)*pi/180;
Il=0.0196;
mtot=2.365; %total mass
mwd=1.865;  %#ok<*NASGU> %mass without disk
mbar=0.00712; %bar mass
L0=0.06;
c=37;
k=400;
syms t f_p
%----------------
  
V2rel=V2/(2)^0.5; 
w2=V2rel/R;
%-----------------
if (th1<0.01 && th1>-0.01) 
    w1=0;  
end
%--------------------------
V1rel=-abs(V1rel);
th1=-th1;
w1=-w1*pi/180;
%--------------
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
A3=3*(x2-L0)/T^2-(2*V1rel+V2rel)/T; %#ok<*NODEF>
A4=2*(L0-x2)/T^3+(V1rel+V2rel)/T^2;      
%find Fm
x=A1+A2*t+A3*t^2+A4*t^3;
x_d=diff(x,t);
x_dd=diff(x_d,t);

R=.307+x-L0;

Fm=mtot*(x_dd-th_d*th_d*R)+k*(x-L0)+mtot*g*cs(th)+c*x_d;

f_prime=mtot*(R*th_dd+2*th_d*x_d)-mtot*g*sn(th); %force on link from ground_normal to link
N=Fm+mbar*g*cs(th)+k*(L0-x)-c*x_d-mbar*R*th_d*th_d;

%----------------------    
Tm=Il*th_dd+f_prime*R+N*0.03*sn(th);%rotor torque
%-----------------------
Fmf=sym2poly(Fm);
Tmf=sym2poly(Tm);
t=clk;  
Force=polyval(Fmf,t);
Torque=polyval(Tmf,t);
%-----------------------   
end

end
function y=cs(x)
    y=1-x^2/2+x^4/24;
end
function y=sn(x)
    y=x-x^3/6+x^5/120;
end
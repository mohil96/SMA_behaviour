clear all;
dt=0.001;
theta=zeros(size(160));
e=zeros(size(160));
w=zeros(size(160));
s=zeros(size(160));
stress=zeros(size(160));
a=zeros(size(160));%angular velocity
theta(1)=180;% initial angle
tr=90;
w(1)=0;%initial angular velocity
p=6450;%density of sma
del=0.005;%pla to sma thickness(initial stretch)
e0=0.01;%initial strain
L=0.1;%wire length`
Ls=0.05;%aluminium sheet length
d=0.001;% wire diameter
A=pi*d^2/4;
rho=2793;% density of aluminium
Vs=5*10^-8;% volume of one fan
m=Vs*rho;%mass of one fan
n=20;%no of fans
I1=n/3*m*(Ls)^2;%MOI of Al sheet
rhopla=1250;%density of pla
Vp=4.286*10^-6;%volume of pla
I2=(rhopla*Vp*Ls^2)/3;
Mpla=rhopla*Vp;
y1=0.02408;
Mmag=7612*0.01*0.01*0.003;
y2=0.036;
I3=Mmag*y2^2/3;
I=I1+I2+I3;
g=9.81;
% I1=0;
% I2=0;
% I3=0;
%I=p*A*(1/3)*(L/2)^3;
for i=1:200
    s(i)=(2*del^2*(1-cosd(theta(i))))^(1/2);
    e(i)=e0+s(i)/L;
    stress(i)=-(5.34*10^6*e(i)^3-4.89*10^5*e(i)^2+1.68*10^4*e(i));
    a(i)=(stress(i)*10^6*A*del+Mpla*g*y1*cosd(theta(i))+Mmag*g*y2*cosd(theta(i)))/I;
    theta(i+1)=theta(i)+w(i)*dt+1/2*a(i)*dt^2;
    w(i+1)=w(i)+a(i)*dt;
    if theta(i+1)<tr
        break
    end
end
t=0:dt:i*dt;
plot(t,theta)
hold on


I=input('current in A=');
% for heating
Ca=7;
V=7.4;
Cm=2.5;
As=68;
Af=78;
Ms=52;
Mf=42;
rhoRm=76;
rhoRa=84;
L0=input('length in m =');
D=input('diameterin m=');
Em=input('martensite volume fraction=');
A=pi*D^2/4;
rhoRt=rhoRm*Em+rhoRa*(1-Em);
Rt=rhoRt*L0/A;
t=input('time for change in sec=');
% input energy
%Ee=I^2*Rt*t;
Ee=V*I*t;
disp('input energy=');
disp(Ee);
rhoD=6450;
V=A*L0;
c=322.4;
Twh=input('heating actuating temperature=');
Twc=input('cooling actuating temperature=');
delH=24180;
% heating energy
Eh=rhoD*V*(c*(Twh-Twc)+delH*Em);
disp('heating energy=');
disp(Eh);
strain=input('strain=');
delx=L0*strain;
F=(Ee-Eh)/delx;
disp('force=');
disp(F);





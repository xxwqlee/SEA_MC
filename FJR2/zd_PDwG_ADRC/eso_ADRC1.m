function [sys,x0,str,ts]=eso_ADRC1(t,x,u,flag)
switch flag
case 0
    [sys,x0,str,ts]=mdlInitializeSizes;
case 2
    sys=mdlUpdates(t,x,u);
case 3
    sys=mdlOutputs(t,x,u);
case {1, 4, 9 }
    sys = [];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 3;
sizes.NumOutputs     = 3;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys=simsizes(sizes);
x0=[0 0 0];
str=[];
ts=[0.001 0];
function sys=mdlUpdates(t,x,u)
%%ESO parameters
% beta1=30;beta2=300;beta3=10000;
beta1=100;beta2=300;beta3=2000;
delta1=0.0002;
alfa1=0.5;alfa2=0.25;
x1=u(1);
ut=u(2);
e=x(1)-x1;

if abs(e)>delta1
    fal1=abs(e)^alfa1*sign(e);
else
    fal1=e/(delta1^(1-alfa1));
end
if abs(e)>delta1
    fal2=abs(e)^alfa2*sign(e);
else
    fal2=e/(delta1^(1-alfa2));
end
% a=-2.8295e03;
T=0.001;
b=7.2607;
sys(1)=(x(2)-beta1*e)*T+x(1);
% sys(2)=a*x1+x(3)-beta2*fal1+b*ut;
sys(2)=(x(3)-beta2*fal1+b*ut)*T+x(2);
sys(3)=(-beta3*fal2)*T+x(3);
function sys=mdlOutputs(t,x,u)
sys=x;
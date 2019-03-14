function [sys,x0,str,ts]=fctrl_ADRC2(t,x,u,flag)
switch flag
case 0
    [sys,x0,str,ts]=mdlInitializeSizes;
% case 1
%     sys=mdlDerivatives(t,x,u);
case 3
    sys=mdlOutputs(t,x,u);
case {1,2, 4, 9 }
    sys = [];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 1;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys=simsizes(sizes);
x0=[];
str=[];
ts=[0.001 0];

function sys=mdlOutputs(t,x,u)
e1=u(1);
e2=u(2);
%%NPID parameters
delta0=0.0005;
alfa01=3/4;alfa02=3/2;%0<alfa1<1<alfa2
beta01=100;beta02=20.0;
kp=beta01;kd=beta02;

if abs(e1)>delta0
    fal1=abs(e1)^alfa01*sign(e1);
else
    fal1=e1/(delta0^(1-alfa01));
end
if abs(e2)>delta0
    fal2=abs(e2)^alfa02*sign(e2);
else
    fal2=e2/(delta0^(1-alfa02));
end

ut=kp*fal1+kd*fal2; %NPD
tm=ut;

sys=ut;
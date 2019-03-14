function [sys,x0,str,ts]=caculate_SEA_ADRC(t,x,u,flag)
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
global q10 q20
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 3;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys=simsizes(sizes);
x0=[];
str=[];
ts=[-1 0];
q10=0;
q20=0;
function sys=mdlOutputs(t,x,u)
global q10 q20
q1=u(1);
q2=u(2);
T=0.001;
dq1=(q1-q10)/T;
dq2=(q2-q20)/T;
Jm=0.1377;
Jl=0.12556;
k=185.8446;
a=-(k/Jm+k/Jl);
cm=3;
x1=q1-q2;
x2=dq1-dq2;
Jm=0.1377;
Jl=0.12556;
m=3;
g=9.8;
l=0.2;
f=m*g*l*sin(0.41195-q2)*Jm/Jl-cm/Jm*dq1;
q10=q1;
q20=q2;
sys(1)=x1;
sys(2)=x2;
sys(3)=f;

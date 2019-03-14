function [sys,x0,str,ts]=TD_SEA_ADRC(t,x,u,flag)
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
sizes.NumDiscStates  = 2;
sizes.NumOutputs     = 2;
sizes.NumInputs      = 1;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys=simsizes(sizes);
x0=[0 0];
str=[];
ts=[0.001 0];
function sys=mdlUpdates(t,x,u)
vt=u(1);
e=x(1)-vt;

nmn=5;
alfa=1;
T=0.001;

sys(1)=(x(2)-nmn*(abs(e))^0.5*sign(e))*T+x(1);
sys(2)=(-alfa*sign(e))*T+x(2);
function sys=mdlOutputs(t,x,u)
sys=x;
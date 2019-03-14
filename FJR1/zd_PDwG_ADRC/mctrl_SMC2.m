function [sys,x0,str,ts] = mctrl_SMC2(t,x,u,flag,P)

switch flag
case 0
    [sys,x0,str,ts]=mdlInitializeSizes;
case 3
    sys=mdlOutputs(t,x,u,P);
case {2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end

function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 4;
sizes.NumInputs      = 4;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [0.001 0];
function sys=mdlOutputs(t,x,u,P)
%% input and parameters
m1=2.5;
m2=1.3;
l1=0.2;
l2=0.2;
g=9.8;
q1=u(1);
dq1=u(2);
q2=u(3);
dq2=u(4);
q=[q1;q2];
dq=[dq1;dq2];
%% ideal trajectory
% r=0.3;
% X1=r*cos(t*2);
% dX1=-1*r*sin(t*2);
% ddX1=-1*r*cos(t*2);
% X2=r*sin(t*2);
% dX2=r*cos(t*2);
% ddX2=-1*r*sin(t*2);
% dX=[dX1;dX2];
% ddX=[ddX1;ddX2];
%% system matrix
M=[l2^2*m2+2*l1*l2*m2*cos(q2)+l1^2*(m1+m2) l2^2*m2+l1*l2*m2*cos(q2);
    l2^2*m2+l1*l2*m2*cos(q2) l2^2*m2];
C=[-m2*l1*l2*sin(q2)*dq2^2-2*m2*l1*l2*sin(q2)*dq1*dq2;
    m2*l1*l2*sin(q2)*dq1^2];
G=[m2*l2*g*cos(q1+q2)+(m1+m2)*l1*g*cos(q1);
    m2*l2*g*cos(q1+q2)];
%% 关节空间逆解
% Q2=acos((X1^2+X2^2-l1^2-l2^2)/(2*l1*l2));
% p1=atan(X2/X1);
% p2=acos((X1^2+X2^2+l1^2-l2^2)/(2*l1*sqrt(X1^2+X2^2)));
% if 0<=t&&t<=pi/4
%     Q1=p1-p2;
% elseif pi/4<t&&t<=pi/2
%     Q1=p1-p2+pi;
% elseif pi/2<t&&t<=3/4*pi
%     Q1=p1-p2+pi;
% else
%     Q1=p1-p2+2*pi;
% end
% Q=[Q1;Q2];
% 
% J=[-l1*sin(Q1)-l2*sin(Q1+Q2) -l2*sin(Q1+Q2);%雅可比矩阵
%     l1*cos(Q1)+l2*cos(Q1+Q2) l2*cos(Q1+Q2)];
% dQ=J\dX;
% dJ=[-l1*cos(Q1)-l2*cos(Q1+Q2) -l2*cos(Q1+Q2);
%     -l1*sin(Q1)-l2*sin(Q1+Q2) -l2*sin(Q1+Q2)]*dQ(1)+[-l2*cos(Q1+Q2) -l2*cos(Q1+Q2);
%     -l2*sin(Q1+Q2) -l2*sin(Q1+Q2)]*dQ(2);
% ddQ=J\(ddX-dJ*inv(J)*dX);
%% 点位控制
Q1=-pi/4;
Q2=pi/4;
Q=[Q1;Q2];
dQ=[0;0];
ddQ=[0;0];
%% control method
E=Q-q;
dE=dQ-dq;
S=dE+P.a*E;
d=P.d_m*rands(1);%disturbance
delta=P.delta;
%饱和函数
if abs(S)>delta
    sats=sign(S);
else
    sats=1/delta*S;
end
T=M*(ddQ+P.kp*E+P.kd*dE)+C+G+P.e*sats;
% T=M*(P.a*dE+P.k*S+P.e*sign(S)+ddQ)+C+G;
%% torque limitation
Tmax1=17;
Tmax2=14;
if T(1)>Tmax1
    T(1)=Tmax1;
elseif T(1)<-Tmax1
    T(1)=-Tmax1;
end
if T(2)>Tmax2
    T(2)=Tmax2;
elseif T(2)<-Tmax2
    T(2)=-Tmax2;
end
%% output
sys(1)=T(1)+d;
sys(2)=T(2)+d;
sys(3)=Q(1);
sys(4)=Q(2);
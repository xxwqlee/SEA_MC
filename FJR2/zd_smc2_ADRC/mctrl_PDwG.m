function [sys,x0,str,ts] = mctrl_PDwG(t,x,u,flag,P)

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
KP=P.kp*eye(2);
KD=P.kd*eye(2);
m1=2.5;
m2=1.3;
g=9.8;
l1=0.2;
l2=0.2;
q1=u(1);
q2=u(3);
dq1=u(2);
dq2=u(4);
q=[q1;q2];
dq=[dq1;dq2];
%% ideal track
r=0.3;
X1=r*cos(t*2);
dX1=-r*sin(t*2);
X2=r*sin(t*2);
dX2=r*cos(t*2);
dX=[dX1;dX2];
Q2=acos((X1^2+X2^2-l1^2-l2^2)/(2*l1*l2));
p1=atan(X2/X1);
p2=acos((X1^2+X2^2+l1^2-l2^2)/(2*l1*sqrt(X1^2+X2^2)));
if 0<=t&&t<=pi/4
    Q1=p1-p2;
elseif pi/4<t&&t<=pi/2
    Q1=p1-p2+pi;
elseif pi/2<t&&t<=3/4*pi
    Q1=p1-p2+pi;
else
    Q1=p1-p2+2*pi;
end
%% 点位控制
% Q1=pi/2;
% Q2=pi/2;
% Q=[Q1;Q2];
% dQ=[0;0];
%% 关节空间
J=[-l1*sin(Q1)-l2*sin(Q1+Q2) -l2*sin(Q1+Q2);%雅可比矩阵
    l1*cos(Q1)+l2*cos(Q1+Q2) l2*cos(Q1+Q2)];
dQ=J\dX;

Q=[Q1;Q2];
E=Q-q;
dE=dQ-dq;
% C=[-m2*l1*l2*sin(q2)*dq2^2-2*m2*l1*l2*sin(q2)*dq1*dq2;
%     m2*l1*l2*sin(q2)*dq1^2];
G=[m2*l2*g*cos(q1+q2)+(m1+m2)*l1*g*cos(q1);
    m2*l2*g*cos(q1+q2)];
T=KP*E+KD*dE+G;
%% 任务空间
% J=[-l1*sin(Q1)-l2*sin(Q1+Q2) -l2*sin(Q1+Q2);%雅可比矩阵
%     l1*cos(Q1)+l2*cos(Q1+Q2) l2*cos(Q1+Q2)];
% x1=l1*cos(q1)+l2*cos(q1+q2);
% x2=l2*sin(q1)+l2*sin(q1+q2);
% X=[X1;X2];
% x=[x1;x2];
% dx=J*dq;
% E=X-x;
% dE=dX-dx;
% Fx=P*E+D*dE;
% T=J'*Fx;
%% disturbance and inputlimit
d=0*rands(1);
lim1=17;
lim2=14;
if T(1)>lim1
    T(1)=lim1;
elseif T(1)<-lim1
    T(1)=-lim1;
end
if T(2)>lim2
    T(2)=lim2;
elseif T(2)<-lim2
    T(2)=-lim2;
end
%% output
sys(1)=T(1)+d;
sys(2)=T(2)+d;
sys(3)=Q(1);
sys(4)=Q(2);


    s1=15;
    s2=10;
    P.kp=s1*s2;
    P.kd=s1+s2;
    P.a=10;
    P.d_m=0;
    P.e=0.3;
    P.delta=1;%边界层厚度
sim('FJR_SMC2_ADRC2',1);
l1=0.2;
l2=0.2;
% t=linspace(0,6.283,6284);%生成离散时间列向量t
% x=[l1*cos(q(:,1))+l2*cos(q(:,1)+q(:,2)) l1*sin(q(:,1))+l2*sin(q(:,1)+q(:,2))]; %实际轨迹向量
% r=0.3;
% X=[r*cos(tout*2) r*sin(tout*2)]; %理想轨迹向量
close all

figure(1)
subplot(211);
plot(t,x(:,3),'k',t,Trans(:,1),'b',t,x(:,5),'--',t,x(:,1),'r','linewidth',1);
legend('x1d','x1 trans','x1 estimation','x1');
xlabel('time(s)');
ylabel('x1(rad)');
subplot(212);
plot(t,x(:,4),'k',t,Trans(:,3),'b',t,x(:,8),'--',t,x(:,2),'r','linewidth',1);
legend('x2d','x2 trans','x2 estimation','x2');
xlabel('time(s)');
ylabel('x2(rad)');
 
figure(2);
subplot(211);
plot(t,q(:,5),'k',t,q(:,1),'r',t,Q1(:,1),'b',t,q(:,5)-q(:,1),'--','linewidth',1);
legend('q1d','q1','Q1','error of q1');
xlabel('time(s)');
ylabel('q1(rad)');
subplot(212);
plot(t,q(:,6),'k',t,q(:,3),'r',t,Q2(:,1),'b',t,q(:,6)-q(:,3),'--','linewidth',1);
legend('q2d','q2','Q2','error of q2');
xlabel('time(s)');
ylabel('q2(rad)');


figure(3);
subplot(211);
plot(t,x(:,11),'k',t,x(:,6),'r',t,Trans(:,2),'b',t,x(:,11)-x(:,6),'--','linewidth',1);
legend('dx1','dx1 esti','dx1 trans','esti error of dx1');
xlabel('time(s)');
ylabel('dx1(rad/s)');
subplot(212);
plot(t,x(:,12),'k',t,x(:,9),'r',t,Trans(:,4),'b',t,x(:,12)-x(:,9),'--','linewidth',1);
legend('dx2','dx2 esti','dx2 trans','esti error of q2');
xlabel('time(s)');
ylabel('dx2(rad/s)');

figure(4)
subplot(211);
plot(t,T(:,1),'k','linewidth',1);
legend('T1');
xlabel('time(s)');
ylabel('T1(Nm)');
subplot(212);
plot(t,T(:,2),'k','linewidth',1);
legend('T2');
xlabel('time(s)');
ylabel('T2(Nm)');

figure(5)
subplot(211);
plot(t,x(:,7),'k','linewidth',1);
legend('disturbance1');
xlabel('time(s)');
ylabel('disturbance1');
subplot(212);
plot(t,x(:,10),'k','linewidth',1);
legend('disturbance2');
xlabel('time(s)');
ylabel('disturbance2');


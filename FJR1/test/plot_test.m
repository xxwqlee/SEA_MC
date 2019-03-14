close all

sim('SEAtest',2);
figure(1)
plot(tout,Q(:,1),'k',tout,q(:,2),'--',tout,q(:,1),'r','linewidth',1);
legend('Q1','q1');
xlabel('time(s)');
ylabel('Q(rad)');

figure(2);
% subplot(211);
plot(tout,Q(:,2),'k',tout,q(:,4),'--',tout,q(:,3),'r','linewidth',1);
legend('q1','q2');
xlabel('time(s)');
ylabel('q(rad)');


clear all
close all

%c(1)is X and c(2) is Y c(3) is Z
trange=[0,25];
c0=[0,0,0];

%S is 0.02
[t,c]=ode45(@dcdtdS0_2,trange,c0);
X=c(:,1);
Y=c(:,2);
Z=c(:,3);
figure; plot(t,[X,Y,Z]);xlabel('t');ylabel('X Y or Z');title('S=0.02');
legend('X','Y','Z')

%S is 10
[t,c]=ode45(@dcdtdS10,trange,c0);
X=c(:,1);
Y=c(:,2);
Z=c(:,3);
figure; plot(t,[X,Y,Z]);xlabel('t');ylabel('X Y or Z');title('S=10');
legend('X','Y','Z')

%S is 10^5
[t,c]=ode45(@dcdtdS105,trange,c0);
X=c(:,1);
Y=c(:,2);
Z=c(:,3);
figure; plot(t,[X,Y,Z]);xlabel('t');ylabel('X Y or Z');title('S=10^5');
legend('X','Y','Z')

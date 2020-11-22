clear all;
clc;

pbar=[0;0];
Gp=10000*eye(2);
y=[0.38;3.25;4.97;-0.26];
t=[1;2;3;7];

C=[1 -cos(t(1));1 -cos(t(2));1 -cos(t(3));1 -cos(t(4))];
Gbeta=0.01*eye(4);
ytilde=y-C*pbar;
Gy=C*Gp*C'+Gbeta;
K=Gp*C'*inv(Gy);
phat=pbar+K*ytilde;
Geps=Gp-K*C*Gp;

t1=0:0.01:10;
x1=phat(1)*t1-phat(2)*sin(t1);
y1=phat(1)   -phat(2)*cos(t1);
plot(x1,y1,'blue');

figure(2)
plot(t1,y1,'blue');hold on;
plot(t,y,'ored');













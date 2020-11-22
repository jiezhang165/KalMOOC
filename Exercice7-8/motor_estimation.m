clear all;
clc;

xbar=[1;-1];
Gx=[4 0;0 4];
C=[4 0;10 1;10 5;13 5;15 3];
y=[5;10;8;14;17];
Gbeta=9*eye(5);
ytilde=y-C*xbar;
Gy=C*Gx*C'+Gbeta;
K=Gx*C'*inv(Gy);
xhat=xbar+K*ytilde;
Geps=Gx-K*C*Gx;
yhat=C*xhat;
r=y-yhat;
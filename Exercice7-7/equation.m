clear all;
clc;

y=[8;7;0];
C=[2,3;3,2;1,-1];
xbar=[0;0];
Gx=10000*eye(2,2);
ybar=C*xbar;
ytilde=y-C*xbar;
Gbeta=[1 0 0;0 4 0;0 0 4];
Gy=C*Gx*C'+Gbeta;
K=Gx*C'*inv(Gy);
xhat=xbar+K*ytilde;
Geps=Gx-K*C*Gx;
yhat=C*xhat;
r=y-yhat;


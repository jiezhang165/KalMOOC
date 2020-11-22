clear all;
close all;
clc;

Galpha = zeros(2,2);
A = eye(2,2);
C0 = [2,3]; u = 0; y0 = 8;
xhat0=[0;0]; Gx0=1000*eye(2,2);
Gbeta1 = 1;
draw_ellipse(xhat0,Gx0,0.9,'red',2);
hold on;
[xhat1,Gx1] = kalman(xhat0,Gx0,u,y0,Galpha,Gbeta1,A,C0);
draw_ellipse(xhat1,Gx1,0.9,'blue',2);
C1 = [3,2]; y1 = 7;
Gbeta2 = 4;
[xhat2,Gx2] = kalman(xhat1,Gx1,u,y1,Galpha,Gbeta2,A,C1);
draw_ellipse(xhat2,Gx2,0.9,'green',2);
C2 = [1,-1]; y2 = 0;
Gbeta3 = 4;
[xhat3,Gx3] = kalman(xhat2,Gx2,u,y2,Galpha,Gbeta3,A,C2);
draw_ellipse(xhat3,Gx3,0.9,'black',2);

y = [8;7;0]; Gbeta = diag([1 4 4]);
C = [C0;C1;C2];
[xhat,Gx] = kalman(xhat0,Gx0,u,y,Galpha,Gbeta,A,C);
draw_ellipse(xhat,Gx,0.9,'magenta',2);




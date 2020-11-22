clear all;
close all;
clc;

A = eye(2,2);
C0 = [4 0]; C1 = [10 1]; C2 = [10 5]; 
C3 = [13 5]; C4 = [15 3];
y = [5;10;11;14;17];
C = [C0;C1;C2;C3;C4];
Galpha = zeros(2,2); Gbeta = 9;
u = zeros(2,1);
xhat=[1;-1];
Gx=4*eye(2,2);
draw_ellipse(xhat,Gx,0.9,'red',2); hold on;
for k=1:5
    [xhat,Gx]=kalman(xhat,Gx,u,y(k),Galpha,Gbeta,A,C(k,:));
    draw_ellipse(xhat,Gx,0.9,'blue',2); hold on;
end

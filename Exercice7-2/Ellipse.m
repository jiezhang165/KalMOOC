clear all;
clc;

A1=[1,0;0,3];
A2=[cos(pi/4),-sin(pi/4);sin(pi/4),cos(pi/4)];
G1=eye(2,2);
G2=3*G1;
G3=A1*G2*A1'+G1;
G4=A2*G3*A2';
G5=G3+G4;
G6=A2*G5*A2';
hold on;
axis([-15,15,-15,15]);
axis('square');
draw_ellipse([0;0],G1,0.9,'black',2);
draw_ellipse([0;0],G2,0.9,'green',2);
draw_ellipse([0;0],G3,0.9,'red',2);
draw_ellipse([0;0],G4,0.9,'yellow',2);
draw_ellipse([0;0],G5,0.9,'blue',2);
draw_ellipse([0;0],G6,0.9,'magenta',2);



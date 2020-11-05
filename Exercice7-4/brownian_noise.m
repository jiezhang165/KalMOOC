clear all;
clc;

hold on;
axis([0 100 -20 20]);
for i=1:100
    delta=0.001; % a varier
    [T,X,Y]=Simu(delta,1/sqrt(delta),100);
%    plot(T,X,'.black');
    plot(T,Y,'.red');
end


function [T,X,Y]=Simu(delta,sx,tmax)
T=0:delta:tmax;
kmax=length(T);
X=sx*randn(1,kmax);Y=zeros(1,length(X));
for k=1:kmax-1
    Y(k+1)=Y(k)+delta*X(k);
end
end




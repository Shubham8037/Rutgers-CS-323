%% LEAST SQUARE
function LeastS(file)
% clear all; clc
%% INPUTS
% fid = fopen('LeastS1.txt');
% fid = fopen('LeastS2.txt');
% fid = fopen('LeastS3.txt');
% fid = fopen('LeastS4.txt');
% fid = fopen('LeastS5.txt');
fid = fopen(file);
s = fscanf(fid,'%f');
fclose(fid);

n  = s(1);
d  = s(2);
x = []; y = [];
for i = 1:n
    x = [x s(2*i+1)];
    y = [y s(2*i+2)];
end
M = [10, sum(x), sum(x.^2), sum(x.^3);
sum(x), sum(x.^2), sum(x.^3), sum(x.^4);
sum(x.^2), sum(x.^3), sum(x.^4), sum(x.^5);
sum(x.^3), sum(x.^4), sum(x.^5), sum(x.^6)];
b = [sum(y);sum(y.*x);sum(y.*(x.^2));sum(y.*(x.^3))];
a = inv(M)*b;
%% OUTPUT
fprintf('Coefficients of polynomial:');
fprintf('\n%f %f %f %f %f. \n',a(1),a(2),a(3),a(4));
%% PLOT
xx=[0:0.1:9];
yy=a(1) + a(2)*xx + a(3)*xx.^2 + a(4)*xx.^3;
plot(xx,yy,'-k',x,y,'*r');
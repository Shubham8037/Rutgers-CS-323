%% CUBIC SPLINE CODE
% Inputs: No. of points(n), Points(xi,yi)
% Outputs: coefficients of all the 3rd degree poly.(S0(x),S1(x)...Sn(x))
function Spline(file)
% clear all; close all; clc
%% INPUTS
% fid = fopen('Spline1.txt');         % Test case-1
% fid = fopen('Spline2.txt');       % Test case-2
% fid = fopen('Spline3.txt');       % Test case-3
% fid = fopen('Spline4.txt');       % Test case-4
% fid = fopen('Spline5.txt');       % Test case-5
fid = fopen(file);
s = fscanf(fid,'%f');
fclose(fid);

n  = s(1);
x = []; y = [];
for i = 1:n
    x = [x s(2*i)];
    y = [y s(2*i+1)];
end
%% COMPUTING POLYNOMIAL COEFFICIENTS
%Si(x) = ai + bi*(x - xi) + ci*(x - xi)^2 + di*(x - xi)^3
% a = [];
for i = 1:n
    a(i) = y(i);
end
h = [];
for i = 1:n-1
    hi = x(i+1)-x(i);
    h = [h hi];
end
C = zeros(n,1);
% H-matrix & A-vector
H = zeros(n);  H(1,1) = 1; H(n,n) = 1;
A = zeros(n,1);
for i = 1:n
    for j = 1:n
        if (i > 1 && i < n) && (j == i)
            H(i,j-1) = h(i-1);
            H(i,j)   = 2*(h(i-1)+h(i));
            H(i,j+1) = h(i);
        end
    end
    if (i > 1 && i < n)
        A(i) = 3*(a(i+1)-a(i))/h(i) - 3*(a(i)-a(i-1))/h(i-1);
    end
end
C = inv(H)*A;

B = zeros(n,1);
for i = 1:n-1
    B(i) = ((a(i+1) - a(i))/h(i)) - (2*C(i) + C(i+1))*h(i)/3;
end
D = zeros(n,1);
for i = 1:n-1
    D(i) = (C(i+1)-C(i))/(3*h(i));
end
%% OUTPUT
fprintf('Coefficients of n-1 polynomials. \n');
for i = 1:n-1
    fprintf('\n%f %f %f %f %f. \n',a(i),B(i),C(i),D(i));
end
%% PLOTS
plot(x,y,'o','MarkerFaceColor','r'); hold on; grid on;
for i = 1:n-1
    xx = linspace(x(i),x(i+1),10);
    y = [];
    for j = 1:numel(xx)
        y = [y a(i) + B(i)*(xx(j) - x(i)) + C(i)*(xx(j) - x(i))^2 + D(i)*(xx(j) - x(i))^3];
    end
    plot(xx,y,'color',rand(1,3));
end
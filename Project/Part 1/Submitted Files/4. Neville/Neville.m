%% NEVILLE'S METHOD
% Inputs: n, xk,yk,x0
% Outputs: Pn_x0
function Neville(file)
% clear all; clc
% n = 2;
% xk,yk = [(-1, 1), (0, 0), (1, 1)]
% x0 = 0.5;
%% INPUTS
% fid = fopen('Neville1.txt');
% fid = fopen('Neville2.txt');
% fid = fopen('Neville3.txt');
% fid = fopen('Neville4.txt');
% fid = fopen('Neville5.txt');
fid = fopen(file);
s = fscanf(fid,'%f');
fclose(fid);

n  = s(1);
x0 = s(numel(s));
x = []; y = [];
for i = 1:n+1
    x = [x s(2*i)];
    y = [y s(2*i+1)];
end
%% COMPUTATION OF Pn_x0
P = zeros(n+1);
for k = 1:n+1
    P(k,k) = y(k);
end
for d = 1:n
    for i = 1:n-d+1
        j = i + d;
        P(i,j) = ((x0 - x(i))*P(i+1,j) - (x0 - x(j))*P(i,j-1))/(x(j) - x(i));
    end
end
Pn_x0 = P(1,n+1);
%% OUTPUT
fprintf('P(%f) = %f\n',x0,Pn_x0);
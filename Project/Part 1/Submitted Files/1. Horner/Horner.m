%% HORNER PROGRAM
% Inputs: degree(n), coeff.(a0,a1..an), x0
% Outputs: P(x0), P'(x0)
function Horner(file)
% clear all; clc
% P(x) = 2 + 3*x - x^2 + 2*x^3;
% P'(x)= 3 - 2*x + 6*x^2
% n = 3;
% a = [2 3 -1 2];
% x0 = 3.5;
%% INPUTS
% fid = fopen('Horner1.txt');
% fid = fopen('Horner2.txt');
% fid = fopen('Horner3.txt');
% fid = fopen('Horner4.txt');
% fid = fopen('Horner5.txt');
fid = fopen(file);
s = fscanf(fid,'%f');
fclose(fid);

n  = s(1);
x0 = s(numel(s));
a  = s(2:numel(s)-1);
%% COMPUTATION OF P(x0),P'(x0)
alpha = a(n+1);
beta  = a(n+1);
for i = n:-1:1
    alpha = alpha*x0 + a(i);
    if i~=1
        beta  = beta*x0 + alpha;
    end
end
%% OUTPUT
fprintf('P(x0) = %f',alpha);
fprintf('\nP''(x0) = %f\n',beta);
%% VERIFICATION
% x = x0;
% Px  = 2 + 3*x - x^2 + 2*x^3
% Px1 = 3 - 2*x + 6*x^2
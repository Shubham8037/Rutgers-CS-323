%% NEWTON RAPHSON WITH HORNER PROGRAM
% Inputs: degree(n), coeff.(a0,a1..an), x0, error tolerance(eps), max no. of iterations(N)
% Outputs: root(x)
function NHorner(file)
% clear all; clc
% P(x) = 2 + 3*x - x^2 + 2*x^3;
% P'(x)= 3 - 2*x + 6*x^2
% n = 3;
% a = [2 3 -1 2];
% x0 = 3.5;
% eps = 1e-5;
% N = 20;
%% INPUTS
% fid = fopen('NHorner1.txt');     % Opening file
% fid = fopen('NHorner2.txt');     % Opening file
% fid = fopen('NHorner3.txt');     % Opening file
% fid = fopen('NHorner4.txt');     % Opening file
% fid = fopen('NHorner5.txt');     % Opening file
fid = fopen(file);
s = fscanf(fid,'%f');           % Reading data from file
fclose(fid);                    % Closing file

n  = s(1);                      % degree
x0 = s(numel(s)-2);             % x0
N = s(numel(s));                % max no. of iterations
eps = s(numel(s)-1);            % error tolerance
a  = s(2:numel(s)-3);           % coeff. of polynomial
%% COMPUTATION OF ROOT OF P(X)
flag = 0;
for i = 1:N                     % Newton-Raphson loop
    alpha = a(n+1);             % Horner
    beta  = a(n+1);
    for i = n:-1:1
        alpha = alpha*x0 + a(i);
        if i~=1
            beta  = beta*x0 + alpha;
        end
    end
    x1 = x0 - alpha/beta;       % x1 computed
    err = abs(x1-x0);           % error computed
    if err > eps
        x0 = x1;                % updating x0 with x1 for next iteration
    else
        flag = 1;               % flag set to 1 when solution found within error tolerance
        break                   % exit loop
    end
end
%% OUTPUT
if flag == 1
    fprintf('Root of P(x) is %f\n',x1);
else
    fprintf('Solution was not found');
end
%% VERIFICATION
% x = x0;
% Px  = 2 + 3*x - x^2 + 2*x^3
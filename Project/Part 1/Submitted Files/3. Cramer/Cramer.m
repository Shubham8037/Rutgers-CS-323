%% CRAMER'S RULE
% Inputs: size(n), elements of Matrix-A and Vector B 
% Outputs: Determinants(A,A1,A2,A3),x1,x2,x3
function Cramer(file)
% clear all; clc
% n = 3;                        % size(n)                
% A = [3 4 2; -1 3 -4; 2 2 5];  % Matrix A
% b = [5 2 -6]';                % Vector B
%% INPUTS
% fid = fopen('Cramer1.txt');     % Opening file
% fid = fopen('Cramer2.txt');     % Opening file
% fid = fopen('Cramer3.txt');     % Opening file
% fid = fopen('Cramer4.txt');     % Opening file
% fid = fopen('Cramer5.txt');     % Opening file
fid = fopen(file);              % Opening file
s = fscanf(fid,'%f');           % Reading data from file
fclose(fid);                    % Closing file

n = s(1);                       % size(n)
A = [];
k = 2;
for i = 1:n                     % Loop defining Matrix-A
    for j = 1:n
        A(i,j) = s(k);
        k = k + 1;
    end
end
b = [];
for i = 1:n                     % Loop defining Vector-B
    b(i) = s(k);
    k = k + 1;
end
b = b';
%% SOLVING THE MATRIX USING CRAMER'S RULE
k1 = Dett(A);           % Determinant of A using function Dett
Ai = [];                % Matrix Ai
x = [];                 % Solution xi
for i = 1:n
    AA = A;
    AA(:,i) = b;
    Ai = [Ai Dett(AA)];
    x  = [x Dett(AA)/k1];
end
%% PRINT OUTPUT TO SCREEN
fprintf('Determinant A = %f',k1);
fprintf('\nDeterminant A1 = %f',Ai(1));
fprintf('\nDeterminant A2 = %f',Ai(2));
fprintf('\nDeterminant A3 = %f',Ai(3));
fprintf('\n x1 = %f',x(1));
fprintf('\n x2 = %f',x(2));
fprintf('\n x3 = %f\n',x(3));
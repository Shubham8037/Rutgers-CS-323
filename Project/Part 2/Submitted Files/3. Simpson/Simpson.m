%% SIMPSON'S RULE
function Simpson(file)
% clear all; clc
%% INPUTS
% fid = fopen('Simpson1.txt');
% fid = fopen('Simpson2.txt');
% fid = fopen('Simpson3.txt');
% fid = fopen('Simpson4.txt');
% fid = fopen('Simpson5.txt');
fid = fopen(file);
tline = fgetl(fid);
i = 1;
syms x;
while ischar(tline)
    if i ==1, 
        %F = sym(tline);     % y(x) = x^3;
        F = str2sym(tline);
    elseif i ==2, 
        a = tline;          % a = 1;
    elseif i ==3, 
        b = tline;          % b = 5
    else
        n = tline;          % n = 20
    end
    tline = fgetl(fid);
    i = i+1;
end
fclose(fid);
a = str2num(a);
b = str2num(b);
n = str2num(n);

k = n/2;
h = (b-a)/n;
x = [];
for j = 1:n+1
    x(j) = a + h*(j-1);
end
y = double(subs(F));

I = 0;
for k = 1:10
    I = I + h/3*(y(2*k-1) + 4*y(2*k) + y(2*k+1));
end
%% OUTPUT
fprintf('The approx. value of the polynomial is %f\n',I);
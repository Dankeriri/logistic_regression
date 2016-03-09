function out = fir_o_der(beta,x,y)
% this function is a middle step for logi_reg
% to calculate the first derivate of likelihood
% Jingchang Liu
% 2016/3/8

% initialization
p_1 = @(beta,x)(exp(beta'*x)/(1+exp(beta'*x)));
temp = size(x);
n = temp(1);
m = temp(2);
out = zeros(n,1);

for p = 1:m
    out = out + x(:,p)*(y(p)-p_1(beta,x(:,p)));
end

out = -out;
end


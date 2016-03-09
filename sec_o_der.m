function out = sec_o_der(beta,x)
% this function is a middle step for logi_reg
% to calculate the second derivate of likelihood
% Jingchang Liu
% 2016/3/8

% initialization
p_1 = @(beta,x)(exp(beta'*x)/(1+exp(beta'*x)));
temp = size(x);
n = temp(1);
m = temp(2);
out = zeros(n,n);

for p = 1:m
    out = out + x*x'*p_1(beta,x(:,p))*(1-p_1(beta,x(:,p)));
end

end


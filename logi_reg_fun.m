function beta = logi_reg_fun(path,m,n)
% this fun is to get the result of logi_reg(beta)
% 'path' is string and represent the path and name of data
% m: which row to read data
% n: which col to read data
% Liu JingChang
% 2016/3/8

% get data
data = csvread(path,m,n);
y = data(:,end-1)';
x = [data(:,[1:end-1])';ones(1,length(y))];

% initialization
beta = input('please enter the initial beta: ');
diff = 2;

% iterate to get the numberic beta
while(diff > 0.001)
    temp = sec_o_der(beta,x);
    diff = inv(temp)*fir_o_der(beta,x,y);
    beta = beta - diff;
    diff = sum(abs(diff))
end
end


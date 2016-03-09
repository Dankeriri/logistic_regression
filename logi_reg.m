% Jingchang_Liu
% 2016/3/8/
% a realization of logistic regression

% get the data
data = csvread('E:\Users\Matlab\watermelon_3.0_alpha.csv',1,1);
y = data(:,end-1)';
x = [data(:,[1:end-1])';ones(1,length(y))];

% initialization
beta = [0,0,1]';
epsonal = 0.001;
diff = 2;

% iterate to get the numberic beta
while(diff > epsonal)
    diff = inv(sec_o_der(beta,x))*fir_o_der(beta,x,y);
    beta = beta - diff;
    diff = sum(abs(diff));
end

fprintf('The result of beta is: ')
beta

% plot the figure
t = -1:0.02:1;
[x_new,y_new] = meshgrid(t);
z = 1./(1+exp(-(beta(1)*x_new+beta(2)*y_new+beta(3))));
surf(x_new,y_new,z)

hold on
% plot the halve surface
z2 = 0.5*ones(length(t),length(t));
surf(x_new,y_new,z2)
axis equal

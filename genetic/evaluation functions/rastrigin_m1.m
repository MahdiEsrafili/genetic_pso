function y = rastrigin_m1(x)
input_dim= size(x);
input_dim = input_dim(2);
sum1 = x*x';
sum2 = sum(cos(2*pi*x));
y = 10*input_dim + sum1 - 10*sum2;
end
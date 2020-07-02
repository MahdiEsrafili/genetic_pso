function y = griewank(x)
    input_dim = size(x);
    input_dim = input_dim(2);
    sum1 = (x*x')/4000;
    i = [1:input_dim];
    sum2 = prod(cos(x./sqrt(i)));
    y = sum1 - sum2 +1;
end
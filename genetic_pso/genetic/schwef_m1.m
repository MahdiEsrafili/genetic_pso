function y = schwef_m1(x)
    input_dim = size(x);
    input_dim = input_dim(2);
    x_sq = sqrt(abs(x));
    x_sin = sin(x_sq);
    y = 418.9829*input_dim - x*x_sin';
end
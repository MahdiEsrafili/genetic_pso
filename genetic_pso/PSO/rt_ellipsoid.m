function y = rt_ellipsoid(x)
    input_dim = size(x);
    input_dim = input_dim(2);
    temp = zeros(input_dim,1);
    for dim=1:input_dim
        temp(dim) = x(1:dim)*x(1:dim)';
    end
    y = sum(temp);
end
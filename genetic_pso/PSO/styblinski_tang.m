function y = styblinski_tang(x)
    input_dim = size(x);
    input_dim = input_dim(2);
    x= double(x);
    %for d=1:input_dim
       yy = double(sum(x.^4 -16*x.^2 + 5*x)); 
    %end
    y= double(0.5*yy);
end
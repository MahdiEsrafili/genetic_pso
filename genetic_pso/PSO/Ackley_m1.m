function y = Ackley_m1(x)
    dim = size(x);
    dim = dim(2);
    if ~isnan(x)
        y= double(-20 * exp(-0.2*sqrt((1/dim)*(x*x'))) - exp((1/dim)*(sum(cos(2*pi*x)))) + exp(1) + 20);
    else
        y = nan(1,dim);
    end
    
end
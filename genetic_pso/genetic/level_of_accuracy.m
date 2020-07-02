function y = level_of_accuracy (x,loa)
    input_size = size(x);
    input_size = input_size(1);
    y=zeros(size(loa));
    for i=1:input_size
        y = y + (x>=loa);
    end
end
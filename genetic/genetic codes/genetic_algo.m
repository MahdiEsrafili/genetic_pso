function [y,ev,nfe,time] = genetic_algo(dim,max_gen,ps,pm,pc,max_var,evaluation_function,opt_type)
 tic; %tic start a timer to measure the period of G-algorithm
%initialize population
x = (max_var(2)-max_var(1))*rand([ps dim]) + max_var(1);
%iterate for max_gen
nfe = double(0);

for gen=2:max_gen
    %cocn : cross over choice number
    cocn = uint32(ps*pc); 
    if mod(cocn,2)~=0 % if number of parents are odd, we make it even
        cocn = cocn -1;
    end
    pop_index = randperm(ps,cocn); %pop_index is mating pool. pop_index contain index of parents chosen for mating
    %temp = size(pop_index);
    child_array = zeros(cocn,dim);
    %cross over one by one. I cross over 2n+1 and 2*n+2
    for i=0:uint32(cocn/2)-1
        %cross over points creation . I use 2 point cross over
        co_point = randperm(dim,2); %co_point = cross over points
        co_point = sort(co_point);
        while abs(co_point(1)-co_point(2))==1 % if the selected gens are beside together, cross over doesnt happen.
            co_point = randperm(dim,2);
            co_point = sort(co_point);
        end
        child_array(2*i+1,1:co_point(1)) = x(pop_index(2*i+1),1:co_point(1)); % put the first part of parents into children
        child_array(2*i+2,1:co_point(1)) = x(pop_index(2*i+2),1:co_point(1));
        child_array(2*i+1,co_point(1)+1:co_point(2)-1) = x(pop_index(2*i+2),co_point(1)+1:co_point(2)-1); %put the middle part of parents into children 
        child_array(2*i+2,co_point(1)+1:co_point(2)-1) = x(pop_index(2*i+1),co_point(1)+1:co_point(2)-1);
        child_array(2*i+1,co_point(2):end) = x(pop_index(2*i+1),co_point(2):end); % put the last part of parents into last part of children
        child_array(2*i+2,co_point(2):end) = x(pop_index(2*i+2),co_point(2):end);
    end
    %mutation
    mutn = uint32(ps*pm); % mutn = mutation number
    mut_index = randperm(ps,uint32(mutn)); % index of parent selected for mutation
    for i = 1:mutn
        mut_gen= randperm(dim,1); % choose which gen to mutation
        muted_random = (max_var(2)-max_var(1))*rand(1) + max_var(1); % choose the number for mutation
        x(mut_index(i),mut_gen) = muted_random; % make mutation
    end
    %selection
    full_pop = cat(1,child_array,x); % first put all population(parent and childs and muteds) in one array
    temp2 = size(full_pop);
    evaluated_value = zeros(temp2(1),1); % initiate array to increase the speed of calculation
    for j=1:temp2(1)
       evaluated_value(j) = evaluation_function(full_pop(j,:));
       nfe = nfe +1;
    end
    if opt_type=="max" 
        [V,I] = sort(evaluated_value,'descend'); % V is the sorted values and I is the index 
    else
        [V,I] = sort(evaluated_value,'ascend'); % V is the sorted values and I is the index 
    end
    x_sorted = full_pop(I,:); % now the values are sorted. Next step is two choose popsize from them
    x = x_sorted(1:ps,:); % So here we put the best samples in size of ps to Next step
    %fprintf("gen %d,%d,%d\n",gen,temp2(1),nfe);
end
%select Best of all

y = x(1,:);
ev = V(1);
time= toc; %stop the timer and read its value
end
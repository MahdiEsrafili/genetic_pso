function [y,time,nfe,gbest_pos_hist,gbest_value_hist,std_hist] =  pso_algo(dim,pop_size,max_var,max_iter,fitness_func,c1,c2,w)
    tic; % initializing timer
    std_hist = nan(max_iter,dim); % to store std of particles
    gbest_value_hist = nan(max_iter,1); % to store value of global best
    gbest_pos_hist = nan(max_iter,dim); % to store position of global best
    
    nfe= 0;
    %first initialize position and velocity
    max_velocity = 0.1*max_var(2); % setting limit to max velocity
    min_velocity = 0.1*max_var(1);
   % c1 = 0.5;
   % c2 = 1.75;
   % w = 0.3;% 0<w<1 ; w=0.65
    wdamp = 1;
    position = (max_var(2)-max_var(1))*rand([pop_size dim]) + max_var(1); % initializing random particles
    velocity = (max_velocity - min_velocity)*rand([pop_size dim]) + min_velocity; % initializing velocity of particles randomly
    pbest_particle= position;
    pbest_value = nan(pop_size,1);
    for i=1:pop_size % find personal best of init particles
         pbest_value(i) = fitness_func(position(i,:));
    end
    %
    [gbest_value ,gbest_particle] = min(pbest_value); % finding init global best
    gbest_particle = position(gbest_particle,:); 
    for iteration = 1:max_iter
        for particle = 1:pop_size
          velocity(particle,:) = w*velocity(particle,:) + c1*abs(rand(1,dim)).*(pbest_particle(particle,:)-position(particle,:)) + c2*abs(rand(1,dim)).*(gbest_particle-position(particle,:)); 
          velocity(particle,:) = max(velocity(particle,:),min_velocity); %checking velocity limits
          velocity(particle,:) = min(velocity(particle,:),max_velocity);%checking velocity limits
          position(particle,:) = position(particle,:) + velocity(particle,:); %updating position of particle
          position(particle,:) = max(max_var(1),position(particle,:));%checking position limits
          position(particle,:) = min(max_var(2),position(particle,:));%checking position limits
        end
        for particle = 1:pop_size
            fit_value = fitness_func(position(particle,:)); %calculating evaluation value of particle
            nfe = nfe +1 ;
            if fit_value<pbest_value(particle) % checking and updating personal best of particles
               pbest_value(particle) = fit_value;
               pbest_particle(particle,:) = position(particle,:);
            end
        end
    
    
    %find global best
    [V, I] = min(pbest_value);
    [V2, I2] = min([V gbest_value]);
    if I2==1
        gbest_value = V2;
        gbest_particle = pbest_particle(I,:);
    end
    gbest_value_hist(iteration) = gbest_value;
    gbest_pos_hist(iteration,:) =gbest_particle;
    
    w = w*wdamp;
    %std calculation
    temp_std = std(position);
    std_hist(iteration,:) = temp_std;
    end
    y = gbest_value;
    time = toc; % stop timer and get time
    %plot(gbest_value_hist)
end
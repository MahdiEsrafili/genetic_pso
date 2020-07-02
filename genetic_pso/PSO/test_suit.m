% this code test pso algorithm for different functions
%pm = [0.00 0.1 0.15 0.2 0.25 0.3];
pm = linspace(0.01,0.9,10);
%pc = [0.7 0.8 0.9 0.95];
pc= linspace(0.1,0.99,10);
psize = [30 50 100 150 200];
max_iteration = [200 400 600 800 1000 1200 1400];
funs = {@Ackley_m1,@rastrigin_m1,@schwef_m1,@styblinski_tang,@rt_ellipsoid,@sphere_m1,@griewank};
funs_size = size(funs);
funs_size = funs_size(2);
ranges = [-5 5;-5.12 5.12;-500 500;-5 5;-65.536 65.536;-5.12 5.12;-600 600];
res = [0 0 0 -1566.6396 0 0 0];
pm_size = 10;
pc_size = 10;
psize_size = 7;
mgen_size = 7;
info_file = 'results4\info1.dat';
path_file = 'results4\path1.dat';
temp = zeros(10,3);
gbest_value_hist_temp = zeros(1000,1);
fn =1;
dims= [5 20 40 80 120 200 300 400];
%pc test
for funsi=6:6
    for dim = 1:8
        for psizei=1:1
            for iter=5:5
               % for pmi=3:3
                   % for pci=1:pc_size
                        gbest_value_hist_temp = zeros(1000,1);
                        for t=1:10
                            [y,time,nfe,gbest_pos_hist,gbest_value_hist,std_hist]= pso_algo(dims(dim),psize(psizei),ranges(funsi,:),max_iteration(iter),funs{funsi},1,2.25,0.6);
                            temp(t,:) =  [y,time,nfe];
                            gbest_value_hist_temp =gbest_value_hist_temp +  gbest_value_hist;
                        end
                        hj = mean(temp);
                        std_m = std(temp);
                        gbest_value_hist = gbest_value_hist_temp ./10 - res(funsi);
                        jh = [dims(dim) psize(psizei) max_iteration(iter) funsi (hj(1) - res(funsi)) hj(2) hj(3) std_m];
                        dlmwrite(info_file,jh,'delimiter',',','-append');
                        dlmwrite(path_file,gbest_value_hist,'delimiter',',','-append');       
                   % end
                %end
            end
        end
    end
end

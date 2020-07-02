%pm = [0.00 0.1 0.15 0.2 0.25 0.3];
pm = linspace(0.01,0.9,10);
%pc = [0.7 0.8 0.9 0.95];
pc= linspace(0.1,0.99,10);
psize = [20 50 80 110 140 170 200 550];
mgen = [100 200 300 400 500 600 700 1250];
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
hist_file = 'results4\hist1.dat';
temp = zeros(5,3);
fn =1;
dims = [5 20 40 80 120 200 300 400];
%pc test
for funsi=6:6
    for dim = 1:8
        for psizei=8:8
            for mgeni=8:8
                for pmi=3:3
                    for pci=8:8
                        hist = zeros(mgen(mgeni)-1,1);
                        for t=1:10
                            [y,ev,nfe,time,gbest_value_hist] = genetic_algo(dims(dim),mgen(mgeni),psize(psizei),pm(pmi),pc(pci),ranges(funsi,:),funs{funsi},"min");
                            temp(t,:) = [ev,nfe,time];
                            hist = gbest_value_hist  + hist;
                        end
                        hist = hist ./10;
                        std_m = std(temp);
                        hj = mean(temp);
                        jh = [dims(dim) mgen(mgeni) psize(psizei) pm(pmi) pc(pci) funsi (hj(1) - res(funsi)) hj(2) hj(3) std_m];
                        dlmwrite(info_file,jh,'delimiter',',','-append');
                       % dlmwrite(path_file,y,'delimiter',',','-append'); 
                        dlmwrite(hist_file,hist,'delimiter',',','-append'); 
                    end
                end
            end
        end
    end
end

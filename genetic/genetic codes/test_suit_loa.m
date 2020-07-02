%pm = [0.00 0.1 0.15 0.2 0.25 0.3];
pm = linspace(0.01,0.9,10);
%pc = [0.7 0.8 0.9 0.95];
pc= linspace(0.1,0.99,10);
psize = [450 500 550 600 650 700 750];
mgen = [1000 1100 1200 1250 1300 1400 1500];
funs = {@Ackley_m1,@rastrigin_m1,@schwef_m1,@styblinski_tang,@rt_ellipsoid,@sphere_m1,@griewank};
funs_size = size(funs);
funs_size = funs_size(2);
ranges = [-5 5;-5.12 5.12;-500 500;-5 5;-65.536 65.536;-5.12 5.12;-600 600];
res = [0 0 0 -1566.6396 0 0 0];
pm_size = 10;
pc_size = 10;
psize_size = 7;
mgen_size = 7;
info_file = 'ev_com\final_test_loa\info.dat';
path_file = 'ev_com\final_test_loa\path.dat';
temp = zeros(5,3);
fn =1;
%pc test
for funsi=1:funs_size
    for dim = 40:40
        for psizei=3:3
            for mgeni=4:4
                for pmi=3:3
                    for pci=8:8
                        for t=1:100
                            [y,ev,nfe,time] = genetic_algo(dim,mgen(mgeni),psize(psizei),pm(pmi),pc(pci),ranges(funsi,:),funs{funsi},"min");
                            %temp(t,:) = [ev,nfe,time];
                        %end
                        %hj = mean(temp);
                            jh = [dim mgen(mgeni) psize(psizei) pm(pmi) pc(pci) funsi (ev - res(funsi)) nfe time];
                            dlmwrite(info_file,jh,'delimiter',',','-append');
                            dlmwrite(path_file,y,'delimiter',',','-append'); 
                        end
                    end
                end
            end
        end
    end
end
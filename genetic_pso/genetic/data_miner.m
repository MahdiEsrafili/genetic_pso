close all;
funs = ["Ackley", "Rastrigin", "Schwefel", "Styblinski-tang","RH-Ellipsoid","Sphere", "Griewank"];
fun_size = size(funs);
fun_size = fun_size(2);
yls = ["Error","NFE","Times (seconds)"]; %DFA: distance from answer
yls_size = size(yls);
yls_size = yls_size(2);
M = dlmread('ev_com\final_test\info.dat');
%being true miner
msize = size(M);
msize = msize(1);
%Pc miner
path_pc = "ev_com\final_test\graphs\pc\";
path_pm = "ev_com\final_test\graphs\pm\";
for i=0:fun_size-1
    %info = M(i*100+11:i*100+20,[5 7 8 9]);
    info = M(i*10+1:i*10+10,[5 7 8 9]);
    xl = sprintf('Pc  (Pm=0.20, Max. Gen. = 1250, Pop. Size=550,Function=%s )',funs(i+1));
    for j=1:yls_size
        figure('Name',sprintf("Figure Pc Test %d.%d, %s,%s",i+1,j,yls(j),funs(i+1)));
        plot(info(1:end,1),info(1:end,j+1));
        xlabel(xl);
        ylabel(yls(j));  
        savefig(path_pc+sprintf("Figure Pc Test %d.%d, %s,%s.fig",i+1,j,yls(j),funs(i+1)));
    end
end
%Pm miner
for i =0:fun_size-1
    info2 = M(71+i*10:80+i*10,[4 7 8 9]);
    xl = sprintf('Pm  (Pc=0.79, Max. Gen. = 1250, Pop. Size=550,Function=%s )',funs(i+1));
    for j=1:yls_size
        figure('Name',sprintf("Figure Pm Test %d.%d, %s,%s",i+1,j,yls(j),funs(i+1)));
        plot(info2(1:end,1),info2(1:end,j+1));
        xlabel(xl);
        ylabel(yls(j)); 
        savefig(path_pm+sprintf("Figure Pc Test %d.%d, %s,%s.fig",i+1,j,yls(j),funs(i+1)));
    end
end


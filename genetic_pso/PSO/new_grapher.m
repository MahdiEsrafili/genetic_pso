close all;
funs = ["Ackley", "Rastrigin", "Schwefel", "Styblinski-tang","RH-Ellipsoid","Sphere", "Griewank"];
fun_size = size(funs);
fun_size = fun_size(2);
yls = ["Error","NFE","Times (seconds)"]; %DFA: distance from answer
yls_size = size(yls);
yls_size = yls_size(2);
M = dlmread('results3\path.dat');
%being true miner
msize = size(M);
msize = msize(1);
%Pc miner
graph_path = "results3\graphs\";

for funsi=0:fun_size-1
     xl = sprintf('Iteration  (C1=1, C2=2.25, W=0.6, Pop. Size=30,Function=%s )',funs(funsi+1));
   %error  grapher
   
    error = M((funsi)*1000+1:(funsi)*1000 +1000,1);
    figure('Name',sprintf("Figure%d, Error, %s",funsi+1,funs(funsi+1)));
    plot(1:1000,error);
    xlabel(xl);
    ylabel('Error'); 
    savefig(graph_path+sprintf("Figure%d, Error,%s.fig",funsi+1,funs(funsi+1)));
    saveas(gcf,graph_path+sprintf("Figure%d, Error,%s.png",funsi+1,funs(funsi+1)));
   %time grapher
   %nfe
end

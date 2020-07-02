close all;
funs = ["Ackley", "Rastrigin", "Schwefel", "Styblinski-tang","RH-Ellipsoid","Sphere", "Griewank"];
fun_size = size(funs);
fun_size = fun_size(2);
M = dlmread('ev_com\final_test_loa\info.dat');
errors = M(:,7);
%being true miner
msize = size(M);
msize = msize(1);
%Pc miner
path_loa = "ev_com\final_test_loa\graphs\loa\";
loa_arr = [0.001 0.005 0.01 0.05 0.1 0.5 1 2];
loa_arr_str = categorical(string({0.001,0.005,0.01,0.05,0.1,0.5,1,2}));
loa_arr_size = size(loa_arr);
loa_arr_size = loa_arr_size(2);
results = zeros(fun_size,loa_arr_size);
for funsi=0:fun_size-1
   temp_result = zeros(1,loa_arr_size);
    for num = 1:100
       temp1 = errors(funsi*100 + num)*ones(1,loa_arr_size);
       temp2 = temp1 <= loa_arr;
       temp_result = temp_result + temp2;
    end
   results(funsi+1 , :) = temp_result;
    figure('Name',sprintf("Figure Level of Accuracy, %s",funs(funsi+1)));
   bar(loa_arr_str,temp_result);
   xlabel(sprintf("Level of Accuracy  (Function=%s)",funs(funsi+1)));
   ylabel('Result<=Level of Accuracy');
   savefig(path_loa+sprintf("Figure%d Level of Accuracy, %s",funsi+1,funs(funsi+1)));

end
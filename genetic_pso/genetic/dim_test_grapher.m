M = dlmread('results4\hist1.dat');
graph_path = "results4\graphs\";
base = 1;
rate = 1248
dim5 = M(base:base+rate);
base = base+rate+1;
dim20 = M(base:base+rate);
base = base+rate+1;
dim40 = M(base:base+rate);
base = base+rate+1;
dim80 = M(base:base+rate);
base = base+rate+1;
dim120 = M(base:base+rate);
base = base+rate+1;
dim200 = M(base:base+rate);
base = base+rate+1;
dim300 = M(base:base+rate);
base = base+rate+1;
dim400 = M(base:base+rate);
base = base+rate+1;
figure('Name',sprintf("Figure12, Error,Genetic, %s",'Sphere'));
 xl = sprintf('Iteration  (Pm=0.20, Pc=0.79, Max. Gen. = 1250, Pop. Size=550,Function=Sphere )');

plot(dim5,'-.k','LineWidth',2);
hold on
plot(dim20,'--b','LineWidth',2);
plot(dim40,'--+r','LineWidth',2);
plot(dim80,'--*g','LineWidth',2);
plot(dim120,':b','LineWidth',2);
plot(dim200,':c','LineWidth',2);
plot(dim300,'-.o','LineWidth',2);
plot(dim400,'--x','LineWidth',2);
hold off
legend('dim=5','dim=20','dim=40','dim=80','dim=120','dim=200','dim=300','dim=400')
xlabel(xl);
ylabel('Error'); 
savefig(graph_path+sprintf("Figure12, Error,Genetic,Sphere.fig"));
saveas(gcf,graph_path+sprintf("Figure12, Error,Genetic,Sphere.png"));

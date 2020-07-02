M = dlmread('results4\path.dat');
graph_path = "results4\graphs\";
dim5 = M(1:1000);
dim20 = M(1001:2000);
dim40 = M(2001:3000);
dim80 = M(3001:4000);
dim120 = M(4001:5000);
dim200 = M(5001:6000);
dim300 = M(6001:7000);
dim400 = M(7001:8000);
figure('Name',sprintf("Figure10, Error,PSO, %s",'Sphere'));
xl = sprintf('Iteration  (C1=1, C2=2.25, W=0.6, Pop. Size=30,Function=Ackley )');

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
savefig(graph_path+sprintf("Figure10, Error,PSO,Ackley.fig"));
saveas(gcf,graph_path+sprintf("Figure10, Error,PSO,Ackley.png"));

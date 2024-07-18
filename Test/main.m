clear
clc



M = 100; % # of Chromosomes (candiate solution)

N = 100; % # of genes (variables)
MaxGen = 100;
Pc = 0.5; %Prob. of crossover
Pm = 0.01; 
Er =0.2;

obj =@Sphere;

[BestChrom] = GeneticAlgo(M, N, MaxGen, Pc, Pm, Er, obj)


%GA V 1.0.0
clear
clc

%this is controling parameter of the GA
M = 20; % # of Chromosomes (candiate solution)

N = 10; % # of genes (variables)
MaxGen =100
Pc = 0.5; %Prob. of crossover
Pm = 0.1; 
Er =0.1;

[population] = initialization(M, N);

for i = 1:M
    population.Chromosome(i).fitness = Sphere(population.Chromosome(i).Gene(:));
end


for k = 1 :2: M
    %selection
    [parent1, parent2] = selection(population);
    
    %crossover
  
    [child1, child2] = crossover(parent1, parent2, Pc, 'single');
    
    %mutation

    [child1] = mutation(child1, Pm);
    [child2] = mutation(child2, Pm);
    
    newPopulation.Chromosome(k).Gene = child1;
    newPopulation.Chromosome(k+1).Gene = child2;

end

%elitism

[newPopulation] = elitism(population, population,Er);
population = newPopulation %after these operations make result as population
%GA V 1.0.1
clear
clc

%this is controling parameter of the GA
M = 100; % # of Chromosomes (candiate solution)

N = 10; % # of genes (variables)
MaxGen = 10;
Pc = 0.85; %Prob. of crossover
Pm = 0.01; 
Er =0.3;

[population] = initialization(M, N);

g = 1;
disp(['Generation#',num2str(g)]);

%%Main Loop
for g = 2: MaxGen 
    disp(['Generation#',num2str(g)]);
    %Calc the fitness value
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
    
    [newPopulation] = elitism(population, Er);
    population = newPopulation; %after these operations make result as population

end
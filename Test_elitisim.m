% this file used for testing elitism before define elitism function
M = 10; % # of Chromosomes (candiate solution)

N = 10; % # of genes (variables)

for k = 1:M
    rand();
    population.Chromosome(k).Gene(:) = [round(rand()), round(rand()), round(rand()), round(rand()), round(rand()),round(rand()), round(rand()), round(rand()), round(rand()), round(rand())];
    population.Chromosome(k).fitness = Sphere(population.Chromosome(k).Gene(:));
end

for k = 1 :2: M
    %selection
    [parent1, parent2] = selection(population);
    
    %crossover
    Pc = 0.5; %Prob. of crossover
    [child1, child2] = crossover(parent1, parent2, Pc, 'single');

    %mutation
    Pm = 0.1; 
    [child1] = mutation(child1, Pm);
    [child2] = mutation(child2, Pm);

   
    newPopulation.Chromosome(k).Gene = child1.Gene;
    newPopulation.Chromosome(k+1).Gene = child2.Gene;

end
[newPopulation] = elitism(population);
Er = 0.2;
Elite_Num = round(N*Er);
[max_val, indx] = sort([population.Chromosome(:).fitness],'descend'); %Get elite from population

for k = 1 :Elite_Num

    newPopulation.Chromosome(k).Gene = population.Chromosome(indx(k)).Gene; %and put it in the new population
end
function [BestChrom] = GeneticAlgo(M, N, MaxGen, Pc, Pm, Er, obj)


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
[max_val, indx] = sort([population.Chromosome(:).fitness],'descend'); %Get elite from population
BestChrom.Gene = population.Chromosome(indx(1)).Gene; %and put it in the new population
BestChrom.fitness = population.Chromosome(indx(1)).fitness;

function [newPopulation] = elitism(population, Er)
    Elite_Num = round(length(population.Chromosome)*Er);
    [max_val, indx] = sort([population.Chromosome(:).fitness],'descend'); %Get elite from population

    for k = 1 :Elite_Num

        newPopulation.Chromosome(k).Gene = population.Chromosome(indx(k)).Gene; %and put it in the new population
        newPopulation.Chromosome(k).fitness = population.Chromosome(indx(k)).fitness;
    end
    for k = 1 + Elite_Num : length(population.Chromosome)

        newPopulation.Chromosome(k).Gene = population.Chromosome(k).Gene;
        newPopulation.Chromosome(k).fitness = population.Chromosome(k).fitness;
    end

end

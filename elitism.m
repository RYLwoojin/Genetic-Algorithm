function [newPopulation2] = elitism(population, newPopulation, Er)
    Elite_Num = round(length(population.Chromosome)*Er);
    [max_val, indx] = sort([population.Chromosome(:).fitness],'descend'); %Get elite from population

    for k = 1 :Elite_Num

        newPopulation2.Chromosome(k).Gene = population.Chromosome(indx(k)).Gene; %and put it in the new population
        newPopulation2.Chromosome(k).fitness = population.Chromosome(indx(k)).fitness;
    end
    for k = 1+Elite_Num : length(population.Chromosome)

        newPopulation2.Chromosome(k).Gene = newPopulation.Chromosome(indx(k)).Gene;
        newPopulation2.Chromosome(k).fitness = newPopulation.Chromosome(indx(k)).fitness;
    end

end

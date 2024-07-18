function[parent1, parent2] = selection(population)

M = length(population.Chromosome(:));

if any([population.Chromosome(:).fitness]<0)
%Fitness Scaling   f_scaled = a*f+b
    a = 1;
    b = min([population.Chromosome(:).fitness]);
    b = abs(b);
    scaled_fitness = a * [population.Chromosome(:).fitness] + b + 1; %+1 for prevent division by 0
    normalized_fitness = [scaled_fitness] ./ sum([scaled_fitness]);

else %no neg fitness value
    normalized_fitness = [population.Chromosome(:).fitness] ./ sum([population.Chromosome(:).fitness]);
end
[sorted_fitness_values, sorted_idx] = sort(normalized_fitness, 'descend');

for i = 1 : length(population.Chromosome)
    temp_population.Chromosome(i).Gene(:) = population.Chromosome(sorted_idx(i)).Gene;
    temp_population.Chromosome(i).fitness(:) = population.Chromosome(sorted_idx(i)).fitness;
    temp_population.Chromosome(i).normalized_fitness(:) = normalized_fitness(sorted_idx(i));
end


cumsum = zeros(1, M);

for i = 1:M
    for j = i:M
        cumsum(i) = cumsum(i) + temp_population.Chromosome(j).normalized_fitness;
    end
end


%Step 3: to select one of the individuals
R = rand();
for i =1:length(cumsum)
    if R<min(cumsum)
        parent1_idx = length(cumsum);
    else
        parent1_idx = find(cumsum<=R, 1)-1;
    end
end


parent2_idx = parent1_idx;
while parent2_idx == parent1_idx
    R = rand();
    for i =1:length(cumsum)
        if R>cumsum(i)
            parent2_idx = i-1;
            break;
        end
    end
end

parent1 = temp_population.Chromosome(parent1_idx);
parent2 = temp_population.Chromosome(parent2_idx);


end


fitness_value = [10, 100, 5.5, 34, 1000, 1, 200, 100, 150, 90]; %add semi-colon at the end let it does not print the value on command window


%Step 1: to normalized the fitness values

normalized_fitness_values = fitness_value./sum(fitness_value);

%Step 2: to sort the normalized fitness values
sorted_fitness_values = sort(normalized_fitness_values, 'descend');



cumsum = zeros(1,length(fitness_value));

for i = 1:length(fitness_value)
    for j = i:length(fitness_value)
        cumsum(i) = cumsum(i) + sorted_fitness_values(j);
    end
end


%Step 3: to select one of the individuals
R = rand();
for i =1:length(cumsum)
    if R>cumsum(i)
        Parent1 = i-1;
        break;
    end
end

R = rand();
for i =1:length(cumsum)
    if R>cumsum(i)
        Parent2 = i-1;
        break;
    end
end
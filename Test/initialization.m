function [population] = initialization(M, N)

for i = 1:M
    for j = 1: N
        population.Chromosome(i).Gene(j) = [round(rand())];
    end
end

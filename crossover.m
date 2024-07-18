function[child1, child2] = crossover(parent1, parent2, Pc, crossoverType)
    switch crossoverType
        case 'single'
            Gene_Num = length(parent1.Gene);

            %single-point crossover using for loops
            
            ub = Gene_Num-1; %upper bound
            lb = 1; %lower bound
            Crossover_P = round((ub-lb)*rand() + lb);
            
            
            
            
            Part1 = parent1.Gene(1:Crossover_P);
            Part2 = parent2.Gene(Crossover_P+1: Gene_Num);
            
            child1.Gene = [Part1, Part2];
            
            Part1 = parent2.Gene(1:Crossover_P);
            Part2 = parent1.Gene(Crossover_P+1: Gene_Num);
            
            child2.Gene = [Part1, Part2];
        case 'double'

            Gene_Num = length(parent1.Gene) ;

            % Double-point crossover using for loops
            
            ub = Gene_Num-1; %upper bound
            lb = 1;
            Crossover_P1 = round((ub-lb)*rand() + lb);
            
            Crossover_P2 = Crossover_P1;
            
            while Crossover_P2 == Crossover_P1
            
                Crossover_P2 = round((ub-lb)*rand() + lb);
            end
            
            if Crossover_P2 < Crossover_P1
                temp = Crossover_P2;
                Crossover_P2 = Crossover_P1;
                Crossover_P1 = temp;
            end
            Part1 = parent1.Gene(1:Crossover_P1);
            Part2 = parent2.Gene(Crossover_P1+1: Crossover_P2);
            Part3 = parent1.Gene(Crossover_P2+1:end);
            
            child1.Gene = [Part1, Part2,Part3];
            
            Part1 = parent2.Gene(1:Crossover_P1);
            Part2 = parent1.Gene(Crossover_P1+1: Crossover_P2);
            Part3 = parent2.Gene(Crossover_P2+1:end);
            
            child2.Gene = [Part1, Part2, Part3];
            
    %Crossover_P1
    %Crossover_P2

    end

    R1 = rand();
    if R1 <= Pc
        child1 = child1;
    else
        child1 = parent1;
    end

    R2 = rand();
    if R2 > Pc
        child2 = child2;
    else
        child2 = parent2;
    end
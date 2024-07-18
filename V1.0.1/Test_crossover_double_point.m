
Parent1 = [round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),]
Parent2 = [round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),]

Gene_Num = length(Parent1) ;

% Double-point crossover using for loops

ub = length(Parent1)-1; %upper bound
lb = 1;
Crossover_P1 = round((ub-lb)*rand() + lb);

Crossover_P2 = Crossover_P1;

while Crossover_P2 == Crossover_P1

    ub = length(Parent1)-1; %upper bound
    lb = 1;
    Crossover_P2 = round((ub-lb)*rand() + lb);
end

if Crossover_P2 < Crossover_P1
    temp = Crossover_P2;
    Crossover_P2 = Crossover_P1;
    Crossover_P1 = temp;
end
Part1 = Parent1(1:Crossover_P1);
Part2 = Parent2(Crossover_P1+1: Crossover_P2);
Part3 = Parent1(Crossover_P2+1:end);

Child1 = [Part1, Part2,Part3];

Part1 = Parent2(1:Crossover_P1);
Part2 = Parent1(Crossover_P1+1: Crossover_P2);
Part3 = Parent2(Crossover_P2+1:end);

Child2 = [Part1, Part2, Part3];


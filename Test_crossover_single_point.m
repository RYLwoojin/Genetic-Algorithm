
Parent1 = [round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),]
Parent2 = [round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),round(rand()),]

Gene_Num = length(Parent1) ;

%single-point crossover using for loops

ub = length(Parent1)-1; %upper bound
lb = 1;
Crossover_P = round((ub-lb)*rand() + lb);



% for i = 1: Crossover_P
%     Child1(i) = Parent1(i);
%     Child2(i) = Parent2(i);
% end
% 
% for i = Crossover_P + 1: Gene_Num
%     Child1(i) = Parent2(i);
%     Child2(i) = Parent1(i);
% end


%single-point crossover using vector operators (:)


Part1 = Parent1(1:Crossover_P);
Part2 = Parent2(Crossover_P+1: Gene_Num);

Child1 = [Part1, Part2];

Part1 = Parent2(1:Crossover_P);
Part2 = Parent1(Crossover_P+1: Gene_Num);

Child2 = [Part1, Part2];
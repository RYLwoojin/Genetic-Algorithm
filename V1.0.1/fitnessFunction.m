function [fitness_value] = fitnessFunction(X)
    % X=[5,10]이면 5는 X(1) 이고 10은 X(2)이다
    %[efficiency] = fitnessFunction(X) 하면 efficiency가 나온다
    
    num_blade = X(1);
    length_blades = X(2);
    fitness_value = (num_blade + length_blades)*12.3*pi;



end
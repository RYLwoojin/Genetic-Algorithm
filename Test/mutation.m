function [child] = mutation(child, Pm)
    Gene_Num = length(child.Gene);
    for k =1: Gene_Num
        R = rand();
        if R < Pm
            child.Gene(k) = ~child.Gene(k);
        end
    end
end
function [Data] = decision2(Data,Prob_cash,i)
    
if Data.activ(i) == 2
    
    bb = rand(1);
    if bb <= Prob_cash(1)
        Data.cash(i)=5;
    elseif bb>Prob_cash(1) && bb<=Prob_cash(2)
        Data.cash(i)=6;
    elseif bb>Prob_cash(2) && bb <= Prob_cash(3)
        Data.cash(i)=7;
    end
end
end

    
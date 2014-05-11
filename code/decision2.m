function [Data] = decision2(Data,Prob_menu,Prob_cash,i)


if Data.activ(i) == 1 
    
   aa = rand;
   
    if aa<=Prob_menu(1) ;
                Data.menu(i)=1;
    elseif aa>Prob_menu(1) && Prob_menu(2)>=aa
                Data.menu(i)=2; 
    elseif aa>Prob_menu(2) && Prob_menu(3)>=aa
                Data.menu(i)=3; 
    elseif aa>Prob_menu(3) && Prob_menu(4)>=aa
                Data.menu(i)=4; 
                
    end
    
elseif Data.activ(i) == 2
    
    bb = rand(1);
    if bb <= Prob_cash(1)
        Data.cash(i)=1;
    elseif bb>Prob_cash(1) && bb<=Prob_cash(2)
        Data.cash(i)=2;
    elseif bb>Prob_cash(2) && bb <= Prob_cash(3)
        Data.cash(i) =3;
    end
end
end

    
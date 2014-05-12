function [Data] = decision(Data,Prob_menu,Aktivagent)



if Data.activ(Aktivagent) == 1 
    
   aa = rand;
   
    if aa<=Prob_menu(1) ;
                Data.menu(Aktivagent)=1;
    elseif aa>Prob_menu(1) && Prob_menu(2)>=aa
                Data.menu(Aktivagent)=2; 
    elseif aa>Prob_menu(2) && Prob_menu(3)>=aa
                Data.menu(Aktivagent)=3; 
    elseif aa>Prob_menu(3) && Prob_menu(4)>=aa
                Data.menu(Aktivagent)=4; 
                
    end
end
end
 

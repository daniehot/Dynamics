function Data = decision(Data)
% Generates the chosen meal and therefore the queue the agent lines in.
% The meal's probability to be chosen is defined by an intervall
for i = 1:Data.N
    Data.meal(i) = rand;
    if Data.meal(i) >= 0 && Data.meal(i) < 0.3
        Data.meal(i) = 1; % Ell menu
    end
    
    if Data.meal(i) >= 0.3 && Data.meal(i) < 0.5
        Data.meal(i) = 2; % Menu classic
    end
    
    if Data.meal(i) >= 0.5 && Data.meal(i) < 0.6
        Data.meal(i) = 3; % vegi
    end
    
    if Data.meal(i) >= 0.6 && Data.meal(i) < 0.7
        Data.meal(i) = 4; % Pot and Spoon
    end
    
    
    if Data.meal(i) >= 0.7 && Data.meal(i) < 0.9
        Data.meal(i) = 5; % Pasta
    end
    
    if Data.meal(i) >= 0.9 && Data.meal(i) < 0.95
        Data.meal(i) = 6; % Ala carte
    end
    
    if Data.meal(i) >= 0.95 && Data.meal(i) < 1
        Data.meal(i) = 7; % salad
    end
end
 

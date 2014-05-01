function [Data] = wall(Data)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
wall = [0.3 0.4];
dmin = 0.05;
dist = [0.1 0.1];
for i = 1:Data.N
    if abs(Data.coord(i,1)-wall(1)) < dmin && abs(Data.coord(i,2)-wall(2) < dmin)
       Data.coord(i,1) = Data.coord(i,1) + dist(1);
       Data.coord(i,2) = Data.coord(i,2) + dist(2);
        
    end 
end

end


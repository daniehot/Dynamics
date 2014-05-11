function [Data] = Bewegung(Data,i,endpoint,b,a,cells)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here






   %% Zielvektor der Agents Normiert   
    if Data.activ(i)==1
          Rvektor(:,i)=endpoint(:,:,Data.menu(i))-transpose(Data.coord(i,:));
          vektor(:,i)=Rvektor(:,i)/norm(Rvektor(:,i));
          Winkel(i)=-atan(vektor(1,i)/vektor(2,i))
    elseif Data.activ(i)==2
        Rvektor(:,i)=endpoint(:,:,Data.cash(i))-transpose(Data.coord(i,:));
          vektor(:,i)=Rvektor(:,i)/norm(Rvektor(:,i));
          Winkel(i)=-atan(vektor(1,i)/vektor(2,i))
        
    end
    
     %% Freie Bewegung
    if    sum(sum(cells(Data.coord(i,1)-b-a:Data.coord(i,1)+b+a,Data.coord(i,2)-b-a:Data.coord(i,2)-b)))==0 && sum(sum(cells(Data.coord(i,1)-b-a:Data.coord(i,1)+b+a,Data.coord(i,2)+b:Data.coord(i,2)+b+a)))==0 && sum(sum(cells(Data.coord(i,1)-b-a:Data.coord(i,1)-b,Data.coord(i,2)-b:Data.coord(i,2)+b)))==0 && sum(sum(cells(Data.coord(i,1)+b:Data.coord(i,1)+b+a,Data.coord(i,2)-b:Data.coord(i,2)+b)))==0
        
        
        if Winkel(i)>=degtorad(-22.5) && Winkel(i)<=degtorad(22.5)
    Data.coord(i,1)=Data.coord(i,1)
    Data.coord(i,2)=Data.coord(i,2)+a
        elseif Winkel(i)>=degtorad(22.5) && Winkel(i)<=degtorad(67.5)
    Data.coord(i,1)=Data.coord(i,1)-a
    Data.coord(i,2)=Data.coord(i,2)+a
        elseif Winkel(i)>=degtorad(67.5) && Winkel(i)<=degtorad(112.5)
    Data.coord(i,1)=Data.coord(i,1)-a
    Data.coord(i,2)=Data.coord(i,2)
        elseif Winkel(i)>=degtorad(112.5) && Winkel(i)<=degtorad(157.5)
    Data.coord(i,1)=Data.coord(i,1)-a
    Data.coord(i,2)=Data.coord(i,2)-a
        elseif Winkel(i)>=degtorad(157.5) && Winkel(i)<=degtorad(202.5)
    Data.coord(i,1)=Data.coord(i,1)
    Data.coord(i,2)=Data.coord(i,2)-a
        elseif Winkel(i)<=degtorad(-22.5) && Winkel(i)>=degtorad(-67.5)
    Data.coord(i,1)=Data.coord(i,1)+a
    Data.coord(i,2)=Data.coord(i,2)+a
        elseif Winkel(i)<=degtorad(-67.5) && Winkel(i)>=degtorad(-112.5)
    Data.coord(i,1)=Data.coord(i,1)-a
    Data.coord(i,2)=Data.coord(i,2)
        elseif Winkel(i)<=degtorad(-112.5) && Winkel(i)>=degtorad(-157.5)
    Data.coord(i,1)=Data.coord(i,1)-a
    Data.coord(i,2)=Data.coord(i,2)-a
      elseif Winkel(i)<=degtorad(-157.5) && Winkel(i)>=degtorad(-202.5)
    Data.coord(i,1)=Data.coord(i,1)
    Data.coord(i,2)=Data.coord(i,2)-a
        end 
    end   
    xx(i)=0
    %% WAND
    if    sum(sum(cells(Data.coord(i,1)-b:Data.coord(i,1)+b,Data.coord(i,2)-b-a:Data.coord(i,2)-b)))>0 || sum(sum(cells(Data.coord(i,1)-b:Data.coord(i,1)+b,Data.coord(i,2)+b:Data.coord(i,2)+b+a)))>0 ||sum(sum(cells(Data.coord(i,1)-b-a:Data.coord(i,1)-b,Data.coord(i,2)-b:Data.coord(i,2)+b)))>0 || sum(sum(cells(Data.coord(i,1)+b:Data.coord(i,1)+b+a,Data.coord(i,2)-b:Data.coord(i,2)+b)))>0
        
        if sum(sum(cells(Data.coord(i,1)-b:Data.coord(i,1)+b,Data.coord(i,2)-b-a:Data.coord(i,2)-b)))>0
            n(i)=1
        elseif sum(sum(cells(Data.coord(i,1)-b:Data.coord(i,1)+b,Data.coord(i,2)+b:Data.coord(i,2)+b+a)))>0
            n(i)=2
        elseif sum(sum(cells(Data.coord(i,1)-b-a:Data.coord(i,1)-b,Data.coord(i,2)-b:Data.coord(i,2)+b)))>0
            n(i)=3
        elseif sum(sum(cells(Data.coord(i,1)+b:Data.coord(i,1)+b+a,Data.coord(i,2)-b:Data.coord(i,2)+b)))>0
            n(i)=4
        end
     
         
       if n(i)==1  
         if Winkel(i)>=degtorad(0) && Winkel(i)<=degtorad(180)
    Data.coord(i,1)=Data.coord(i,1)-a
    Data.coord(i,2)=Data.coord(i,2)+a
        elseif Winkel(i)>=degtorad(-180) && Winkel(i)<degtorad(0)
    Data.coord(i,1)=Data.coord(i,1)+a
    Data.coord(i,2)=Data.coord(i,2)+a
         end 
       end  
        
        
       if n(i)==2  
         if Winkel(i)>=degtorad(0) && Winkel(i)<=degtorad(180)
    Data.coord(i,1)=Data.coord(i,1)-a
    Data.coord(i,2)=Data.coord(i,2)-a
        elseif Winkel(i)>=degtorad(-180) && Winkel(i)<degtorad(0)
    Data.coord(i,1)=Data.coord(i,1)+a
    Data.coord(i,2)=Data.coord(i,2)-a
         end 
       end  
       
       if n(i)==3 
         if Winkel(i)<=degtorad(90) && Winkel(i)>=degtorad(-90)
    Data.coord(i,1)=Data.coord(i,1)+a
    Data.coord(i,2)=Data.coord(i,2)-a
        elseif Winkel(i)>=degtorad(90) && Winkel(i)<degtorad(-90)
    Data.coord(i,1)=Data.coord(i,1)+a
    Data.coord(i,2)=Data.coord(i,2)+a
         end 
       end
       if n(i)==4
         if Winkel(i)<=degtorad(90) && Winkel(i)>=degtorad(-90)
    Data.coord(i,1)=Data.coord(i,1)-a
    Data.coord(i,2)=Data.coord(i,2)-a
        elseif Winkel(i)>=degtorad(90) && Winkel(i)<degtorad(-90)
    Data.coord(i,1)=Data.coord(i,1)-a
    Data.coord(i,2)=Data.coord(i,2)+a
         end    
        
       end
        
       xx(i)=1
    end 
    
    
    %% ECKE
    if xx(i)==0
    if    sum(sum(cells(Data.coord(i,1)-b-a:Data.coord(i,1)-b,Data.coord(i,2)-b-a:Data.coord(i,2)-b)))>0 || sum(sum(cells(Data.coord(i,1)+b:Data.coord(i,1)+b+a,Data.coord(i,2)+b:Data.coord(i,2)+b+a)))>0 ||sum(sum(cells(Data.coord(i,1)-b-a:Data.coord(i,1)-b,Data.coord(i,2)+b:Data.coord(i,2)+b+a)))>0 || sum(sum(cells(Data.coord(i,1)+b:Data.coord(i,1)+b+a,Data.coord(i,2)-b:Data.coord(i,2)-b-a)))>0
        %obenlinks
        if sum(sum(cells(Data.coord(i,1)-b-a:Data.coord(i,1)-b,Data.coord(i,2)-b-a:Data.coord(i,2)-b)))>0
            n(i)=1
        %untenrechts
        elseif sum(sum(cells(Data.coord(i,1)+b:Data.coord(i,1)+b+a,Data.coord(i,2)+b:Data.coord(i,2)+b+a)))>0
            n(i)=2
        %obenrechts
        elseif sum(sum(cells(Data.coord(i,1)-b-a:Data.coord(i,1)-b,Data.coord(i,2)+b:Data.coord(i,2)+b+a)))>0
            n(i)=3
         %untenlinks
        elseif sum(sum(cells(Data.coord(i,1)+b:Data.coord(i,1)+b+a,Data.coord(i,2)-b:Data.coord(i,2)-b-a)))>0
              n(i)=4
        end
     
         
       if n(i)==1  
    Data.coord(i,1)=Data.coord(i,1)+a
    Data.coord(i,2)=Data.coord(i,2)+a
       elseif n(i)==2  
    Data.coord(i,1)=Data.coord(i,1)-a
    Data.coord(i,2)=Data.coord(i,2)-a
       elseif n(i)==3
    Data.coord(i,1)=Data.coord(i,1)+a
    Data.coord(i,2)=Data.coord(i,2)-a
        elseif n(i)==4
    Data.coord(i,1)=Data.coord(i,1)-a
    Data.coord(i,2)=Data.coord(i,2)+a
         end 
     
    end
    end

end


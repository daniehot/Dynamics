function [Data] = Bewegung(Data,i,endpoint,b,a,cells)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

g=1;




   %% Zielvektor der Agents Normiert   
    if Data.activ(i)==1 % Agent will zur Essensausgabe
          %Definition des Wegvektors abhöngig von dem gewählten Menu 
        Rvektor(:,i)=endpoint(:,:,Data.menu(i))-transpose(Data.coord(i,:));
          vektor(:,i)=Rvektor(:,i)/norm(Rvektor(:,i)); %Normiert
          Winkel(i)=-atan(vektor(1,i)/vektor(2,i)); %Winkel
    elseif Data.activ(i)==2 % Agent muss zahlen
        % Weg zur (zufällig) gewählten Kasse
        Rvektor(:,i)=endpoint(:,:,Data.cash(i))-transpose(Data.coord(i,:));
          vektor(:,i)=Rvektor(:,i)/norm(Rvektor(:,i));
          Winkel(i)=pi-atan(vektor(1,i)/vektor(2,i));
        
    end
     %%%%%%%%%%%%%%%%%%%%%%%%WANDODERECKE
     WANDFELDER=sum(sum(cells(Data.coord(i,1)-b:Data.coord(i,1)+b,Data.coord(i,2)-b-a:Data.coord(i,2)-b)))+sum(sum(cells(Data.coord(i,1)-b:Data.coord(i,1)+b,Data.coord(i,2)+b:Data.coord(i,2)+b+a)))+sum(sum(cells(Data.coord(i,1)-b-a:Data.coord(i,1)-b,Data.coord(i,2)-b:Data.coord(i,2)+b)))+ sum(sum(cells(Data.coord(i,1)+b:Data.coord(i,1)+b+a,Data.coord(i,2)-b:Data.coord(i,2)+b)));
     ECKENFELDER=sum(sum(cells(Data.coord(i,1)-b-a:Data.coord(i,1)-b,Data.coord(i,2)-b-a:Data.coord(i,2)-b)))+sum(sum(cells(Data.coord(i,1)+b:Data.coord(i,1)+b+a,Data.coord(i,2)+b:Data.coord(i,2)+b+a)))+sum(sum(cells(Data.coord(i,1)-b-a:Data.coord(i,1)-b,Data.coord(i,2)+b:Data.coord(i,2)+b+a)))+sum(sum(cells(Data.coord(i,1)+b:Data.coord(i,1)+b+a,Data.coord(i,2)-b:Data.coord(i,2)-b-a)));
     if WANDFELDER>=ECKENFELDER
        xx=1;
    elseif ECKENFELDER>WANDFELDER
        xx=0;
   
    end
     %% Freie Bewegung
     
     % überprüft zuerst ob alle Zellen in der Umgebung a frei sind. Fall
     % dies gilt macht der Agent einen Schritt in Richtung Enpunkt
    if    sum(sum(cells(Data.coord(i,1)-b-a:Data.coord(i,1)+b+a,Data.coord(i,2)-b-a:Data.coord(i,2)-b)))==0 && sum(sum(cells(Data.coord(i,1)-b-a:Data.coord(i,1)+b+a,Data.coord(i,2)+b:Data.coord(i,2)+b+a)))==0 && sum(sum(cells(Data.coord(i,1)-b-a:Data.coord(i,1)-b,Data.coord(i,2)-b:Data.coord(i,2)+b)))==0 && sum(sum(cells(Data.coord(i,1)+b:Data.coord(i,1)+b+a,Data.coord(i,2)-b:Data.coord(i,2)+b)))==0
        
        
        if Winkel(i)>=degtorad(-22.5) && Winkel(i)<=degtorad(22.5)
            %schritt nach rechts
    Data.coord(i,1)=Data.coord(i,1); 
    Data.coord(i,2)=Data.coord(i,2)+a;
        elseif Winkel(i)>=degtorad(22.5) && Winkel(i)<=degtorad(67.5)
            % oben rechts
    Data.coord(i,1)=Data.coord(i,1)-a;
    Data.coord(i,2)=Data.coord(i,2)+a;
        elseif Winkel(i)>=degtorad(67.5) && Winkel(i)<=degtorad(112.5)
            % oben
    Data.coord(i,1)=Data.coord(i,1)-a;
    Data.coord(i,2)=Data.coord(i,2);
        elseif Winkel(i)>=degtorad(112.5) && Winkel(i)<=degtorad(157.5)
            % oben links
    Data.coord(i,1)=Data.coord(i,1)-a;
    Data.coord(i,2)=Data.coord(i,2)-a;
        elseif Winkel(i)>=degtorad(157.5) && Winkel(i)<=degtorad(202.5)
            % links
    Data.coord(i,1)=Data.coord(i,1);
    Data.coord(i,2)=Data.coord(i,2)-a;
        elseif Winkel(i)<=degtorad(-22.5) && Winkel(i)>=degtorad(-67.5)
            % unten rechts
    Data.coord(i,1)=Data.coord(i,1)+a;
    Data.coord(i,2)=Data.coord(i,2)+a;
        elseif Winkel(i)<=degtorad(-67.5) && Winkel(i)>=degtorad(-112.5)
            % unten
    Data.coord(i,1)=Data.coord(i,1)+a;
    Data.coord(i,2)=Data.coord(i,2);
        elseif Winkel(i)<=degtorad(-112.5) && Winkel(i)>=degtorad(-157.5)
            % unten links
    Data.coord(i,1)=Data.coord(i,1)+a;
    Data.coord(i,2)=Data.coord(i,2)-a;
        end 
    end   
   
    
    %% WAND
    
    % Betrachtet die zellen Entlang -b - b des Agents. Falls eine diese den
    % Zustand 1 ist macht der Agent eine Bewegung von der Wand weg in Richtung 
    % seines Zielvektors
   
    if xx==1
    if    sum(sum(cells(Data.coord(i,1)-b:Data.coord(i,1)+b,Data.coord(i,2)-b-a:Data.coord(i,2)-b)))>0 || sum(sum(cells(Data.coord(i,1)-b:Data.coord(i,1)+b,Data.coord(i,2)+b:Data.coord(i,2)+b+a)))>0 ||sum(sum(cells(Data.coord(i,1)-b-a:Data.coord(i,1)-b,Data.coord(i,2)-b:Data.coord(i,2)+b)))>0 || sum(sum(cells(Data.coord(i,1)+b:Data.coord(i,1)+b+a,Data.coord(i,2)-b:Data.coord(i,2)+b)))>0
        % Überprüft wo die Wand sich befindet
        if sum(sum(cells(Data.coord(i,1)-b:Data.coord(i,1)+b,Data.coord(i,2)-b-a:Data.coord(i,2)-b)))>0
            n(i)=1; %links
        elseif sum(sum(cells(Data.coord(i,1)-b:Data.coord(i,1)+b,Data.coord(i,2)+b:Data.coord(i,2)+b+a)))>0
            n(i)=2; %rechts
        elseif sum(sum(cells(Data.coord(i,1)-b-a:Data.coord(i,1)-b,Data.coord(i,2)-b:Data.coord(i,2)+b)))>0
            n(i)=3; %oben
        elseif sum(sum(cells(Data.coord(i,1)+b:Data.coord(i,1)+b+a,Data.coord(i,2)-b:Data.coord(i,2)+b)))>0
            n(i)=4; %unten
        end
     
         
       if n(i)==1  %Wand ist links
           % Zielvektor zeigt in die obere Hälfte des Einheitskreises
         if Winkel(i)>=degtorad(0) && Winkel(i)<=degtorad(180)
             % Schritt nach oben rechts
    Data.coord(i,1)=Data.coord(i,1)-a-g;
    Data.coord(i,2)=Data.coord(i,2)+a+g;

          % Zielvektor nach unten
         elseif Winkel(i)>=degtorad(-180) && Winkel(i)<degtorad(0)
             % Unten rechts
    Data.coord(i,1)=Data.coord(i,1)+a+g;
    Data.coord(i,2)=Data.coord(i,2)+a+g;
         end 
       end  
        
        
       if n(i)==2  % Wand rechts
         if Winkel(i)>=degtorad(0) && Winkel(i)<=degtorad(180)
             %oben links
    Data.coord(i,1)=Data.coord(i,1)-a-g;
    Data.coord(i,2)=Data.coord(i,2)-a-g;
        elseif Winkel(i)>=degtorad(-180) && Winkel(i)<degtorad(0)
            % unten links
    Data.coord(i,1)=Data.coord(i,1)+a+g;
    Data.coord(i,2)=Data.coord(i,2)-a-g;
         end 
       end  
       
       if n(i)==3 % Wand oben
           % Vektor zeigt nach rechts
         if Winkel(i)<=degtorad(90) && Winkel(i)>=degtorad(-90)
             % Unten rechts
    Data.coord(i,1)=Data.coord(i,1)+a+g;
    Data.coord(i,2)=Data.coord(i,2)+a+g;
           % Vektor nach links
         elseif Winkel(i)>=degtorad(90) && Winkel(i)<degtorad(-90)
             % Unten links
    Data.coord(i,1)=Data.coord(i,1)+a+g;
    Data.coord(i,2)=Data.coord(i,2)-a-g;
         end 
       end
       % Wand unten
       if n(i)==4
           %Winkel rechts
         if Winkel(i)<=degtorad(90) && Winkel(i)>=degtorad(-90)
             %oben rechts
    Data.coord(i,1)=Data.coord(i,1)-a-g;
    Data.coord(i,2)=Data.coord(i,2)+a+g;
            % Winkel links           
        elseif Winkel(i)>=degtorad(90) && Winkel(i)<degtorad(-90)
            % oben links
    Data.coord(i,1)=Data.coord(i,1)-a-g;
    Data.coord(i,2)=Data.coord(i,2)-a-g;
         end    
        
       end
        
    end 
    end
    
    %% ECKE
    if xx==0
    if    sum(sum(cells(Data.coord(i,1)-b-a:Data.coord(i,1)-b,Data.coord(i,2)-b-a:Data.coord(i,2)-b)))>0 || sum(sum(cells(Data.coord(i,1)+b:Data.coord(i,1)+b+a,Data.coord(i,2)+b:Data.coord(i,2)+b+a)))>0 ||sum(sum(cells(Data.coord(i,1)-b-a:Data.coord(i,1)-b,Data.coord(i,2)+b:Data.coord(i,2)+b+a)))>0 || sum(sum(cells(Data.coord(i,1)+b:Data.coord(i,1)+b+a,Data.coord(i,2)-b:Data.coord(i,2)-b-a)))>0
        %obenlinks
        if sum(sum(cells(Data.coord(i,1)-b-a:Data.coord(i,1)-b,Data.coord(i,2)-b-a:Data.coord(i,2)-b)))>0
            n(i)=1;
        %untenrechts
        elseif sum(sum(cells(Data.coord(i,1)+b:Data.coord(i,1)+b+a,Data.coord(i,2)+b:Data.coord(i,2)+b+a)))>0
            n(i)=2;
        %obenrechts
        elseif sum(sum(cells(Data.coord(i,1)-b-a:Data.coord(i,1)-b,Data.coord(i,2)+b:Data.coord(i,2)+b+a)))>0
            n(i)=3;
         %untenlinks
        elseif sum(sum(cells(Data.coord(i,1)+b:Data.coord(i,1)+b+a,Data.coord(i,2)-b:Data.coord(i,2)-b-a)))>0
              n(i)=4;
        end
     
         
       if n(i)==1  % obenlinks
           % Schritt nach untenrechts
    Data.coord(i,1)=Data.coord(i,1)+a+g;
    Data.coord(i,2)=Data.coord(i,2)+a+g;
       elseif n(i)==2  % untenrechts
           % Schritt nach obenlinks
    Data.coord(i,1)=Data.coord(i,1)-a-g;
    Data.coord(i,2)=Data.coord(i,2)-a-g;
       elseif n(i)==3 % obenrechts
           % Schritt nach untenlicks
    Data.coord(i,1)=Data.coord(i,1)+a+g;
    Data.coord(i,2)=Data.coord(i,2)-a-g;
        elseif n(i)==4 % untenlinks
            % Schritt zu obenrechts
    Data.coord(i,1)=Data.coord(i,1)-a-g;
    Data.coord(i,2)=Data.coord(i,2)+a+g;
         end 
     
    end
    end
%% Rand
% überprüft ob sich die Agents zu nahe an bestimmten Rändern befinden und 
% und lässt diese von dem Rand davolaufen


if sum(sum(cells(Data.coord(i,1)-5:Data.coord(i,1)+5,Data.coord(i,2)-5:Data.coord(i,2)+5))) > 10
    
    if sum(sum(cells(Data.coord(i,1)-5:Data.coord(i,1)+5,Data.coord(i,2)+b:Data.coord(i,2)+5))) > 2
        q(i) = 1; % Wand rechts

    elseif sum(sum(cells(Data.coord(i,1)-5:Data.coord(i,1)-b,Data.coord(i,2)-5:Data.coord(i,2)+5))) > 2
        q(i) = 2; % Wand oben
     
    elseif sum(sum(cells(Data.coord(i,1)-5:Data.coord(i,1)+5,Data.coord(i,2)-5:Data.coord(i,2)-b))) > 2
        q(i) = 3; % Wand links
    end
    
    if q(i) == 1
        %Schritte nach links
       Data.coord(i,1) = Data.coord(i,1);
       Data.coord(i,2) = Data.coord(i,2)-2*a;
    
    elseif q(i) == 2
        %Schirtte nach unten
       Data.coord(i,1) = Data.coord(i,1)+2*a;
       Data.coord(i,2) = Data.coord(i,2);
       
    elseif q(i) == 3 
        %Schritte nach rechts
        Data.coord(i,1) = Data.coord(i,1);
        Data.coord(i,2) = Data.coord(i,2)+2*a;
        
    end
end

%% Blöder Eckpunkt

f = [80;80];
dist = transpose(Data.coord(i,:))-f;
if sqrt(dist(1)^2+dist(2)^2) <= 3
    
    Data.coord(i,1) = Data.coord(i,1);
    Data.coord(i,2) = Data.coord(i,2)+2*a;
end


        
    end
    


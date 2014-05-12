clear all  clc;

%%PARAMETER
Data.N=1800;

Prob_agentpertime=@(t) exp(t^2); % Funktion für die Wahrscheindlichkeit dass ein Agent kommt: Funktionswert zwischen 0 und 1 definiert auf 0-tend
Prob_menu = [0.3 0.5 0.8 1];
Prob_menu1=0.1;             % Wahrscheindlichekeit Menu 1 zu nehmen
Prob_menu2=0.2
Prob_menu3=0.6
Prob_menu4=1
Prob_cash = [0.2 0.7 1];
Prob_Cashnr1=0.3
Prob_Cashnr2=0.6
Prob_Cashnr3=1
Essensausgabebereich=10
tend=1;                     % Stunden 11:30-13:30 SChlusseinstellung 2
b=2;                         %Breite
a=2                      %Schritweite

dt= 0.0002777777;                % Sekunden

Data.number = (1:Data.N);
Data.coord=zeros(Data.N, 2);
Data.activ=zeros(Data.N,1) ;% active=0 not yet arrived, active=1 queueing, active=2 end 
Data.time=zeros(Data.N,1);
Data.menu=zeros(Data.N,1);
Data.cash=zeros(Data.N,1);



A = imread('grundrissplan2.jpg','jpg')/255;
%initialize the arrays
n=size(A,1);
m=size(A,2);
z = zeros(n,m);
cells=A;
cells(1:45,140:150)=1;
%how long for each case to stability or simple oscillators

%build an image and display it
imh = image(cat(3,cells));
set(imh, 'erasemode', 'none')
%axis equal
%axis tight

%index definition for cell update
x = 1:m;
y = 1:n;


startpoint= [180 ; 60];
endpoint(:,:,1)=[ 130; 130];    %Suppe
endpoint(:,:,2)=[150 ; 130];    %Pizza
endpoint(:,:,3)=[98;130];      %Menu1
endpoint(:,:,4)=[60;130];       %Spezial
endpoint(:,:,5)=[30;30];        %Cashnr1
endpoint(:,:,6)=[30;38];        %Cashnr2
endpoint(:,:,7)=[30;60];        %Cashnr3


for i=1:Data.N
Data.coord(i,1)=startpoint(1);
Data.coord(i,2)=startpoint(2);
end



Aktivagent=1;
t=0;
while t<=t+dt
  %% Die Agents kommen zu einer Prob_agentpertime Wahrscheinlichkeit pro zeitiiiteration hinein
    if Aktivagent <= Data.N     
        if Data.activ(Aktivagent)==1
            Aktivagent=Aktivagent+1;
        elseif rand(1)<=Prob_agentpertime(t)
        Data.activ(Aktivagent)=1;
    %% Decition Makeing
    for i = 1:Data.N
    [Data] = decision2(Data,Prob_menu,Prob_cash,i);
    end
        end;         
    end;
 
    
    %%%%%% Zellen aktuallisierung
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for i=min(find(Data.activ==1)):max(find(Data.activ==1));
        if Data.activ(i)==1
    cells(Data.coord(i,1)-b:Data.coord(i,1)+b,Data.coord(i,2)-b:Data.coord(i,2)+b)=0;
       [Data]=Bewegung(Data,i,endpoint,b,a,cells)  ;
    cells(Data.coord(i,1)-b:Data.coord(i,1)+b,Data.coord(i,2)-b:Data.coord(i,2)+b)=1;
        end
        
    end  
    for i=min(find(Data.activ==2)):max(find(Data.activ==2));
        if Data.activ(i)==2
    cells(Data.coord(i,1)-b:Data.coord(i,1)+b,Data.coord(i,2)-b:Data.coord(i,2)+b)=0;
       [Data]=Bewegung(Data,i,endpoint,b,a,cells)  ;
    cells(Data.coord(i,1)-b:Data.coord(i,1)+b,Data.coord(i,2)-b:Data.coord(i,2)+b)=1;
        end
        
    end
    

    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
   %% Essensabgabe
   if sum(Data.activ==1)>=1;
        for i=min(find(Data.activ==1)):min(find(Data.activ==1))+sum(Data.activ==1)-1;
         Abstand=transpose(Data.coord(i,:))-endpoint(:,:,Data.menu(i));
            if (Abstand(1)^2+Abstand(2)^2)^0.5<=Essensausgabebereich;
             Data.activ(i)=2;

            end; 
         end;
   end;
     
    
    
    
  %Graphische Darstellung
        
        %set(imh, 'cdata', cat(3,cells,z,z) )
        image(A)
        hold on
        plot(image(cells))
        
        %hold on
       %plot(c,r)
    pause(0.001)
   
    
    t=t+dt
end
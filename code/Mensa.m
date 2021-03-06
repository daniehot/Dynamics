clear all, clc;


Data.N=1000;
%% Agents
Data.number = (1:Data.N);
Data.coord=zeros(Data.N, 2);
Data.activ=zeros(Data.N,1) ;% active=0 not yet arrived, active=1 queueing, active=2 end 
Data.time=zeros(Data.N,1);

%Wall 

wall1 = [0.5 0.5];
wall2 = [0.5 0.6];
dmin = 0.05;
dist = [0.1 0.1];


startpoint= [0 ; 0];
endpoint= [1 ;1];
vektor=endpoint-startpoint;
dt=0.1;
tend=200;
e=0.1

for i=1:Data.N
Data.coord(i,1)=startpoint(1);
Data.coord(i,2)=startpoint(2);
end

loop=1;
for t=0:tend
    if loop <= Data.N
        Data.activ(loop)=1
    end
    
    for i=min(find(Data.activ==1)):min(find(Data.activ==1))+sum(Data.activ)-1
        Data.coord(i,1)=Data.coord(i,1)+vektor(1)*dt+0.1*rand(1);
        Data.coord(i,2)=Data.coord(i,2)+vektor(2)*dt+0.1*rand(1);
  
    if abs(Data.coord(i,1)-wall1(1)) < dmin || abs(Data.coord(i,2)-wall1(2)< dmin)
       Data.coord(i,1) = Data.coord(i,1) - dist(1);
       Data.coord(i,2) = Data.coord(i,2) - dist(2);
    end 
    
 
    end
    
    for i=1:Data.N
       if  Data.coord(i,1) >= endpoint(1) 
           Data.activ(i)=0;
       end
    end
    
   
    
    
    
   loop=loop+1
    t=t+dt
    
    
    
    pause(.3)
    plot(Data.coord(:,1),Data.coord(:,2),'*')
    rectangle('Position',[0.5 0.5 0.1 0.1])
    axis([startpoint(1) endpoint(1) startpoint(2) endpoint(2)])
end
 
    
    a=1
    if a==0
    Data.coordx(1)=Data.coordx(1)+dt*vektor(1);
    Data.coordy(1)=Data.coordy(1)+dt*vektor(2);
    Data.time(1)=t;
    
      
    if Data.coordx(1)==endpoint(1) && Data.coordy(1)==endpoint(2);
        Data.activ(1)=1;
    end
        
    
    t=t+dt;
    pause(0.1)
    
    plot(Data.coordx, Data.coordy,'*')
    rectangle('Position',[0.5 0.5 0.1 0.1]);
    axis([startpoint(1) endpoint(1) startpoint(2) endpoint(2)])
    end
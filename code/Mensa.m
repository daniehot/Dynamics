clear all, clc;

<<<<<<< HEAD
%% Agents
Data.N = 1; % number of people
Data.number = 1:Data.N; % assign a number to every person
Data.time = zeros(Data.N,1); % assign a time to every person
Data.coords=zeros(Data.N,2);
Data.activation=zeros(Data.N,1);

=======
Data.N=1

Data.number = (1:Data.N)
Data.coordx=zeros(Data.N, 1)
Data.coordy=zeros(Data.N,1)
Data.activ=zeros(Data.N,1)
Data.time=zeros(Data.N,1)


startpoint= [0 ; 0]
endpoint= [1 ;1]
vektor=endpoint-startpoint
dt=0.001

Data.coordx(1)=startpoint(1)
Data.coordy(1)=startpoint(2)
tend=100000

for t=0:tend
  
    Data.coordx(1)=Data.coordx(1)+dt*vektor(1)
    Data.coordy(1)=Data.coordy(1)+dt*vektor(2)
    Data.time(1)=t
    
      
    if Data.coordx(1)==endpoint(1) && Data.coordy(1)==endpoint(2)
        Data.activ(1)=1
    end
        
    
    t=t+dt
    pause(0.1)
    
    plot(Data.coordx, Data.coordy,'*')
    axis([startpoint(1) endpoint(1) startpoint(2) endpoint(2)])
    
    
end
>>>>>>> test

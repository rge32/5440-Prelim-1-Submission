clear all
close all

%Define Parameters 
    ax=3.9*10^(-2);     %value of alpha x
    bx=6.1;             %value of beta x
    zx= 1.3*10^(-5);    %value of zx
    nzx=2.32;           %value of nzx
    ay=4.3*10^(-3);     %value of alpha y
    by= 5.7;            %value of beta y
    xy= 7.9*10^(-4);    %value of xy
    nxy=2;              %value of nxy
    dely=1.05;          %value of delta y
    xz=12.0*10^(-2);    %value of xz
    yz=11.0*10^(-3);    %value of yz
    nxz=2;              %value of nxz
    nyz=2;              %value of nyz
    delz=1.04;          %value of delta y

% We first select an S value below the Hopf bifurcation Point
    S=0.05;
%Solve for the steady state Value
    syms X Y Z
    eqn1= 0==(ax+bx*S)/(1+S+(Z/zx)^nzx)-X;
    eqn2= 0==(ay+by*S)/(1+S+(X/xy)^nxy)-dely*Y;
    eqn3= 0==1/(1+(X/xz)^nxz+(Y/yz)^nyz)-delz*Z;
    %solve for steady state values
    [solX,solY,solZ] = vpasolve([eqn1,eqn2,eqn3],[X,Y,Z],[0 0 0]);
    ssX=double(solX);  
    ssY=double(solY);
    ssZ=double(solZ);
%Plot Z vs. time in 3 cells
%c(1)is X and c(2) is Y c(3) is Z
figure; hold on 
xlabel('t');ylabel('Z');

trange=[0,50];
%cell 1
    c1=[ssX,ssY,ssZ];
    [t,c]=ode45(@dcdt,trange,c1);
    Zcalc1=c(:,3);
    plot(t,Zcalc1);
%cell 2    
    c2=1.25.*c1;
    [t,c]=ode45(@dcdt,trange,c2);
    Zcalc2=c(:,3);
    plot(t,Zcalc2);
%cell 3    
    c3=0.75.*c2;
    [t,c]=ode45(@dcdt,trange,c3);
    Zcalc3=c(:,3);
    plot(t,Zcalc3);
    
 legend('Cell 1','Cell 2','Cell 3');   %add Legend
 title('Cell Behavior when Initially Below Hopf Bifurcation');
 
 % We know repeat this for starting above the Saddle node bifurcation
 S=30000;
 
 %Solve for the steady state Value
    syms X Y Z
    eqn1= 0==(ax+bx*S)/(1+S+(Z/zx)^nzx)-X;
    eqn2= 0==(ay+by*S)/(1+S+(X/xy)^nxy)-dely*Y;
    eqn3= 0==1/(1+(X/xz)^nxz+(Y/yz)^nyz)-delz*Z;
    %solve for steady state values
    [solX,solY,solZ] = vpasolve([eqn1,eqn2,eqn3],[X,Y,Z],[1 10;0 0.01;0 0.0]);
    ssX=double(solX);  
    ssY=double(solY);
    ssZ=double(solZ);
%Plot Z vs. time in 3 cells
%c(1)is X and c(2) is Y c(3) is Z
figure; hold on 
xlabel('t');ylabel('Z');

%cell 1
    c1=[ssX,ssY,ssZ];
    [t,c]=ode45(@dcdt,trange,c1);
    Zcalc1=c(:,3);
    plot(t,Zcalc1);
%cell 2    
    c2=1.25.*c1;
    [t,c]=ode45(@dcdt,trange,c2);
    Zcalc2=c(:,3);
    plot(t,Zcalc2);
%cell 3    
    c3=0.75.*c2;
    [t,c]=ode45(@dcdt,trange,c3);
    Zcalc3=c(:,3);
    plot(t,Zcalc3);
    
 legend('Cell 1','Cell 2','Cell 3');   %add Legend
 title('Cell Behavior when Initialy Above Saddle Node Bifurcation');
 
 
 
 
 
 
 
 
 
 
 
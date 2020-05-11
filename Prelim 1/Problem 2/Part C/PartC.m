clear;
close all;
%parameter definitions
ax=1.5;         %value of parameter alphaX
bx=5.0;         %value of betaX
zx=0.4;         %value of zx
nzx=2.7;        %value of nzx
nxz=2.7;        %value of nxz
xz=1.5;         %value of xz
delz=1.0;       %value of delta z

nmax=100; %number of points for each region

%Lower X concentration segment of the stable steady states
%initilization
Xprev=0;
Zprev=0;

Svecl=linspace(0,1.275,nmax);
Xvecl=zeros([1 nmax]);

for n=1:nmax
        S=Svecl(n);
        syms X Z
        eqn1= 0==(ax+bx*S)/(1+S+(Z/zx)^nzx)-X;
        eqn2= 0==1/(1+(X/xz)^nxz)-delz*Z;
        %solve for steady state values
        [solX, solZ] = vpasolve([eqn1,eqn2],[X,Z],[Xprev Zprev]);
        
        %Add the next entry
        Xvecl(n)=double(solX);
        %update initial parameters
        Xprev=double(solX);
        Zprev=double(solZ);
end 
%Plot
figure;
hold on
title('Replication of Fig. 1B');
plot(Svecl,Xvecl,'b');xlabel('S');ylabel('X');

%Higher Concentratoin Region
%initilization
Xprev=5;
Zprev=5;
Svech=linspace(2,0.505,nmax);
Xvech=zeros([1 nmax]);

for n=1:nmax
        S=Svech(n);
        syms X Z
        eqn1= 0==(ax+bx*S)/(1+S+(Z/zx)^nzx)-X;
        eqn2= 0==1/(1+(X/xz)^nxz)-delz*Z;
        %solve for steady state values
        [solX, solZ] = vpasolve([eqn1,eqn2],[X,Z],[Xprev Zprev]);
        
        %Add the next entry
        Xvech(n)=double(solX);
        %update initial parameters
        Xprev=double(solX);
        Zprev=double(solZ);
        a=5;
end 
%Plot
plot(Svech,Xvech,'b');

%Calculation for Unstable intermediate regime (Bonus)
%initilization
SvecUS=linspace(1.275,0.505,nmax);
XvecUS=zeros([1 nmax]);

for n=1:nmax
        S=SvecUS(n);
        syms X Z
        eqn1= 0==(ax+bx*S)/(1+S+(Z/zx)^nzx)-X;
        eqn2= 0==1/(1+(X/xz)^nxz)-delz*Z;
        %solve for steady state values
        [solX, solZ] = vpasolve([eqn1,eqn2],[X,Z],[[0.82 2.256;0 1]]);
        
        %Add the next entry
        XvecUS(n)=double(solX);
end 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot
figure;
hold on 
plot(Svecl,Xvecl,'b');xlabel('S');ylabel('X');
plot(Svech,Xvech,'b');
plot(SvecUS,XvecUS,'b--');
title('Replication of Fig. 1B w/Bonus');


%parameter definitions
ax=1.5;         %value of parameter alphaX
bx=5.0;         %value of betaX
zx=0.4;         %value of zx
nzx=2.7;        %value of nzx
nxz=2.7;        %value of nxz
xz=1.5;         %value of xz
delz=1.0;       %value of delta z


%Lower X concentration segment of the stable steady states

%initilization
nhigh=100;
SvecUShigh=linspace(1.275,0.505,nhigh);
XvecUShigh=zeros([1 nhigh]);

for n=1:nhigh
        S=SvecUShigh(n);
        syms X Z
        eqn1= 0==(ax+bx*S)/(1+S+(Z/zx)^nzx)-X;
        eqn2= 0==1/(1+(X/xz)^nxz)-delz*Z;
        %solve for steady state values
        [solX, solZ] = vpasolve([eqn1,eqn2],[X,Z],[0.82 2.256;0 1]);
        
        %Add the next entry
        XvecUShigh(n)=double(solX);
        Xprev=double(solX);
        Zprev=double(solZ);
end 
%Plot

plot(SvecUShigh,XvecUShigh);


%[solX, solZ] = vpasolve([eqn1,eqn2],[X,Z],[1.5 2.3;0 5]);
%[solX, solZ] = vpasolve([eqn1,eqn2],[X,Z],[Xprev Zprev]);
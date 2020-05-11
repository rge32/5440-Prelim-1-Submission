function [dcbydt] = dcdtdS0_2(t,c)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%define the parameters
S=0.02;
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


%define thee differential equations
dcbydt(1)= (ax+bx*S)/(1+S+(c(3)/zx)^nzx)-c(1);
dcbydt(2)= (ay+by*S)/(1+S+(c(1)/xy)^nxy)-dely*c(2);
dcbydt(3)= 1/(1+(c(1)/xz)^nxz+(c(2)/yz)^nyz)-delz*c(3);
dcbydt=dcbydt';
end

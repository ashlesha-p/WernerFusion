clear all
close all
clc
m = 4;
F = 0.8;
k=2;
states = kron(ones(1,m)',[k,F;]);
fqubits = 1:k:k*m
[rho, rho_GHZ] = WernerFusion(states,fqubits);
F0 = F^3+F*(1-F)^2/3+((1-F)/3)^3+3*((1-F)/3)^3
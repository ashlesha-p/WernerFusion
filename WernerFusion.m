function [rho, rho_GHZ] = WernerFusion(states,fqubits)
%% n-Fusion of Werner states given by states
%% states = nested list with [#qubits,Fidelity]
%% fqubits = qubits of each state undergoing fusion

rho0 = getRho(states);
qubits = sum(states(:,1));
CX = multiQubitCX(qubits,fqubits);
H=[1/sqrt(2),1/sqrt(2);1/sqrt(2),-1/sqrt(2)];
I=eye(2);
for i = 2:qubits
    H = kron(H,I);
end
ket0 = [1,0];
A0 = ket0;
for i = 2:qubits
    if ismember(i,fqubits)
        A0 = kron(A0,ket0);
    else
         A0 = kron(A0,I);
    end
end
rho = A0*H*CX*rho0*CX'*H'*A0'
rho = rho/trace(rho);
n = qubits-length(fqubits);
H0=[1/sqrt(2),1/sqrt(2);1/sqrt(2),-1/sqrt(2)];
rho_GHZ = kron(H0,eye(2^(n-1)))*multiQubitCX(n,1:n)*rho*multiQubitCX(n,1:n)*kron(H0,eye(2^(n-1)));
end
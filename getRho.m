function rho = getRho(states)
[r,c] = size(states);
H = [1,1;1,-1;]/sqrt(2);
n = states(1,1);
F = states(1,2);

coeffs = [F,((1-F)/(2^n-1))*ones(1,2^n-1)];
rho = multiQubitCX(n,1:n)*kron(H,eye(2^(n-1)))*diag(coeffs)*kron(H,eye(2^(n-1)))*multiQubitCX(n,1:n);
for i = 2:r
    n = states(i,1);
    F = states(i,2);
    coeffs = [F,((1-F)/(2^n-1))*ones(1,2^n-1)];
    rho0 = multiQubitCX(n,1:n)*kron(H,eye(2^(n-1)))*diag(coeffs)*kron(H,eye(2^(n-1)))*multiQubitCX(n,1:n);
    rho = kron(rho,rho0);
end
end
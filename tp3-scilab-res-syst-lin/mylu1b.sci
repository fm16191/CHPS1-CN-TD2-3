function [L, U] = mylu1b(A)

[n, n] = size(A)

for k = 1 : n-1
    A(k+1:n,k) = A(k+1:n, k) / A(k,k)
    A(k+1:n, k+1 : n) = A(k+1:n, k+1 : n) - A(k+1:n, k)*A(k,k+1 : n)
end

L = tril(A, -1);
U = triu(A);

for i = 1:n L(i,i) = 1 end

endfunction
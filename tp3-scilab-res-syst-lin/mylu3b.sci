function [L, U] = mylu3b(A)

[n, n] = size(A)

for k = 1 : n-1
    for i = k+1 : n
        A(i,k) = A(i,k) / A(k,k);
    end
    for i = k+1 : n
        for j = k+1 : n
            A(i,j) = A(i,j) - A(i,k)*A(k,j);
        end
    end
end

L = tril(A, -1);
// L = tril(A + eye(n), -1);
U = triu(A);

for i = 1:n L(i,i) = 1 end

endfunction

// A = [ 1    2    3
//       4    5    6
//       7    8    0 ];

// [L1,U] = lu(A)
// [L2,U,P] = lu(A)
// X = inv(U)*inv(L1)
// X = inv(A)
// L1*U
function [C] = matmat2b(A,B)
[m,p] = size(A)
[p,n] = size(B)

C = zeros(rand(m,n))

for i = 1 : m
    for j = 1 : n
    C(i,j) = A(i,:)*B(:,j) + C(i,j);
    end
end

endfunction
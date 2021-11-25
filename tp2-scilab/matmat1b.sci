function [C] = matmat1b(A,B)
[m,p] = size(A)
[p,n] = size(B)

C = zeros(rand(m,n))

for i = 1 : m
    C(i,:) = A(i,:)*B + C(i,:);
end

endfunction
exec('usolve.sci', -1);
exec('gausskij3b.sci', -1);
format('v', 25)

function [front_error, backward_error, rg] = solve_gauss(n)

A = rand(n,n)
b = rand(n,1)

xerr = gausskij3b(A,b)
xex = A\b

front_error = norm(xex - xerr)/norm(xex)
backward_error = norm(b-A*xerr)/(norm(A)*norm(xerr))

rg = front_error <= cond(A)*backward_error

endfunction
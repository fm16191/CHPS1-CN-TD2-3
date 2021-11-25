// Implémentation de l'algorithme de Gauss sans pivotage puis résolution par méthode de descente `gausskij3b.sci`

format('v', 25);

exec('gausskij3b.sci', -1);


// Initilisation d'une matrice carrée A et vecteur b, de dimensions n = 3
A = rand(3,3)
b = rand(3,1)

// Calcul de la valeur réelle et approchée
xex = A\b

xerr = gausskij3b(A,b)


// Maintenant on calcule l'erreur avant et arrière.
front_error = norm(xex - xerr)/norm(xex)

backward_error = norm(b-A*xerr)/(norm(A)*norm(xerr))

front_error <= cond(A)*backward_error

exec('solve_gauss.sci', -1);
[front_error, backward_error, rg] = solve_gauss(200)

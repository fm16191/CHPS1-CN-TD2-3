// 
exec('usolve.sci', -1);
exec('lsolve.sci', -1);

// Initialisation d'une matrice carrée A, et d'un vecteur b, de dimensions n = 5.
A = rand(5,5)
b = rand(5,1)

// Génération de la matrice triangulaire supérieure U et la matrice triangulaire inférieure L
L = tril(A)
U = triu(A)

// Vérification des fonctions usolve et lsolve:
usolve(U,b) == U\b
lsolve(L,b) == L\b


// Calculer l'erreur avant et arrière

usolve_x = usolve(U,b)
lsolve_x = lsolve(L,b)

u_xerr = U\b
l_xerr = L\b

usolve_x == xuerr
lsolve_x == xlerr

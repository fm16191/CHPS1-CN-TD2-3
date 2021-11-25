// 1. Vecteur x à 1 ligne et 4 colonnes
x = [1,2,3,4]

// 2. Vecteur y à 4 lignes et 1 colonne
y = [1;2;3;4]

// 3. Opérations
z = x + y'
s = x*y

// 4. Taille des vecteurs
size(x)
size(y)

// 5. Norme 2 de x
// Par défaut la norme est à 2
norm(x)

// 6. Matrice à 4 lignes et 3 colonnes
A = [1,2,3;4,5,6;7,8,9;10,11,12]

// 7. Transposée de A
B = A'

// 8. Opérations de base entre deux matrices carrées
A = y*x
B = y*x*3

A+B
A-B
A*B
A/B

// 9. Conditionnement de A
cond(A)
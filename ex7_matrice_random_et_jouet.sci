// 1. Matrice carrée A de taille 3
A = rand(3,3)

// 2. Vecteur xex de taille 3
xex = rand(3,1)

// 3. 
b = A * xex

// Résolution du système `Ax = b` avec la fonction `\`
A\b

// Création de l'erreur
B = A * xex
xerr = A\B

// Erreur avant
front_error = norm(xex - xerr)/norm(xex)

// Erreur arrière
backward_error = norm(B-A*xerr)/(norm(A)*norm(xerr))

// Règle générale
front_error <= cond(A)*backward_error


// Fonction `error_calc` pour benchmarker les erreurs avant et arrière sur des tailles de matrices différentes.
format('v',25);

function [front_error, backward_error, regle_generale]=error_calc(size)
  A = rand(size,size)
  xex = rand(size,1)
  b = A * xex
  xerr = A\b
  front_error = norm(xex - xerr)/norm(xex)
  backward_error = norm(b-A*xerr)/(norm(A)*norm(xerr))
  regle_generale = front_error <=cond(A)*backward_error
endfunction

// Test sur des matrices de tailles 100, 1000 et 10000

[front_error, backward_error, regle_generale] = error_calc(100)
[front_error, backward_error, regle_generale] = error_calc(1000)
[front_error, backward_error, regle_generale] = error_calc(10000)
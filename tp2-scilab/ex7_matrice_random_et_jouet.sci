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

function [] = backslash_error_calc(matrix_size_range, runs)
  [x, range] = size(matrix_size_range);
  back = zeros(range,1)
  front = zeros(range,1)
  filename = "backslash_errors.dat";
  [f, mode_f] = mopen(filename, "w");
  for i=matrix_size_range
   printf("Running on %d ...\n", i);
   front_err_runs = zeros(runs,1)
   back_err_runs = zeros(runs,1)
   for j=1:runs
    [back_err_runs(j,1), front_err_runs(j,1), r] = error_calc(i)
   end
   front(i,1) = mean(front_err_runs);
   back(i,1) = mean(back_err_runs);
   mfprintf(f, "%d %.17f %.17f\n", i, front(i,1), back(i,1));
  end
  mclose(f);
  printf("Data written to %s\n", filename);
endfunction

function plot_backslash_errors(filename, mode)
clf();
data = csvRead(filename, ' ');
xrange = data(:,1)
xlabel('Matrix size');

if mode == 1 then
  // front error
  plot(xrange, data(:, 2), '+-b');
  ylabel('Front error');
  h1 = legend(["Front error"], pos=2);
  output_file = "backslash_errors_front.svg";
else
  // back error
  plot(xrange, data(:, 3), '+-r');
  ylabel('Backward error');
  h1 = legend(["Backward error"], pos=2);
  output_file = "backslash_errors_back.svg";
end
title('Backward and front error by matrix size')
a = gca();
a.font_size = 3;
a.x_label.font_size = 3;
a.y_label.font_size = 3;
a.title.font_size = 3;
xs2svg(gcf(), output_file);
endfunction

function [] = run_backslash_errors(matrix_size_range, runs)
backslash_error_calc(matrix_size_range, runs);
plot_backslash_errors('backslash_errors.dat', 1);
plot_backslash_errors('backslash_errors.dat', 2);
endfunction
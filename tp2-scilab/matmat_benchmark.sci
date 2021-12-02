format('v', 25);

exec('matmat3b.sci',-1);
exec('matmat2b.sci',-1);
exec('matmat1b.sci',-1);

function [disp, avg, med, mn, v2, v3] = benchmark(runs, m,n,p)
t = zeros(3,runs);
for i=1:runs
   A = rand(m,p);
   B = rand(p,n);
   tic(); matmat1b(A,B); 
   t(1,i) = toc();

   tic(); matmat2b(A,B); 
   t(2,i) = toc();

   tic(); matmat3b(A,B); 
   t(3,i) = toc();
end

disp = zeros(3,1);
avg = zeros(3,1);
med = zeros(3,1);
mn = zeros(3,1);

for i = 1:3
   disp(i,1) = max(t(i,:)) - min(t(i,:));
   avg(i,1) = (min(t(i,:)) + max(t(i,:))) / 2;
   med(i,1) = median(t(i,:));
   mn(i,1) = mean(t(i,:));
end

v2 = mn(3,1)/mn(2,1);
v3 = mn(3,1)/mn(1,1);
endfunction

function [disp, avg, med, mn, v2, v3] = data_matmat_benchmark(matrix_size_range, runs)
[x, range] = size(matrix_size_range)
disp = zeros(range, 3);
avg = zeros(range, 3);
med = zeros(range, 3);
mn = zeros(range, 3);
v2 = zeros(range, 1);
v3 = zeros(range, 1);
step = 1;
for i=matrix_size_range
   printf("Running %d*%d*%d ...\n", i,i,i);
   [disp(step, :), avg(step, :), med(step, :), mn(step, :), v2(step, 1), v3(step, 1)] = benchmark(runs, i,i,i);
   step = step + 1;
end
endfunction

function plot_matmat_benchmark(matrix_size_range, v2, v3)
clf();
xrange = matrix_size_range'
plot(xrange, 1, '+-b');
plot(xrange, v2, '+-g');
plot(xrange, v3, '+-r');
//errbar(xrange, avg, disp/2, disp/2);
//plot(xrange, disp, 'r.+');
xlabel('Size of matrix');
ylabel('Execution time speedup by version');
title('Execution time speedup on matmat operation by version and by matrix size')
h1 = legend(["3 loops - reference";"2 loops - speedup"; "1 loop - speedup"], pos=2);
a = gca();
a.font_size = 3;
a.x_label.font_size = 3;
a.y_label.font_size = 3;
a.title.font_size = 3;
endfunction

function [] = run_matmat_benchmark(matrix_size_range, runs)
[disp, avg, med, mn, v2, v3] = data_matmat_benchmark(matrix_size_range, runs)
plot_matmat_benchmark(matrix_size_range, v2, v3)
endfunction
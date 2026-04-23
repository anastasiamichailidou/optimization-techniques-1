clear; clc; close all;

f1 = @(x) 5.^x + (2 - cos(x)).^2;
f2 = @(x) (x - 1).^2 + exp(x - 5) .* sin(x + 3);
f3 = @(x) exp(-3.*x) - (sin(x - 2) - 2).^2;
funcs = {f1, f2, f3};
func_names = {'f1', 'f2', 'f3'};

a_init = -1;
b_init = 3;
e_fixed = 0.001;
l_values = linspace(0.003, 0.1, 50);


for idx = 1:length(funcs)
    evals = zeros(size(l_values));
    iters = zeros(size(l_values));
    fmins = zeros(size(l_values));
    final_a = zeros(size(l_values));
    final_b = zeros(size(l_values));
    
    for i = 1:length(l_values)
        l_current = l_values(i);
        [~, fmin, iter, eval_count, a_hist, b_hist] = bisectionMethod(funcs{idx}, a_init, b_init, l_current, e_fixed);
        evals(i) = eval_count;
        iters(i) = iter;
        fmins(i) = fmin;
        final_a(i) = a_hist(end);
        final_b(i) = b_hist(end);
    end

    
    figure;
    plot(l_values, evals, '-o', 'LineWidth', 1.5);
    title(['Θεμα 2: Υπολογισμοί ' func_names{idx} '(x) συναρτήσει του l (ε = ' num2str(e_fixed) ')']);
    xlabel('Τελικό Εύρος l');
    ylabel('Συνολικός Αριθμός Υπολογισμών f(x)');
    grid on;

   
end

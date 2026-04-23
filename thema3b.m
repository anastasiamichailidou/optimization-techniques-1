clear; clc; close all;

f1 = @(x) 5.^x + (2 - cos(x)).^2;
f2 = @(x) (x - 1).^2 + exp(x - 5).*sin(x + 3);
f3 = @(x) exp(-3*x) - (sin(x - 2) - 2).^2;

funcs = {f1, f2, f3};
func_names = {
    'f_1(x) = 5^x + (2 - cos(x))^2'
    'f_2(x) = (x - 1)^2 + e^{x-5} sin(x+3)'
    'f_3(x) = e^{-3x} - (sin(x-2)-2)^2'
};

colors = [
    0     0.4470 0.7410  
    0.8500 0.3250 0.0980  
    0.4660 0.6740 0.1880  
];

a0 = -1;
b0 = 3;

Lvals = logspace(log10(0.0001), log10(0.5), 100);

for i = 1:3
    f = funcs{i};
    fcounts = zeros(size(Lvals));

    for j = 1:length(Lvals)
        l = Lvals(j);
        [xmin, a_hist, b_hist, fcount] = fibonacciMethod(f, a0, b0, l);
        fcounts(j) = fcount;
    end

    figure;
    semilogx(Lvals, fcounts, '-o', ...
        'LineWidth', 1.8, 'MarkerSize', 6, ...
        'Color', colors(i,:));

    grid on;

    xlabel('Τελικό εύρος l','FontSize',14);
    ylabel('Αριθμός υπολογισμών f(x)','FontSize',14);

    title(['Θέμα 3: Υπολογισμοί f(x) συναρτήσει του l για ', func_names{i}], ...
          'FontSize', 16, 'Interpreter','tex');
end

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

Lvals = [0.5, 0.1, 0.01, 0.001];

a0 = -1;
b0 = 3;

colors = [
    0     0.4470 0.7410;   
    0.8500 0.3250 0.0980;  
    0.9290 0.6940 0.1250;  
    0.4940 0.1840 0.5560;  
];

for i = 1:3
    f = funcs{i};

    figure('Name', ['Σύγκλιση Fibonacci για ', func_names{i}], ...
           'Color', 'w');

    for j = 1:4

        l = Lvals(j);

        [xmin, a_hist, b_hist, fcount] = fibonacciMethod(f, a0, b0, l);

        k_vals = 0:length(a_hist)-1;

        subplot(2,2,j);
        plot(k_vals, a_hist, '-o', 'LineWidth', 1.8, ...
            'MarkerSize', 6, 'Color', colors(j,:));
        hold on;
        plot(k_vals, b_hist, '--s', 'LineWidth', 1.8, ...
            'MarkerSize', 6, 'Color', colors(j,:));

        xlabel('Δείκτης επαναλήψεων k','FontSize',12);
        ylabel('Τιμές a_k, b_k','FontSize',12);

        title(['l = ', num2str(l)], 'FontSize',13);
        legend('a_k','b_k','Location','best');
        grid on;

        ylim([-1 3]);

    end

    sgtitle(['Θέμα 3: Σύγκλιση διαστήματος [a_k, b_k] για ', func_names{i}], ...
             'FontSize', 16, 'Interpreter','tex');

end

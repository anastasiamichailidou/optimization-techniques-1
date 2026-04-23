clear; clc; close all;

f1  = @(x) 5.^x + (2 - cos(x)).^2;
df1 = @(x) 5.^x * log(5) + 2*(2 - cos(x))*sin(x);

f2  = @(x) (x - 1).^2 + exp(x - 5).*sin(x + 3);
df2 = @(x) 2*(x - 1) + exp(x - 5).*(sin(x + 3) + cos(x + 3));

f3  = @(x) exp(-3*x) - (sin(x - 2) - 2).^2;
df3 = @(x) -3*exp(-3*x) - 2*(sin(x - 2) - 2)*cos(x - 2);

funcs = {f1, f2, f3};
dfs   = {df1, df2, df3};
names = {'f_1(x) = 5^x + (2 - cos(x))^2', ...
         'f_2(x) = (x-1)^2 + e^{x-5} sin(x+3)', ...
         'f_3(x) = e^{-3x} - (sin(x-2)-2)^2'};

a0 = -1;
b0 = 3;

Lvals = [0.5, 0.1, 0.01, 0.001];

colors = {'b', [1 0.5 0], [0.2 0.7 0.2], [0.5 0 0.5]};

for i = 1:3

    f  = funcs{i};
    df = dfs{i};

    figure('Position',[200 100 1200 700]);

    sgtitle(['Θέμα 4: Σύγκλιση διαστήματος [a_k, b_k] για ', names{i}]);

    for j = 1:length(Lvals)

        l = Lvals(j);

        [xmin, a_hist, b_hist, f_evals] = bisectionDerivativeMethod(f, df, a0, b0, l);

        k_vals = 0:length(a_hist)-1;

        subplot(2,2,j);
        plot(k_vals, a_hist, '-o', 'LineWidth', 1.6, 'Color', colors{j}); hold on;
        plot(k_vals, b_hist, '--s', 'LineWidth', 1.6, 'Color', colors{j});

        xlabel('Δείκτης επαναλήψεων k');
        ylabel('Τιμές a_k , b_k');
        title(['l = ', num2str(l)]);
        ylim([-1 3]);
        grid on;
        legend('a_k', 'b_k');
    end

end

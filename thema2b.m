
clear; clc; close all;

f1 = @(x) 5.^x + (2 - cos(x)).^2;
f2 = @(x) (x - 1).^2 + exp(x - 5) .* sin(x + 3);
f3 = @(x) exp(-3*x) - (sin(x - 2) - 2).^2;

a = -1;
b = 3;
epsilon = 0.001;  
l_values = [0.01, 0.05, 0.1, 0.5]; 

colors = [
    0.8500, 0.3250, 0.0980;   
    0, 0.4470, 0.7410;       
    0.4660, 0.6740, 0.1880;   
    0.6350, 0.0780, 0.1840 ];



figure('Position', [50, 100, 1200, 400], 'Color', 'w');

for i = 1:length(l_values)
    l = l_values(i);


    [~, ~, ~, ~, ak, bk] = bisectionMethod(f1, a, b, l, epsilon);
    k = 0:(length(ak)-1); 
    subplot(1, 4, i);
    plot(k, ak, '-o', 'LineWidth', 2, 'MarkerSize', 6, ...
         'Color', colors(i,:), 'MarkerFaceColor', colors(i,:), ...
         'DisplayName', 'a_k');
    hold on;
    plot(k, bk, '-s', 'LineWidth', 2, 'MarkerSize', 6, ...
         'Color', colors(i,:)*0.6, 'MarkerFaceColor', colors(i,:)*0.6, ...
         'DisplayName', 'b_k');
    hold off;

    xlabel('Δείκτης επαναλήψεων k', 'FontSize', 11, 'FontWeight', 'bold');
    ylabel('Τιμές a_k, b_k', 'FontSize', 11, 'FontWeight', 'bold');
    title(sprintf('l = %.2f (%d επαναλήψεις)', l, length(ak)-1), ...
          'FontSize', 12, 'FontWeight', 'bold');
    legend('Location', 'best', 'FontSize', 10);
    grid on;
    set(gca, 'FontSize', 10);
end

sgtitle('f_1(x) = 5^x + (2-cos(x))^2 - Εξέλιξη διαστήματος [a_k, b_k]', ...
        'FontSize', 14, 'FontWeight', 'bold');

saveas(gcf, 'thema1c_f1_evolution.png');




figure('Position', [50, 100, 1200, 400], 'Color', 'w');

for i = 1:length(l_values)
    l = l_values(i);

    [~, ~, ~, ~, ak, bk] = bisectionMethod(f2, a, b, l, epsilon);
    k = 0:(length(ak)-1);

    subplot(1, 4, i);
    plot(k, ak, '-o', 'LineWidth', 2, 'MarkerSize', 6, ...
         'Color', colors(i,:), 'MarkerFaceColor', colors(i,:), ...
         'DisplayName', 'a_k');
    hold on;
    plot(k, bk, '-s', 'LineWidth', 2, 'MarkerSize', 6, ...
         'Color', colors(i,:)*0.6, 'MarkerFaceColor', colors(i,:)*0.6, ...
         'DisplayName', 'b_k');
    hold off;

    xlabel('Δείκτης επαναλήψεων k', 'FontSize', 11, 'FontWeight', 'bold');
    ylabel('Τιμές a_k, b_k', 'FontSize', 11, 'FontWeight', 'bold');
    title(sprintf('l = %.2f (%d επαναλήψεις)', l, length(ak)-1), ...
          'FontSize', 12, 'FontWeight', 'bold');
    legend('Location', 'best', 'FontSize', 10);
    grid on;
    set(gca, 'FontSize', 10);
end

sgtitle('f_2(x) = (x-1)^2 + e^{x-5}·sin(x+3) - Εξέλιξη διαστήματος [a_k, b_k]', ...
        'FontSize', 14, 'FontWeight', 'bold');

saveas(gcf, 'thema1c_f2_evolution.png');




figure('Position', [50, 100, 1200, 400], 'Color', 'w');

for i = 1:length(l_values)
    l = l_values(i);

    [~, ~, ~, ~, ak, bk] = bisectionMethod(f3, a, b, l, epsilon);
    k = 0:(length(ak)-1);

    subplot(1, 4, i);
    plot(k, ak, '-o', 'LineWidth', 2, 'MarkerSize', 6, ...
         'Color', colors(i,:), 'MarkerFaceColor', colors(i,:), ...
         'DisplayName', 'a_k');
    hold on;
    plot(k, bk, '-s', 'LineWidth', 2, 'MarkerSize', 6, ...
         'Color', colors(i,:)*0.6, 'MarkerFaceColor', colors(i,:)*0.6, ...
         'DisplayName', 'b_k');
    hold off;

    xlabel('Δείκτης επαναλήψεων k', 'FontSize', 11, 'FontWeight', 'bold');
    ylabel('Τιμές a_k, b_k', 'FontSize', 11, 'FontWeight', 'bold');
    title(sprintf('l = %.2f (%d επαναλήψεις)', l, length(ak)-1), ...
          'FontSize', 12, 'FontWeight', 'bold');
    legend('Location', 'best', 'FontSize', 10);
    grid on;
    set(gca, 'FontSize', 10);
end

sgtitle('f_3(x) = e^{-3x} - (sin(x-2)-2)^2 - Εξέλιξη διαστήματος [a_k, b_k]', ...
        'FontSize', 14, 'FontWeight', 'bold');

saveas(gcf, 'thema1c_f3_evolution.png');



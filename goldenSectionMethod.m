clear; clc; close all;

f1 = @(x) 5.^x + (2 - cos(x)).^2;
f2 = @(x) (x - 1).^2 + exp(x - 5) .* sin(x + 3);
f3 = @(x) exp(-3.*x) - (sin(x - 2) - 2).^2;

a_init = -1;
b_init = 3;
l_fixed = 0.01;
epsilon_values = linspace(0.001, 0.0049, 100);


evals_f1 = zeros(size(epsilon_values));
iters_f1 = zeros(size(epsilon_values));
fmins_f1 = zeros(size(epsilon_values));
final_a_f1 = zeros(size(epsilon_values));
final_b_f1 = zeros(size(epsilon_values));

evals_f2 = zeros(size(epsilon_values));
iters_f2 = zeros(size(epsilon_values));
fmins_f2 = zeros(size(epsilon_values));
final_a_f2 = zeros(size(epsilon_values));
final_b_f2 = zeros(size(epsilon_values));

evals_f3 = zeros(size(epsilon_values));
iters_f3 = zeros(size(epsilon_values));
fmins_f3 = zeros(size(epsilon_values));
final_a_f3 = zeros(size(epsilon_values));
final_b_f3 = zeros(size(epsilon_values));


for i = 1:length(epsilon_values)
    e_current = epsilon_values(i);
    [~, fmin, iter, evals, a_hist, b_hist] = bisectionMethod(f1, a_init, b_init, l_fixed, e_current);
    evals_f1(i) = evals;
    iters_f1(i) = iter;
    fmins_f1(i) = fmin;
    final_a_f1(i) = a_hist(end);
    final_b_f1(i) = b_hist(end);
end


for i = 1:length(epsilon_values)
    e_current = epsilon_values(i);
    [~, fmin, iter, evals, a_hist, b_hist] = bisectionMethod(f2, a_init, b_init, l_fixed, e_current);
    evals_f2(i) = evals;
    iters_f2(i) = iter;
    fmins_f2(i) = fmin;
    final_a_f2(i) = a_hist(end);
    final_b_f2(i) = b_hist(end);
end

for i = 1:length(epsilon_values)
    e_current = epsilon_values(i);
    [~, fmin, iter, evals, a_hist, b_hist] = bisectionMethod(f3, a_init, b_init, l_fixed, e_current);
    evals_f3(i) = evals;
    iters_f3(i) = iter;
    fmins_f3(i) = fmin;
    final_a_f3(i) = a_hist(end);
    final_b_f3(i) = b_hist(end);
end


figure;
plot(epsilon_values, evals_f1, 'r-o', 'LineWidth', 1.5);
title(['Θέμα 1: Υπολογισμοί f1(x) συναρτήσει του ε (l = ' num2str(l_fixed) ')']);
xlabel('Σταθερά ε (epsilon)');
ylabel('Υπολογισμοί f(x)');
grid on;
set(gca, 'XMinorGrid', 'on');

figure;
plot(epsilon_values, evals_f2, 'g-s', 'LineWidth', 1.5);
title(['Θέμα 1: Υπολογισμοί f2(x) συναρτήσει του ε (l = ' num2str(l_fixed) ')']);
xlabel('Σταθερά ε (epsilon)');
ylabel('Υπολογισμοί f(x)');
grid on;
set(gca, 'XMinorGrid', 'on');

figure;
plot(epsilon_values, evals_f3, 'b-x', 'LineWidth', 1.5);
title(['Θέμα 1: Υπολογισμοί f3(x) συναρτήσει του ε (l = ' num2str(l_fixed) ')']);
xlabel('Σταθερά ε (epsilon)');
ylabel('Υπολογισμοί f(x)');
grid on;
set(gca, 'XMinorGrid', 'on');


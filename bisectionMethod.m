clear; clc; close all;

f1  = @(x) 5.^x + (2 - cos(x)).^2;
df1 = @(x) log(5).*5.^x + 2.*(2 - cos(x)).*sin(x);


f2  = @(x) (x - 1).^2 + exp(x - 5).*sin(x + 3);
df2 = @(x) 2.*(x - 1) + exp(x - 5).*(sin(x + 3) + cos(x + 3));
df3 = @(x) -3.*exp(-3.*x) - 2.*(sin(x - 2) - 2).*cos(x - 2);

f3  = @(x) exp(-3*x) - (sin(x - 2) - 2).^2;
df3 = @(x) -3.*exp(-3.*x) - 2.*(sin(x - 2) - 2).*cos(x - 2);

funcs = {f1, f2, f3};
dfs   = {df1, df2, df3};
names = {'f_1(x)', 'f_2(x)', 'f_3(x)'};

a0 = -1;
b0 = 3;

Lvals = logspace(-4, -1, 100);

colors = [
    0     0.4470 0.7410;    
    0.8500 0.3250 0.0980;  
    0.4660 0.6740 0.1880;   
];

markers = {'-o','-s','-d'};


for i = 1:3

    f = funcs{i};
    df = dfs{i};

    fcounts = zeros(size(Lvals));

    for j = 1:length(Lvals)
        l = Lvals(j);
        [xmin, a_hist, b_hist, f_evals] = bisectionDerivativeMethod(f, df, a0, b0, l);
        fcounts(j) = f_evals;
    end

    figure;
    semilogx(Lvals, fcounts, markers{i}, ...
             'Color', colors(i,:), ...
             'LineWidth', 2, ...
             'MarkerSize', 6);
    grid on;

    xlabel('Τελικό εύρος l');
    ylabel('Υπολογισμοί f(x)');
    title(['Θέμα 4: Υπολογισμοί f(x) συναρτήσει του l για ', names{i}]);

end

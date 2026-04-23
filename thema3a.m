function [xmin, a_hist, b_hist, f_evals] = fibonacciMethod(f, a0, b0, tol)
fib = [1, 1];   % F1 = 1, F2 = 1
L0 = b0 - a0;

while fib(end) < L0 / tol
    fib(end+1) = fib(end) + fib(end-1);
end

N = length(fib);
maxIter = N - 2;

a = a0;
b = b0;

a_hist = a;
b_hist = b;

xL = a + (fib(N-2)/fib(N)) * (b - a);
xR = a + (fib(N-1)/fib(N)) * (b - a);

fL = f(xL);
fR = f(xR);
f_evals = 2;

eps_small = 1e-6;

for k = 1:maxIter

    if fL <= fR
       
        b = xR;
        xR = xL;
        fR = fL;

        if k == maxIter
            xL = xR - eps_small;
            fL = f(xL);
            f_evals = f_evals + 1;
            a_hist(end+1) = a;
            b_hist(end+1) = b;
            break;
        end

     
        ratio = fib(N-k-2) / fib(N-k-1);
        xL = b - ratio * (b - a);
        fL = f(xL);
        f_evals = f_evals + 1;

    else
        
        a = xL;
        xL = xR;
        fL = fR;

        if k == maxIter
            xR = xL + eps_small;
            fR = f(xR);
            f_evals = f_evals + 1;
            a_hist(end+1) = a;
            b_hist(end+1) = b;
            break;
        end

        ratio = fib(N-k-2) / fib(N-k-1);
        xR = a + ratio * (b - a);
        fR = f(xR);
        f_evals = f_evals + 1;
    end

    a_hist(end+1) = a;
    b_hist(end+1) = b;
end

if fL <= fR
    b = xR;
else
    a = xL;
end

xmin = (a + b) / 2;

end

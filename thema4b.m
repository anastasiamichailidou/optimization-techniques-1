function [xmin, a_hist, b_hist, f_evals] = bisectionDerivativeMethod(f, df, a0, b0, l)

a = a0;
b = b0;
a_hist = a;
b_hist = b;

f_evals = 0;

while (b - a) > l

    m = (a + b)/2; 
    
    df_m = df(m);
    f(m);
    f_evals = f_evals + 1;

    if df_m > 0
        
        b = m;
    else
       
        a = m;
    end

    a_hist(end+1) = a;
    b_hist(end+1) = b;

end

xmin = (a + b)/2;

end


function [xmin, fmin, iter, evals, a_history, b_history] = bisectionMethod(f, a, b, l, e)
 
    k = 1;            
    evals = 0;       
    a_history(k) = a; 
    b_history(k) = b;

   
    while (b - a) > l
      
        x1 = (a + b) / 2 - e;
        x2 = (a + b) / 2 + e;
     
        fx1 = f(x1);
        fx2 = f(x2);
        evals = evals + 2;
        
        
        if fx1 < fx2
            b = x2;
        else
            a = x1;
        end 
       
        k = k + 1;
        
        a_history(k) = a;
        b_history(k) = b;
    end
    

    iter = k - 1; 

    xmin = (a + b) / 2;
    fmin = f(xmin);
    
end 




function [sol , it]= dichotomy(fun, a, b, tol)
    it = 0;
    while abs(a - b) > tol
        [a, b] = iter(fun, a, b); it = it + 1;
    end
    sol = (a + b)/2;
end

function [a1, b1] = iter(fun, a, b)
    a1 = a; b1 = b;
    if fun(a) == 0
        if fun(b) ~= 0
            b1 = a;
        end
    elseif fun(b) == 0
        a1 = b;
    end
    if fun(a)*fun(b) > 0
        error('Input interval [a,b] must satifies f(a)f(b)<=0 !');
    end
    if fun(a) > 0
        fun = @(x)-fun(x);
    end
    x0 = (a + b)/2;
    if fun(x0) > 0
        b1 = x0;
    elseif fun(x0) == 0
        a1 = x0; b1 = x0;
    else
        a1 = x0;
    end
end
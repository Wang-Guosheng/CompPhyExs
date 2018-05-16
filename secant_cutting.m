function [sol , it]= secant_cutting(fun, a, b, tol)
    it = 0;
    while abs(a - b) > tol
        [a, b] = deal(b, iter(fun, a, b)); it = it + 1;
    end
    sol = b;
end

function b = iter(fun, a, b)
    if fun(a) ~= 0
        b = a - fun(a)/((fun(b) - fun(a))/(b -a));
    else
        b = a;
    end
end
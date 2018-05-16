function [sol , it]= newtonian_tangent(fun, x0, tol)
    it = 1; x1 = iter(fun, x0, tol);
    while abs(x0 - x1) > tol
        x0 = x1; x1 = iter(fun, x0, tol); it = it + 1;
    end
    sol = x1;
end

function x1 = iter(fun, x0, tol)
    x1 = x0;
    if fun(x0) ~= 0
        x1 = x0 - fun(x0)/((fun(x0 + tol/100) - fun(x0))/tol*100);
    end
end
# 方程求根

## 对分法

```matlab
% dichotomy.m
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
```

[下载源码](https://wang-guosheng.github.io/CompPhyExs/)

## 牛顿切线法

```matlab
% newtonian_tangent.m
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
```



## 弦割法

```matlab
% secant_cutting.m
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
```




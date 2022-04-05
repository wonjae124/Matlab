
```matlab:Code
n = 172
```


```text:Output
n = 172
```


```matlab:Code

poissonpmf(n,n)
```


```text:Output
ans = 0.0304
```


```matlab:Code

```


```matlab:Code
function pmf = poissonpmf(alpha,x)
    x = x(:);
    k = (1:max(x))'; %  (1:x)'임. 수식에서는 k => (x!)'                    %
    ip = [1;((alpha*ones(size(k)))./k)]; % 1;로 열벡터 최상단에 1 추가 ip는 e^(-alpha) = alpha*ones(size(k)), ./k = k!
    pb = exp(-alpha)*cumprod(ip);        % cumprod는 누적곱
    pmf = pb(x+1);                       % n+1 번째 누적된 확률을 적어둠
    %pmf = ((alpha^x)*exp(-alpha*x))/factorial(x);
    pmf = (x>0).*(x==floor(x)).*pmf;
end
```


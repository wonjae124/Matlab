
```matlab:Code
%%Example 3.29%%
clear
geometricpmf(0.2,2)
```


```text:Output
ans = 0.1600
```


```matlab:Code
geometricpmf(0.2,5)
```


```text:Output
ans = 0.0819
```


```matlab:Code
geometricpmf(0.2,10)
```


```text:Output
ans = 0.0268
```


```matlab:Code
geometricpmf(0.2,20)
```


```text:Output
ans = 0.0029
```


```matlab:Code

```


```matlab:Code
function pmf = geometricpmf(p,x)
    %geometric(p) rv X
    %out:pmf(i):Prob[X=x(i)]
    x = x(:); %x를 column vector로 바꿔서 output을 column vector가 되게끔 한다. 그럼 row vector로 만드는건?
    pmf = p*((1-p).^(x-1)); 
    pmf = (x>0).*(x==floor(x)).*pmf; %? floor은 가장 가까운 정수로 내림. sample space를 벗어나면 확률은 0임.
end

```


```text:Output
ans = 0.1600
```



```matlab:Code
#Ex 3.28
shipweightpmf([2 2.5 6])'
```


```text:Output
p = 8x1    
    0.1500
    0.1500
    0.1500
    0.1500
    0.1000
    0.1000
    0.1000
    0.1000

y = 3x1    
    0.1500
         0
    0.1000

ans = 1x3    
    0.1500         0    0.1000

```


```matlab:Code

```


```matlab:Code
function y = shipweightpmf(x)
    s = [1:8]';
    p = [0.15*ones(4,1); 0.1*ones(4,1)]
    y = finitepmf(s,p,x)
end

function pmf=finitepmf(sx,px,x) % sx = (1:8)', px = (0.15 0.15 0.15 0.15 0.1 0.1 0.1 0.1), x = [2 2.5 6]
    % finite random variable X:
    % vector sx of sample space
    % elements {sx(1),sx(2), ...}
    % vector px of probabilities
    % px(i)=P[X=sx(i)]
    % Output is the vector
    % pmf: pmf(i)=P[X=x(i)]
    pmf=zeros(size(x(:)));  % size( [2 2.5 6]' ) => 3x1
    for i=1:length(x)       % i = 1:3
     pmf(i)= sum(px(find(sx==x(i)))); % sample space에 존재하는 수의 인덱스 찾음. 2와 6임 2.5는 탈락
    end
end

```


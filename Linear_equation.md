
```matlab:Code
%determinant/eigen value
A = [1 2 3; 4 0 0; 5 0 6]
```


```text:Output
A = 3x3    
     1     2     3
     4     0     0
     5     0     6

```


```matlab:Code

eig(A) % 3차원이므로 3개의 고유값 존재
```


```text:Output
ans = 3x1    
    8.3477
   -3.1646
    1.8170

```


```matlab:Code

det(A)
```


```text:Output
ans = -48.0000
```


```matlab:Code

prod(eig(A)) % 모든 고유값의 곱은 디털미넌트와 같다!
```


```text:Output
ans = -48.0000
```


```matlab:Code

sum(eig(A)) % 주대각성분의 합은 고유값의 합과 같다.
```


```text:Output
ans = 7.0000
```


```matlab:Code

trace(A)
```


```text:Output
ans = 7
```


```matlab:Code

[V, D]= eig(A) %[Eigien Vector, eigen value of matrix]
```


```text:Output
V = 3x3    
   -0.4165   -0.5877   -0.3707
   -0.1996    0.7428   -0.8162
   -0.8870    0.3206    0.4432

D = 3x3    
    8.3477         0         0
         0   -3.1646         0
         0         0    1.8170

```


```matlab:Code

diag(D)
```


```text:Output
ans = 3x1    
    8.3477
   -3.1646
    1.8170

```


```matlab:Code

% Ax=B

A = [3 -9; 2 4]
```


```text:Output
A = 2x2    
     3    -9
     2     4

```


```matlab:Code

A^-1 %inverse A
```


```text:Output
ans = 2x2    
    0.1333    0.3000
   -0.0667    0.1000

```


```matlab:Code

b = [-42; 2]
```


```text:Output
b = 2x1    
   -42
     2

```


```matlab:Code

z = A^-1 * b % A'*b 안 된다!
```


```text:Output
z = 2x1    
   -5.0000
    3.0000

```


```matlab:Code

z = inv(A) * b % x = A^-1 * b
```


```text:Output
z = 2x1    
   -5.0000
    3.0000

```


```matlab:Code

syms a b c d

M = [a b; c d] % 2 by 2 matrix
```

M = 

   <img src="https://latex.codecogs.com/gif.latex?&space;\left(\begin{array}{cc}&space;a&space;&&space;b\\&space;c&space;&&space;d&space;\end{array}\right)"/>

```matlab:Code

inv(M)
```

ans = 

   <img src="https://latex.codecogs.com/gif.latex?&space;\left(\begin{array}{cc}&space;\frac{d}{a\,d-b\,c}&space;&&space;-\frac{b}{a\,d-b\,c}\\&space;-\frac{c}{a\,d-b\,c}&space;&&space;\frac{a}{a\,d-b\,c}&space;\end{array}\right)"/>

```matlab:Code

rhs = [2; -1]
```


```text:Output
rhs = 2x1    
     2
    -1

```


```matlab:Code

z = inv(M)*rhs % 2 by 1 sol
```

z = 

   <img src="https://latex.codecogs.com/gif.latex?&space;\left(\begin{array}{c}&space;\frac{b}{a\,d-b\,c}+\frac{2\,d}{a\,d-b\,c}\\&space;-\frac{a}{a\,d-b\,c}-\frac{2\,c}{a\,d-b\,c}&space;\end{array}\right)"/>

```matlab:Code

w = [1 -2 -1;2 2 -1;1 1 -2]
```


```text:Output
w = 3x3    
     1    -2    -1
     2     2    -1
     1     1    -2

```


```matlab:Code

o = [6; 1; -1]
```


```text:Output
o = 3x1    
     6
     1
    -1

```


```matlab:Code

z = inv(w)*o
```


```text:Output
z = 3x1    
     3
    -2
     1

```


```matlab:Code

A
```


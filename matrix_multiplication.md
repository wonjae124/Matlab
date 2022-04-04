
```matlab:Code
%% Matlab basic operation

a = [1, 2, 3]
```


```text:Output
a = 1x3    
     1     2     3

```


```matlab:Code

a = [1;2;3]
```


```text:Output
a = 3x1    
     1
     2
     3

```


```matlab:Code

a = [1 2 3; 4 5 6; 7 8 9]
```


```text:Output
a = 3x3    
     1     2     3
     4     5     6
     7     8     9

```


```matlab:Code

a0 = zeros(1,10)
```


```text:Output
a0 = 1x10    
     0     0     0     0     0     0     0     0     0     0

```


```matlab:Code

a0 = zeros(4,4)
```


```text:Output
a0 = 4x4    
     0     0     0     0
     0     0     0     0
     0     0     0     0
     0     0     0     0

```


```matlab:Code

a = [1 2 3; 4 5 6; 7 8 9]
```


```text:Output
a = 3x3    
     1     2     3
     4     5     6
     7     8     9

```


```matlab:Code

b = [9 8 7; 6 5 4; 3 2 1]
```


```text:Output
b = 3x3    
     9     8     7
     6     5     4
     3     2     1

```


```matlab:Code

plus = a+b
```


```text:Output
plus = 3x3    
    10    10    10
    10    10    10
    10    10    10

```


```matlab:Code

minus = a - b
```


```text:Output
minus = 3x3    
    -8    -6    -4
    -2     0     2
     4     6     8

```


```matlab:Code

multiplication = a*b
```


```text:Output
multiplication = 3x3    
    30    24    18
    84    69    54
   138   114    90

```


```matlab:Code

multiplication_transpose = multiplication'
```


```text:Output
multiplication_transpose = 3x3    
    30    84   138
    24    69   114
    18    54    90

```


```matlab:Code

```

# matrix element_wise multiplication

```matlab:Code

element_wise_multiplication = a.*b
```


```text:Output
element_wise_multiplication = 3x3    
     9    16    21
    24    25    24
    21    16     9

```


```matlab:Code

p = rand(4,4)
```


```text:Output
p = 4x4    
    0.4018    0.1839    0.9027    0.3377
    0.0760    0.2400    0.9448    0.9001
    0.2399    0.4173    0.4909    0.3692
    0.1233    0.0497    0.4893    0.1112

```


```matlab:Code

k = ones(4,1)
```


```text:Output
k = 4x1    
     1
     1
     1
     1

```


```matlab:Code

pk = p.*k
```


```text:Output
pk = 4x4    
    0.4018    0.1839    0.9027    0.3377
    0.0760    0.2400    0.9448    0.9001
    0.2399    0.4173    0.4909    0.3692
    0.1233    0.0497    0.4893    0.1112

```


```matlab:Code

```


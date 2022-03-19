
```matlab:Code
%Example 1.21

X = rand(1,4)
```


```text:Output
X = 1x4    
    0.6569    0.6280    0.2920    0.4317

```


```matlab:Code

X<0.5
```


```text:Output
ans = 1x4 logical 배열    
   0   0   1   1

```


```matlab:Code

%Example 1.22
50+randi(50, 1, 12) % randi(k,m,n) 는 set{1,2,...,k}까지의 mXn array를 반환 한다.
```


```text:Output
ans = 1x12    
    51   100    59    56    69    60    75    67    98    97    53    87

```


```matlab:Code

%Example 1.23
s = rng; %생성되는 랜덤 seed를 변수 s에 초기화.
50+randi(50,1,12) 
```


```text:Output
ans = 1x12    
    64    72    78    98    71   100    66    86    84    77    85    84

```


```matlab:Code
rng(s) % rng(변수)로 이전에 저장한 seed를 복원한다.
50+randi(50,1,12)
```


```text:Output
ans = 1x12    
    64    72    78    98    71   100    66    86    84    77    85    84

```


```matlab:Code

```


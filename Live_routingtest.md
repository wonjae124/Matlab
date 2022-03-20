
```matlab:Code
clear;
close all;

% Example
s = [1 1 1 2 2 3 3 3 4];
t = [2 3 4 3 4 1 4 5 5];
weights = [8 6 4 -3 9 -2 -5 6 7];
G = digraph(s,t,weights);
plot(G,'EdgeLabel',G.Edges.Weight)
```


![figure_0.png](Live_routingtest_images/figure_0.png)


```matlab:Code

n = numnodes(G);
A = adjacency(G, 'weighted');
c = full(A);
for i=1:n
    for j=1:n
        if i~=j && c(i,j) == 0 
            c(i,j) = Inf;
        end
    end
end

p = Test_live_bellmanFordRouting(c,5)
```


```text:Output
neighbors = 5x5    
     2     3     4     0     0
     3     4     0     0     0
     1     4     5     0     0
     5     0     0     0     0
     0     0     0     0     0

iteration = 1
prev_p = 1x5    
   Inf   Inf     6     7     0

iteration = 2
prev_p = 1x5    
    11     3     2     7     0

iteration = 3
prev_p = 1x5    
     8    -1     2     7     0

iteration = 4
prev_p = 1x5    
     7    -1     2     7     0

iteration = 5
prev_p = 1x5    
     7    -1     2     7     0

p = 1x5    
     7    -1     2     7     0

p = 1x5    
     7    -1     2     7     0

```


```matlab:Code

```


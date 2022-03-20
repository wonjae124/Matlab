
```matlab:Code
function [p] = Test_live_bellmanFordRouting(c,d)
    %c(x,y): link cost from node x to y;  = Inf if not direct neighbors
    %d: node index of the destination d
    %p(v): current value of cost of path from source v to destination d.
    %prev_p(v): previous value of cost of path from source v to destination d.
    %n: number of nodes
    %num_neighbors(v): number of neighboring nodes of v including itself
    %neighbors(v,1:num_neighbors): array of neighboring nodes of
    
    % A. Calculate the number of nodes from the cost matrix c
    n = size(c,1); %c는 5 X 5 행렬이므로 5를 반환 받는다.

    % A-2. Find the neighboring nodes for each node
    neighbors = zeros(n,n); % 5 X 5 크기 0행렬 
    num_neighbors = zeros(1,n); % 1 X 5 크기의 0행렬 ->각 노드의 이웃 노드의 수
  
    for v=1:n %v는 출발 노드
        for w=1:n % w는 목적지 노드
            if w ~= v % 출발지과 목적지가 다른 경우 True임. 
                if c(v,w) ~= Inf % 출발 노드와 목적 노드가 인접하면 True임. 만약, False이면 아무 것도 안 함
                    num_neighbors(v) = num_neighbors(v) + 1; % 출발 노드와 이웃한 노드의 개수를 카운팅
                    neighbors(v,num_neighbors(v)) = w; % 출발 노드(v)와 이웃노드(num_neighbors(v))로 이웃한 노드의 index(w)로 초기화. 나중에 traverse할 때 저장 된 순서를 돈다. 
                end
            end
        end
    end
    neighbors

    % B. Initialize p
    p = Inf(1,n);
    p(d) = 0; % 목적지노드의 비용은 0
    prev_p = p; 
    
    % C. Loop
    for iteration=1:n
        for v=1:n-1
           set = zeros(1,num_neighbors(v)); %값을 가지고 있을 k개의 0행렬 생성
           
           for k = 1 : num_neighbors(v) %  num_neighbors로 각 노드마다 이웃한 노드의 개수를 사용  neighbors의 각 노드(v) index로 k 를 정한다. 
               q=neighbors(v,k);               %  p=neighbors(v,k)로 출발지 v와 연결 된 이웃 k의 index를 찾는다. 
                                                        %c(v,q)로 해당 이웃간의 거리
                set(k) = c(v,q)+prev_p(q); % 모든 이웃(k)의 거리 합 정보를 set에서 가짐
           end
                p(v) = min(set);                 % 모든 이웃(k) 간의 최소값을 구함
        end
        iteration
        prev_p = p
    end
    
    p % D. Print p
    
end
```
![image](https://user-images.githubusercontent.com/67944072/159161166-542ba355-cc5b-4dfb-84c9-1e51566f420d.png)
![image](https://user-images.githubusercontent.com/67944072/159161174-f06a1cd6-734e-4d43-8f7c-30bb1b8bcc81.png)
![image](https://user-images.githubusercontent.com/67944072/159161181-1e79d0bc-85df-40af-a74c-4e5da51849a2.png)
![image](https://user-images.githubusercontent.com/67944072/159161187-eb351445-ad62-4bc8-b799-164e33a5d233.png)
![image](https://user-images.githubusercontent.com/67944072/159161195-1cdd7eb0-3cd9-4cb4-b6bf-8cdcb0e2c436.png)
![image](https://user-images.githubusercontent.com/67944072/159161206-1ee41200-fe9a-4f1b-b4cf-888be2ea24ef.png)




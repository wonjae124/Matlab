
```matlab:Code
clear;
close all;

n = 4; % number of receivers

G = [1 0.1 0.2 0.3; 0.2 1 0.1 0.1; 0.2 0.1 1 0.1; 0.1 0.1 0.1 1] % channel gains

max_iteration = 30;

p = ones(n,max_iteration+1); % power (initially, 1mW)
SIR = zeros(n,max_iteration);
gamma = [2 2.5 1.5 2]; % target SIRs

noise = 0.1; % mW

for iteration = 2:max_iteration+1
    
          SIR(:, iteration-1) = diag(G.*p(:,iteration-1))./(sum(G*p(:,iteration-1),2)-diag(G.*p(:,iteration-1))+noise)
          % 대각선 성분(1,1,1,1)인 Gii에 .* 로 이전 시간의 power를 .*로 곱한다.(element_wise)
          % sum(A, dim)에서 dim=2으로 곱해서 만든 각 행의 합을 열벡터로 만든다.
          % 매틀랩에서 통째로 분모 나누는 것은 ./ 사용한다.
          p(:,iteration) = (gamma'./SIR(:, iteration-1)).*p(:,iteration-1)
%         SIR(i,iteration-1) = G(i,i)*p(i,iteration-1)/(s+noise) %%SIR
%         p(i,iteration) = round((gamma(i)*p(i,iteration-1)) /SIR(i,iteration-1),2)
   
end
```

# check inequality tightly %%

```matlab:Code
D = diag(gamma)
Z = zeros(4,4)
F = G-diag([diag(G)])
v = gamma'*noise./diag(G)

check = round(D*F*p(:,31)+v,2)

figure(1);
plot(p')
xlabel('iteration');
ylabel('power (mW)');
legend('link 1', 'link 2', 'link 3', 'link 4');

figure(2);
plot(SIR')
xlabel('iteration');
ylabel('SIR');
legend('link 1', 'link 2', 'link 3', 'link 4');
```


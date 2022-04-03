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
    for i = 1:n %% IMPLEMENT DISTRIBUTED POWER CONTROL %%
        s= 0;    
        for j = 1:n
             if j~=i
                   s = s + G(i,j)*p(j,iteration-1);
%                   SIR(i,iteration-1) = round(G(i,i)*p(i,iteration-1)/(( G(i,j)*p(j,iteration-1))+noise),2) %%SIR     
             end      
        end
        SIR(i,iteration-1) = round(G(i,i)*p(i,iteration-1)/(s+noise),2) %%SIR                
        p(i,iteration) = round((gamma(i)*p(i,iteration-1)) /SIR(i,iteration-1),2)
    end 
   
end

p(:,31)

%% check inequality tightly %% 
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

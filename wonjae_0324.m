arr = 64;
first = 20;
last = 39;


% [0도 일 때]
% for i:  %n_row를 계속 증감연산자로 증가시킨다. n_row는 20부터 39까지 20번만 나오면 된다. 




for i = 20:39
    x = (arr*(i))+first : (arr*(i))+last 
    z = i
%    y = (arr*(n_row+1)+first):(arr*(n_row+1)+last)
end

% [36도 일 때] 
% 배치(연속되는 숫자)가 가장 많은 지점의 인덱스를 구해서 n_row로 설정한다.
% 그 지점에서 아래 19번 row까지 내려가며 계속 20개씩 뽑으면 된다. 
% 사라진 미니배치는 걱정 없는게 최대 배치수 63이라 그 중 20개는 Ok.
% 내가 지금 검증하면 되는 것은 사실인지이다.






for i = 20:39
%    starter(i) = [(64.*i + 20);(64.*i + 39)] 
end
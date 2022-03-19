%Example 1.21

X = rand(1,4)

X<0.5

%Example 1.22
50+randi(50, 1, 12) % randi(k,m,n) 는 set{1,2,...,k}까지의 mXn array를 반환 한다.

%Example 1.23
s = rng; %생성되는 랜덤 seed를 변수 s에 초기화.
50+randi(50,1,12) 
rng(s) % rng(변수)로 이전에 저장한 seed를 복원한다.
50+randi(50,1,12)


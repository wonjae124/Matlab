past_row = 0
max_row = 0

num_batchs = 0
max_batchs = 0
total_batchs = 0
start_batch = double('1') % char -> double
loss_batchs = double('0')

files_info = natsortfiles(dir(fullfile("tekbA_LR_R_rot_36_*.png"))) % TODO 회의용PC의 matlab에 natsortfiles 애드온 설치 필요



y= files_info(1).name
N = numel(files_info)
past_batch = start_batch

for i = 1:length(files_info)
    
    filename = files_info(i).name
    token = strsplit(filename,'_')                              %이미지 위치를 특정하기 위해서 토큰으로 쪼갬
    batch_loc_cell = token(6)                                  %TODO 우리가 사용할 파일 이름의 뒤에는 Real이 있으므로 token(7)로 변경만 하면 된다.
    batch_cell_pos = erase(batch_loc_cell, ".png") % TODO. 홀로그램에서는 필요 없음으로 제거한다.
    batch_loc_char = cell2mat(batch_cell_pos)                            %  셀형->행렬->문자형->문자열->숫자형으로 변환
    batch_loc_str =  convertCharsToStrings(batch_loc_char)
    present_batch = double(batch_loc_str)
    total_batchs = total_batchs+1
    
    if (present_batch - past_batch) == 1               
        num_batchs = num_batchs + 1
            
    else
         loss_batchs = present_batch - past_batch -1              
        if(max_batchs<num_batchs)
            max_batchs = max(max_batchs,num_batchs)
            max_row = past_row
        else
            
        end
        
        num_batchs = 1
        past_row = past_row+1
    end
    past_batch = present_batch
    
%    position = batch_loc_char(
end

%past_batch = int8(1)
%present_batch = int8(2)



%TODO 
% 
% 파일명의 이름 중에서 위치를 나타내는 토큰을 뽑아내야 한다.
% strsplit과 token으로 위치를 뽑아내고
% 계산을 하려면 int8로 바꾸면 된다.

%  camparsion 
%  past_batch = start_batch; % initial
%  if present_batch- past_batch == 1:
%      num_batchs += 1
%     
%   else present_row+=1
%     loss_batchs = present_batch-past_batch-1
%     num_batchs = 0
%     total_row += 1
%     max_rows = max(past_row,max_row)
% 
%  end
%  
% max_row
% total_row

% Tommorow TODO
% 서주연 조교님의 아이디어로 앞에 사라져버린 비어 있는 부분을 보충하는게 가능은 하다. 차이를 저장해두었다가 더하기만 하면 정사각형의 위치를 반환 할 수 있기 때문이다.
% 일단, 가능한지 알려면 우리가 추출한 이미지의 총 배치가 64X64 개인지 63X63개인지 알아야 한다. total_row도 알아둬야 겠다.
%  for i = max_rows : max_rows +19:
%     copy(max_rows
% end


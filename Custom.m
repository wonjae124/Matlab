function Custom(root_dir, ratio)

% reference : https://kr.mathworks.com/matlabcentral/answers/828953-i-need-to-create-two-test-and-train-folder-from-one-parent-folder-in-the-same-directory-i-wrote-t#answer_698723

files_info = dir( fullfile (root_dir, "*_real.png" ));       % wildecard 이외에 별도로 underscore(언더바 _ )를 붙여줘야 분할 정상 작동
                                                             % fullfile(src,thing)로 폴더 내 해당하는 모든 파일을 가져온다. dir로 경로, 파일명, 날짜 등의 정보를 가져온다.
prefix = {};  % 파일의 이름 와일드 카드 한글명
N = numel(files_info); % 파일의 개수
rand_idx = randperm(N) <= (ratio*N); % ratio만큼의 파일을 train 폴더로 보내기 위한 원핫인코딩 
mkdir('train')
mkdir('test')

for i = 1:length(files_info)
   prefix = files_info(i).name(1:end-9);  % 마지막의 _imag.png를 제거.  ex) "quantref_홀로그램 이미지 이름_flip 방향(LR/UD/ORG)_R_rot_각도_패치 위치"
                                                    
   prefix_wild = strcat(prefix,"_*");           % 폴더내 관련 된 모든 파일을 찾는 와일드 카드 지정
   if rand_idx(i)
       copyfile(prefix_wild,"train")             
   else
       copyfile(prefix_wild,"test")
   end

end
fprintf('job done \n')
return;
end

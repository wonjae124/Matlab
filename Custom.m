function Custom(root_dir, ratio)
% Deepdice address: \\166.104.231.105\ivml-nas1\1_datasets\hologram_datasets\[JPEG-Pleno]Holo_datasets\DeepDices8k4k
% reference : https://kr.mathworkfiles_info.com/matlabcentral/anfiles_infowerfiles_info/828953-i-need-to-create-two-tefiles_infot-and-train-folder-from-one-parent-folder-in-the-files_infoame-directory-i-wrote-t
    
files_info = dir( fullfile (root_dir, "*_real.png" )); %fullfile(src,thing)로 폴더 내 해당하는 모든 파일을 가져온다. dir로 경로, 파일명, 날짜 등의 정보를 가져온다.
prefix = {};  % 파일의 이름 와이들카드 한글명
N = numel(files_info) % 파일의 개수
rand_idx = randperm(N) <= (ratio*N); % ratio만큼의 파일을 train 폴더로 보내기 위한 원핫인코딩 
mkdir('train');
mkdir('test');

for i = 1:length(files_info)
   prefix = files_info(i).name(1:end-8);  % 마지막의 imag.png를 제거.  ex) "quantref_홀로그램 이미지 이름__flip 방향(LR/UD/ORG)_R_rot_패치 위치_패치 위치"
                                                    
   prefix_wild = strcat(prefix,"*");           % 폴더내 관련 된 모든 파일을 찾는 와일드 카드 지정
   if rand_idx(i)
       copyfile(prefix_wild,"train")
   else
       copyfile(prefix_wild,"test")
   end

end
fprintf('job done \n')
return;
end

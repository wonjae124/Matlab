% reference : httpfiles_info://kr.mathworkfiles_info.com/matlabcentral/anfiles_infowerfiles_info/828953-i-need-to-create-two-tefiles_infot-and-train-folder-from-one-parent-folder-in-the-files_infoame-directory-i-wrote-t
root_dir = "C:\Users\user\Desktop\holo sample patch2"
ratio = 9.0

files_info = dir( fullfile (root_dir, "*_real.png" )); %fullfilehh(src,thing)로 폴더 내 해당하는 모든 파일을 가져온다. dir로 경로, 파일명, 날짜 등의 정보를 가져온다.
prefix_0 = ["_3000_*","_3001_*","_3002_*"];  % 파일의 이름 와이들카드 한글명
prefix_36 = {}
prefix_72 = {}
prefix_108 = {}
prefix_144 = {}




N = numel(files_info); % 파일의 개수
rand_idx = randperm(N) <= (ratio*N) % ratio만큼의 파일을 train 폴더로 보내기 위한 원핫인코딩 
mkdir('train')
mkdir('test')




for i = 1:length(files_info)
   prefix = files_info(i).name(1:end-15);  % 마지막의 _imag.png를 제거.  ex) "quantref_홀로그램 이미지 이름__flip 방향(LR/UD/ORG)_R_rot_패치 위치_패치 위치"
   y = strcat(prefix, prefix_0(i))           % 폴더내 관련 된 모든 파일을 찾는 와일드 카드 지정
   if rand_idx(i)
       copyfile(y,"train")             
   else
       copyfile(y,"test")
   end

end
fprintf('job done \n')
return;


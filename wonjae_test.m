files_info = dir(fullfile("quantref_ballet8k4k_022_ORG_R_rot_36_*_real.png"))

%newStr = split(files_name.name)
y = files_info.name

n = numel(files_info)
%g = split(y)   
token = strsplit(y,'_') % 파일명을 토큰으로 나눔. 
%x = strsplit(g,'_')
w = token(8);
z = cell2mat(w)
k = str2num(rot_0)

batch_idx = token(8) % 배치의 위치를 가져 옴.

rot_0 = ["1300", "1301", "1302", "1303", "1304", "1305", "1306", "1307", "1308", "1309", "1310", "1311", "1312", "1313", "1314", "1315", "1316", "1317", "1318","1319"]

% rot_0의 2~19번째 row를 저장 하는 방법을 찾자

for i = 1:length(rot_0)
%   y = file_name.name
   filename = files_info(i).name
   token = strsplit(filename,'_')
   batch_loc = token(5)
%   prefix = files_info(i).name(1:end-8)
%   prefix_idx = strcat(prefix,rot_0(i))
   init_wildcard = '*_'
   prefix_idx = strcat(init_wildcard,batch_loc)
   prefix_idx = strcat(prefix_idx,"_")
   prefix_idx = strcat(prefix_idx,rot_0(i))
   prefix_idx = strcat(prefix_idx, "_*")
   copyfile(prefix_idx, 'good')
end

rot_36 = []
rot_72 = []
rot_108 = []
rot_144 = []

prefix

for i = 1:20
    

end

% 이미지 생성시 위치 제공 코드 : \\166.104.231.105\ivml-nas1\서주연\run_ImageDataAugmenter
% 실제 이미지의 위치를 제공해준게 맞구나... 근데 crop 되면서 패치가 사라진다는게... 잘 모르겠네.. 그럼 파일의 위치정보랑
% 파일의 이름이랑은 이제 무관한것 아닌가? 

NumRotImg = 5;
RotAng = 0 : 180/NumRotImg : 180;
%     RotAng(1) = [];    

R = imread(Lenna.png)
I = imread(Lenna.png)
for i=1:NumRotImg
    rotR = imrotate(R, RotAng(i), 'bicubic', 'crop');    
    rotI = imrotate(I, RotAng(i), 'bicubic', 'crop');
    rotR_LR = imrotate(flippedR_LR, RotAng(i), 'bicubic', 'crop');
    rotI_LR = imrotate(flippedI_LR, RotAng(i), 'bicubic', 'crop');
    rotR_UD = imrotate(flippedR_UD, RotAng(i), 'bicubic', 'crop');        
    rotI_UD = imrotate(flippedI_UD, RotAng(i), 'bicubic', 'crop');        
    
    for r = 1: NumPatchH
        for c = 1: NumPatchW
        end
    end
end



            



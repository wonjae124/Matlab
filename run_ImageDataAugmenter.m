clc; clear; close all;

matFiles = dir('refIHolograms\training_holograms\*.mat'); 
numfiles = length(matFiles);
PatchBlkSize = 256;

if exist('augmentedImg') == 0
    mkdir augmentedImg\
    mkdir ./augmentedImg/color
    mkdir ./augmentedImg/color/real
    mkdir ./augmentedImg/color/imag
    mkdir ./augmentedImg/mono
    mkdir ./augmentedImg/mono/real
    mkdir ./augmentedImg/mono/imag
end


for j = 1:numfiles 
    holodata = load([matFiles(j).folder '\' matFiles(j).name]); 
    [filepath, fname, ext] = fileparts([matFiles(j).folder '\' matFiles(j).name]);
    
%     R = real(holodata.Xqref);
%     I = imag(holodata.Xqref);
    R = real(holodata.Qcodec);
    I = imag(holodata.Qcodec);
    [H, W, C] = size(R);    
    NumPatchH = floor(H/256);
    NumPatchW = floor(W/256);    
    
    % Flip images
    flippedR_LR = fliplr(R);
    flippedI_LR = fliplr(I);
    flippedR_UD = flipud(R);
    flippedI_UD = flipud(I);

    % rescale images
%     scaledimgDown = imresize(holodata, 0.5);
%     scaledimgUp = imresize(holodata, 2);
    
    %% Rotate images
    NumRotImg = 5;
    RotAng = 0 : 180/NumRotImg : 180;
%     RotAng(1) = [];    

    for i=1:NumRotImg
        rotR = imrotate(R, RotAng(i), 'bicubic', 'crop');    
        rotI = imrotate(I, RotAng(i), 'bicubic', 'crop');
        rotR_LR = imrotate(flippedR_LR, RotAng(i), 'bicubic', 'crop');
        rotI_LR = imrotate(flippedI_LR, RotAng(i), 'bicubic', 'crop');
        rotR_UD = imrotate(flippedR_UD, RotAng(i), 'bicubic', 'crop');        
        rotI_UD = imrotate(flippedI_UD, RotAng(i), 'bicubic', 'crop');        
        
        for r = 1: NumPatchH
            for c = 1: NumPatchW
                if r*PatchBlkSize < H && c*PatchBlkSize < W % boundary check   
                    for p=1:3 
                        switch p
                            case 1
                                patchBlk_R = rotR(1+(r-1)*PatchBlkSize:r*PatchBlkSize, 1+(c-1)*PatchBlkSize:c*PatchBlkSize,:);
                                patchBlk_I = rotI(1+(r-1)*PatchBlkSize:r*PatchBlkSize, 1+(c-1)*PatchBlkSize:c*PatchBlkSize,:);
                                prefix = "ORG";
                            case 2                                
                                patchBlk_R = rotR_LR(1+(r-1)*PatchBlkSize:r*PatchBlkSize, 1+(c-1)*PatchBlkSize:c*PatchBlkSize,:);
                                patchBlk_I = rotI_LR(1+(r-1)*PatchBlkSize:r*PatchBlkSize, 1+(c-1)*PatchBlkSize:c*PatchBlkSize,:);
                                prefix = "LR";
                            case 3
                                patchBlk_R = rotR_UD(1+(r-1)*PatchBlkSize:r*PatchBlkSize, 1+(c-1)*PatchBlkSize:c*PatchBlkSize,:);
                                patchBlk_I = rotI_UD(1+(r-1)*PatchBlkSize:r*PatchBlkSize, 1+(c-1)*PatchBlkSize:c*PatchBlkSize,:);
                                prefix = "UD";                            
                        end
                        WriteFileR = true;                
                        for k=1:floor(size(patchBlk_R,1)/10):size(patchBlk_R,1)
                            for l=1:floor(size(patchBlk_R,2)/10):size(patchBlk_R,2)
                                temp = patchBlk_R(k:k+3, l:l+3);
                                if sum(temp)==0
                                    WriteFileR = false;
                                    break;
                                end
                            end
                        end                
                        WriteFileI = true;                
                        for k=1:floor(size(patchBlk_I,1)/10):size(patchBlk_I,1)
                            for l=1:floor(size(patchBlk_I,2)/10):size(patchBlk_I,2)
                                temp = patchBlk_I(k:k+3, l:l+3);
                                if sum(temp)==0
                                    WriteFileI = false;
                                    break;
                                end
                            end
                        end                
                        if WriteFileR == true
                            if size(patchBlk_R, 3) == 3
                                rotfilename = sprintf('augmentedImg/color/Real/%s_%s_R_rot_%.0f_%d.png', fname, prefix, RotAng(i), NumPatchW*(r-1)+c);
                            else
                                rotfilename = sprintf('augmentedImg/mono/Real/%s_%s_R_rot_%.0f_%d.png', fname, prefix, RotAng(i), NumPatchW*(r-1)+c);
                            end                            
                            imwrite(patchBlk_R, rotfilename);                
                        end    
                        if WriteFileI == true
                            if size(patchBlk_R, 3) == 3
                                rotfilename = sprintf('augmentedImg/color/Imag/%s_%s_R_rot_%.0f_%d.png', fname, prefix, RotAng(i), NumPatchW*(r-1)+c);                                
                            else
                                rotfilename = sprintf('augmentedImg/mono/Imag/%s_%s_R_rot_%.0f_%d.png', fname, prefix, RotAng(i), NumPatchW*(r-1)+c);
                            end                                                        
                            imwrite(patchBlk_I, rotfilename);                
                        end    
                    end         
                end            
            end
        end    
    end
end
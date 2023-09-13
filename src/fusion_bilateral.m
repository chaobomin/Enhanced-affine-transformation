function FI = fusion_bilateral(I_CCD_current,I_IR_current)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

    [hei,wid] = size(I_CCD_current);

    r = 2;
    thda_s = 7;%the sensitivity of the spatial similarity
    thda_r = 0.5;%the sensitivity of the range (intensity/color) similarity
    I_CCD_current_d = double(I_CCD_current)./double(max(I_CCD_current(:)));
    I_IR_current_d = double(I_IR_current)./double(max(I_IR_current(:)));

    I_CCD_current_m = round(10000 .* I_CCD_current ./ 255);
    base_layer_o = I_CCD_current_d;


    for i = (r + 1) : (hei - r)
        for j = (r + 1) : (wid - r)
            base_layer_o(i,j) = bilateral_filter_kernel_o(I_CCD_current,I_CCD_current,i,j,r,thda_s,thda_r);%[0 1]base layer
        end
    end

    detail_layer_o = I_CCD_current_d - base_layer_o;
    d = detail_layer_o;
    detail_display = d ./ max(d(:));
    FI = detail_display + I_IR_current_d;
    FI(FI<0) = 0;
    FI = FI./1;
end


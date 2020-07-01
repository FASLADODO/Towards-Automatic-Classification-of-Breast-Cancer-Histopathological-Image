function [ Threshold_levels ] = Muti_Thresholding_Otsu( n, image)
%
%   Detailed explanation goes here
% Assuming n is exponent of 2

if isgray(image)
   flag = 1; 
else
   flag = 0;
end

if flag == 1
    nbins = 255;
    Ihist = imhist(image, nbins);
    Threshold_levels = recur(Ihist, 1, 255, 1, 4);
end

end

function Thresholds = recur(I_hist, nbins_start, nbins_end, curr, n)
    if curr >= n
        Thresholds = -1;
        return;
    else
       %Carry out segmentation
       counts = I_hist(nbins_start : nbins_end);
       p = counts / sum(counts); %mapping into a new sequence
       new_end = nbins_end - nbins_start + 1;

       for t = 1 : new_end
           q_L = sum(p(1 : t));
           q_H = sum(p(t + 1 : end));
           miu_L = sum(p(1 : t) .* (1 : t)') / q_L;
           miu_H = sum(p(t + 1 : end) .* (t + 1 : new_end)') / q_H;
           sigma_b(t) = q_L * q_H * (miu_L - miu_H)^2;
       end

       [~, y] = max(sigma_b(:));
       y = nbins_start + y - 1;
       %define Left Child & Right Child
       Thresholds_Left = recur(I_hist, nbins_start, y, 2 * curr, n);
       Thresholds_Right = recur(I_hist, y, nbins_end, 2 * curr + 1, n);
       if min(Thresholds_Left) ~= -1 && min(Thresholds_Right) ~= -1  
           Thresholds = [Thresholds_Left y Thresholds_Right];
       else
           %since this is a complete binary tree,
           Thresholds = [y];
       end 
    end

end



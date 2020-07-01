function [ label ] = Threshold_label( I, threshold )
%
%   Detailed explanation goes here
if isgray(I)
   flag = 1; 
else
   flag = 0;
end

if flag == 1
   [row, col] = size(I);
   J(:,:,1) = zeros(row, col);
   for i = 1 : row
      for j = 1 : col
         if I(i,j) > threshold
             J(i,j,1 : 3) = [255 255 2555];
         else
             J(i,j,1 : 3) = [0 0 0];
         end
      end
   end
   label = uint8(J);
end

end

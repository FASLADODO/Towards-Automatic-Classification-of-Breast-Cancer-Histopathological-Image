% Sample use:
% 
 %img = imread('1111.png');
 img = imread('flower.jpg');
 gaborArray = gaborFilterBank(5,8,39,39);  % Generates the Gabor filter bank
 featureVector = gaborFeatures(img,gaborArray,128,128);%4,4);   % Extracts Gabor feature vector, 'featureVector', from the image, 'img'.
 featureVector'
% 
% 
%   Details can be found in:
%   
%   M. Haghighat, S. Zonouz, M. Abdel-Mottaleb, "Identification Using 
%   Encrypted Biometrics," Computer Analysis of Images and Patterns, 
%   Springer Berlin Heidelberg, pp. 440-448, 2013.
% 
% 
% (C)	Mohammad Haghighat, University of Miami
%       haghighat@ieee.org
%       I WILL APPRECIATE IF YOU CITE OUR PAPER IN YOUR WORK.

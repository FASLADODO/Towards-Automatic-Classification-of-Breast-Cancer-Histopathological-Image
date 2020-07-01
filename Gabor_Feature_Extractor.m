function [Features] = Gabor_Feature_Extractor(image)
%==================== prepare image Data  =================================
imgGray = double(rgb2gray(image))/255;
%==========================================================================
%================ SVD Singular Value Decomposition Features ===============
        Segma =[];
        %Segma = (double(svds(imgGray,300)))';
%==========================================================================
%======================= CLBP Image Features ==============================
        LBP_Feature =[];
        LBP_Feature= extractLBPFeatures(imgGray,'Upright',false);
%==========================================================================
%======================= Apply Wavelet Transform===========================
%======================= CLBP Wavelet Features ============================
        WavletFeature=[];
        %wname = 'sym4';
        %[CA,CH,CV,CD] = dwt2(imgGray,wname,'mode','per');
        %LBP_CA = extractLBPFeatures(CA,'Upright',false);
        %LBP_CH = extractLBPFeatures(CH,'Upright',false);
        %LBP_CV = extractLBPFeatures(CV,'Upright',false);
        %LBP_CD = extractLBPFeatures(CD,'Upright',false);
        %WavletFeature=[LBP_CA LBP_CH LBP_CV LBP_CD];
%==========================================================================
%======================= CLBP Gabor Features ============================
%%          %gaborArray = gabor([2 4],[0 30 60 90 120 150]);
        GaborFeature=[];
        gaborArray = gaborFilterBank(2,6,39,39);  %23,35 Generates the Gabor filter bank
        featureVector = gaborFeatures(imgGray,gaborArray,115,175);%128,128);%4,4);   % Extracts Gabor feature vector, 'featureVector', from the image, 'img'.           
        GaborFeature= featureVector';
%==========================================================================
%========== ADD All extracted features in The Feature ARRAY  ==============
Features =[GaborFeature WavletFeature Segma LBP_Feature];
%===============================THE END====================================
end

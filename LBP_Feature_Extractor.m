function [Features] = LBP_Feature_Extractor(image)
%==================== prepare image Data  =================================
imgGray = double(rgb2gray(image))/255;
%==========================================================================
%================ SVD Singular Value Decomposition Features ===============
        Segma =[];
        Segma = (double(svds(imgGray,100)))';
%==========================================================================
% Upright = true  is u LBP   do not encode rotation information
% Upright = false is ri LBP  rotationally invariant features are required.
%======================= CLBP Image Features ==============================
        LBP_Feature =[];
        LBP_Feature= extractLBPFeatures(imgGray,'Upright',false);
%==========================================================================
%======================= Apply Wavelet Transform===========================
%======================= CLBP Wavelet Features ============================
        WavletFeature=[];
        wname = 'sym4';
        [CA,CH,CV,CD] = dwt2(imgGray,wname,'mode','per');
        LBP_CA = extractLBPFeatures(CA,'Upright',false);
        LBP_CH = extractLBPFeatures(CH,'Upright',false);
        LBP_CV = extractLBPFeatures(CV,'Upright',false);
        LBP_CD = extractLBPFeatures(CD,'Upright',false);
        WavletFeature=[LBP_CA LBP_CH LBP_CV LBP_CD];
%==========================================================================
%======================= CLBP Gabor Features ============================
%%      % Create array of Gabor filters, called a _filter bank_. 
        % This filter bank contains two orientations and two wavelengths. 
        % Create Gabor Array
            %gaborArray = gabor([2 4],[0 15 30 45 60 75 90 105 120 135 150 165]);
            %gaborArray = gabor([2 4],[0 30 60 90 120 150]);
            %gaborArray = gabor([2 4 6],[0 30 60 90]);
            %gaborArray = gabor([2 4 6],[0 30 60 90 120 150]);
        GaborFeature=[];
        %gaborArray = gabor([2 3 4 5 6],[0 15 30 45 60 75 90 105 120 135 150 165]);
        gaborArray = gabor([2 4],[0 30 60 90 120 150]);
        FGabor=[];
        for p = 1:12
          theta = gaborArray(p).Orientation;
          lambda = gaborArray(p).Wavelength;
          [mag,phase] = imgaborfilt(imgGray,lambda,theta);
          % Extract LBP features from the images to encode their texture information.
          % Set 'Upright' to false when rotationally invariant features are required.
          LBP_Phase = extractLBPFeatures(phase,'Upright',false);     
          LBP_mag = extractLBPFeatures(mag,'Upright',false);     
          FGabor=[FGabor,LBP_Phase,LBP_mag];
        end           
        GaborFeature= FGabor;
%==========================================================================
%========== ADD All extracted features in The Feature ARRAY  ==============
Features =[GaborFeature WavletFeature Segma LBP_Feature];
%===============================THE END====================================
end

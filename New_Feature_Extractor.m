function [Features] = New_Feature_Extractor(image)
%==================== prepare image Data  =================================
imgGray = double(rgb2gray(image))/255;
%==========================================================================
%================ SVD Singular Value Decomposition Features ===============
        Segma =[];
        Segma = (double(svds(imgGray,300)))';
%==========================================================================
% u LBP   do not encode rotation information
% ri LBP  rotationally invariant features are required.
% points. Possible values for MAPPINGTYPE are 'u2'uniform LBP 
% 'ri'rotation-invariant LBP 'riu2'uniform rotation-invariant LBP.
%======================= CLBP Image Features ==============================
        CLBP_Feature =[];
        mapping=getmapping(8,'u2'); 
        [CLBP_SH,CLBP_MH]=clbp(image,1,8,mapping,'h'); 
        CLBP_Feature =[CLBP_SH CLBP_MH];
%==========================================================================
%======================= Apply Wavelet Transform===========================
%======================= CLBP Wavelet Features ============================
        WavletFeature=[];
        %wname = 'sym4';
        %[CA,CH,CV,CD] = dwt2(imgGray,wname,'mode','per');
        %mapping=getmapping(8,'u2'); 
        %[CLBP_SHA,CLBP_MHA]=clbp(CA,1,8,mapping,'h');
        %mapping=getmapping(8,'u2'); 
        %[CLBP_SHH,CLBP_MHH]=clbp(CH,1,8,mapping,'h');
        %mapping=getmapping(8,'u2'); 
        %[CLBP_SHV,CLBP_MHV]=clbp(CV,1,8,mapping,'h');
        %mapping=getmapping(8,'u2'); 
        %[CLBP_SHD,CLBP_MHD]=clbp(CD,1,8,mapping,'h');
        %WavletFeature=[CLBP_SHA CLBP_MHA CLBP_SHH CLBP_MHH CLBP_SHV CLBP_MHV CLBP_SHD CLBP_MHD];
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
        gaborArray = gabor([2 3 4 5 6],[0 15 30 45 60 75 90 105 120 135 150 165]);
        gaborArray = gabor([2 4],[0 30 60 90 120 150]);
        FGabor=[];
        for p = 1:12
         theta = gaborArray(p).Orientation;
         lambda = gaborArray(p).Wavelength;
          [mag,phase] = imgaborfilt(imgGray,lambda,theta);
          mapping=getmapping(8,'u2');
          [CLBP_SHGm,CLBP_Mm]=clbp(mag,1,8,mapping,'h');   
          mapping=getmapping(8,'u2');
          [CLBP_SHGp,CLBP_Mp]=clbp(phase,1,8,mapping,'h');   
          FGabor=[FGabor,CLBP_SHGp,CLBP_Mp,CLBP_SHGm,CLBP_Mm];
        end           
        GaborFeature= FGabor;
%==========================================================================
%========================= CLBP Gabor Features ============================
%%  
        Gabor=[];
    %    gaborArray = gaborFilterBank(2,6,39,39);  %Generates the Gabor filter bank
    %    featureVector = gaborFeatures(imgGray,gaborArray,115,175);%128,128);%4,4);   % Extracts Gabor feature vector, 'featureVector', from the image, 'img'.           
    %    Gabor= featureVector';
%==========================================================================
%========== ADD All extracted features in The Feature ARRAY  ==============
Features =[GaborFeature WavletFeature Segma CLBP_Feature Gabor];
%===============================THE END====================================
end

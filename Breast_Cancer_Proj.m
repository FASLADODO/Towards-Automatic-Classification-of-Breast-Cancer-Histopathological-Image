clc,close all, clear all  %,drawnow
Mypath = strcat(pwd,'\');
%Eperimental Directory
traindir = 'Exper_M01';
%TrainType=0;   %Gabor Features
TrainType=1;  %New  Feature Extractor (CLBP of Wavelet &  Gabor + SVD200 
%TrainType=2;  %SVD  Feature Extractor
%TrainType=2;  %LBP  Upright True  Feature Extractor
%TrainType=3;  %CLBP Feature Extractor
%TrainType=5;  %GLCM Feature Extractor
%TrainType=6;  %Wavelet momentFeature Extractor
%TrainType=7;  %LBP Upright false Feature Extractor
%TrainType=8;  %Histogram
%TrainType=9;  %NMFImage Feature Extractor
%TrainType=10; %SVDCLBP02 Feature Extractor
%TrainType=11; %SVDCLBP03 Feature Extractor
%TrainType=12;  %CLBP Feature Extractor+SVDFeaturesv #Values
%TrainType=13; %Gabor Feature Extractor
%TrainType=14; %Wavelet_Gabor_CLBP_SVD200_ature Extractor
%TrainType=15;  %uCLBP_Gabor_SVD200_feature Extractor
%============= The Main menu  =================================
    while 1
        choice = menu('choose desired function','Pareper_data','Paraper_Gaussaindata','GMClassifier','exit');
        if choice==1;
           clc;
           Paraper_data(Mypath,TrainType);
        else
        if choice==2;
            clc;
            Paraper_Gaussaindata(Mypath);
           else
        if choice==3;
           GMClassifier(Mypath);
        end
        if choice==4;
              break;
        end
        end
        end
    end
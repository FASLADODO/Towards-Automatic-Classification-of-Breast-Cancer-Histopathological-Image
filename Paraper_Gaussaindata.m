function [Xtr1, Xtr2, Xte, Yte]=Paraper_Gaussaindata(Mypath)
%Eperimental Directory
traindir = 'Exper_M01';
XX=[];YY=[];
Xte=[];Yte=[];
Xtr1=[];Ytr1=[];Xtr2=[];Ytr2=[];
% 1:Train data  2:Test data
for DataType=1:2  %data Type Training or Test
      
      for cno=1:2 %Class no. 1 or 2   
          [XX YY]=TrainIt(DataType,traindir,cno);
            if (DataType==1)
               if  (cno==1) %Save Alll Train Data Class 1
                   Xtr1=[Xtr1;XX];
                   Ytr1=[Ytr1;YY];
               else         %Save Alll Train Data Class 2
                   Xtr2=[Xtr2;XX];
                   Ytr2=[Ytr2;YY];
               end    
            else %Save Alll Test Data Class 1,2
               Xte=[Xte;XX];
               Yte=[Yte;YY];
            end
      end
%=========================Write Data To disk===============================
    if (DataType==1) 
        %Save To Disk Train Data Class 1
        sfile= strcat(Mypath,'TDClass1X.mat');
        save(sfile,'Xtr1');
        sfile= strcat(Mypath,'TDClass1Y.mat');
        save(sfile,'Ytr1');  
        %==================
        sfile= strcat(Mypath,'TDClass2X.mat');
        save(sfile,'Xtr2');
        sfile= strcat(Mypath,'TDClass2Y.mat');
        save(sfile,'Ytr2');
        %===================
    else
        sfile= strcat(Mypath,'TestDataX.mat');
        save(sfile,'Xte');
        sfile= strcat(Mypath,'TestDataY.mat');
        save(sfile,'Yte');
   end
%==========================================================================

end

end

function Paraper_data(Mypath,TrainType)
%Eperimental Directory
traindir = 'Exper_M01';
Xtr=[];Ytr=[];Xte=[];Yte=[];XX=[];YY=[];
% 1:Train data  2:Test data
for DataType=2:2 %for DataType =1 : 2 
    for cno=1:2   
        [XX YY]=TrainIt(DataType,traindir,cno,TrainType);
        if (DataType==1)
           Xtr=[Xtr;XX];
           Ytr=[Ytr;YY];
        else
            Xte=[Xte;XX];
            Yte=[Yte;YY];
            
        end
    end
%=========================Write Data To disk===============================
    if (DataType==1) 
        sfile= strcat(Mypath,'TrainDataX.mat');
        save(sfile,'Xtr');
        sfile= strcat(Mypath,'TrainDataY.mat');
        save(sfile,'Ytr');
        %Xte=[Yte Xte];
    end
   if (DataType==2)
        sfile= strcat(Mypath,'TestDataX.mat');
        save(sfile,'Xte');
        sfile= strcat(Mypath,'TestDataY.mat');
        save(sfile,'Yte');
        Xte=[Yte Xte];
        sfile= strcat(Mypath,'TrainDataX.mat');
        save(sfile,'Xte');
   end
%==========================================================================

end

end


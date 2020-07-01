function GMClassifier(Mypath)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
        display(Mypath);
        sfile= strcat(Mypath,'TDClass1X.mat');
        load(sfile,'Xtr1');
        sfile= strcat(Mypath,'TDClass2X.mat');
        load(sfile,'Xtr2');
        sfile= strcat(Mypath,'TestDataX.mat');
        load(sfile,'Xte'); 
        sfile= strcat(Mypath,'TestDataY.mat');
        load(sfile,'Yte');

%===============================================================================
TClass=Yte;
Class1=Xtr1;
Class2=Xtr2;        
%==============
MU1=mean(Class1);
SIGMA=var(Class1);
Covy1=cov(Class1);
SIGMA1 =diag(SIGMA);
MU2=mean(Class2);
SIGMA=var(Class2);
Covy2=cov(Class2);
SIGMA2 =diag(SIGMA);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MU=[MU1; MU2];
SIGMA=cat(3,SIGMA1,SIGMA2)
p=[0.4 ;0.7];
gm=gmdistribution(MU,SIGMA,p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P2=posterior(gm,Xte);
Class1_Error=sum(abs(MU1-gm.mu(1,:)));
Class2_Error=sum(abs(MU1-gm.mu(2,:)));
fprintf('\n');
if (Class1_Error>Class2_Error) 
    fprintf('Class1 result in column2 \n');
    Cl=2;
else
    fprintf('Class1 result in column1 \n');
    Cl=1;
end
fprintf('\n');
[R1 C1]=size(P2);
%[R2 C2]=size(Xte);
res1=0;
%res2=0;
mysum=0;
pclass=0;
%==========================================================================
for i=1:R1
    Tvalue=TClass(i);
    if (P2(i,1)>P2(i,2)) 
        pclass=1;
    else 
        pclass=2;
    end
    if (Tvalue==pclass)
        mysum=mysum+1;
    end
    fprintf('%i     %f             %f    %i %i \n',i,P2(i,1),P2(i,2),Tvalue,pclass);
    fprintf('\n');
end


%==========================================================================

for i=1:R1 
   if (Cl==1)
         %if (i<=R2) 
              if (P2(i,1)>P2(i,2)) 
                  res1=res1+1;
             end
         %else
         %     if  (P2(i,1)<P2(i,2))
         %         res2=res2+1;    
         %     end
         %end
   else
        % if (i<=R2) 
              if (P2(i,1)<P2(i,2)) 
                 res1=res1+1;
              end
         % else
         %     if(P2(i,1)>P2(i,2))
         %        res2=res2+1;        
         %     end
    end     
end
[q1 w]=size(Xte);
fprintf('%f    \n',q1);
fprintf('%f    \n',res1);
fprintf('%f      \n',100*(res1)/(q1));
fprintf('\n');
mysum
mysum/q1

%==========================================================================
end


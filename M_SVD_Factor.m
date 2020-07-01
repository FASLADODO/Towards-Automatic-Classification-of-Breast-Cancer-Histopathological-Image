function  Smatrix =SVD_Factor(   )
summary=load ('C:\Mat_Projs\1\S118.dat');
[U,S,V] =svd(summary,0)
[R1 C1]= size(S);
sigm =zeros(R1);
[R2 C2]= size(V);
sent=zeros(R2);
clc;
for i=1:R1
    for j=1:C1
       if (i==j)
           sigm(i)= S(i,j);
       end
    end
end
clc;
for k=1:R2
    sent(k)=0;
    for i=1:R1
            sent(k)=sent(k)+V(k,i)^2*sigm(i)^2;
    end
    fprintf('%d \n',round(sent(k)));
    %fprintf('%d   %d \n',k,round(sent(k)));
end

end


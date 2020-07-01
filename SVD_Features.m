function  myfeatures =SVD_Features( myimage  )
Segma1 = svds(GIm,200);
[U,S,V] =svd(myimage,'econ');
%S= diag(S);
%Segma =S(:);
[R2 C2]= size(U);
sigm =zeros(R2);
sent=zeros(R2);
for i=1:size(Segma1)
     sigm(i)= Segma1(i);
end
myfeatures=[];
for k=1:R2
    sent(k)=0;
    for i=1:size(Segma1)
            sent(k)=sent(k)+V(k,i)^2*sigm(i)^2;
            myfeatures=[myfeatures sent(k)];
    end
end
%myfeatures
end


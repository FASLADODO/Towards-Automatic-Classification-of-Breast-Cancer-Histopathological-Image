function [ NMFImage ] = ReNMFImage( Gimage,myFactor )
a=Gimage;
[N M]= size(a);
k=myFactor;
w0=rand(N,k);
h0=rand(k,M);
x=10^-2;
maxiter = 10;
tol=0.001;
for j=1:maxiter
         numer = w0'*a;
         h = h0 .* (numer) ./ ((w0'*w0)*h0+x*h0 +eps(numer));
         h=h.*(h>0);
         numer = a*h';
         w = w0 .* (numer) ./ (w0*(h*h')+x*w0+eps(numer));
         w=w.*(w>0);
         w0 = w; h0 = h;
         if(norm(a-w*h)<tol)
                break;
         end
end
NMFImage=w*h;
%v=w*h;
%figure,imshow(10*w)
%figure,imshow(10*h)
%figure,imshow(v);
%[rr cc]=size(v)

end


%The following is the code for CNMF in MATLAB.
clear all
close all
clc
[query_fname, query_pathname] = uigetfile('*.jpg; *.png; *.bmp; *.pbm', 'Select query image');
     if (query_fname ~= 0)
         query_fullpath = strcat(query_pathname, query_fname);
         %imgInfo = imfinfo(query_fullpath)
     end
%The following is the code for CNMF in MATLAB.
a=imread(query_fullpath);%('BoatsColor.bmp');
imshow(a)
a=rgb2gray(a);
a = im2double(a);
figure,imshow(a)
[n,m]=size(a)
%k=min(n,m);
k=20;
w0=rand(n,k);
h0=rand(k,m);
x=10^-2;
maxiter = 500;
tol=0.001
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
v=w*h;
%figure,imshow(10*w)
%figure,imshow(10*h)
figure,imshow(v);
%[rr cc]=size(v)
imwrite(v,'cnfImage.jpg','jpg')
imgInfo = imfinfo('cnfImage.jpg')

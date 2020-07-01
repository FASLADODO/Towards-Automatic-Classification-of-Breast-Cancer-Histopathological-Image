 img = imread('cameraman.tif');
 if size(img,3) == 3	% % Check if the input image is grayscale
    img = rgb2gray(img);
 end
img = double(img);

wavelength = 2;
orientation = 0;%[0 45 90 135];
g = gabor(wavelength,orientation);
h= imgaborfilt(img,g);
C1 = conv2(img, h,'same');
figure; imshow( C1, [] ); title( 'filtered image' );

%====.
             %ndim=300;
             %[residuals,reconstructed] = pcares(featureVector ,ndim);
              %The 'reconstructed' will have the reduced dimensions data based on 
              %the ndims input. Note that 'reconstructed' will still be the original dimension.
              %You can choose the first ndims if you'd like.
              %If you want the reduced dimensions in the new basis then 
              %just take the first ndims of the SCORE variable
              %SCORE(:,1:ndims);
              %[COEFF,SCORE] = princomp(reconstructed);
              %SCORE
             %FeatureForGIm= reconstructed(:,1:ndim)
%====



%gaborArray = gabor([2 4],[0 30 60 90 120 150]);
%gaborMag = imgaborfilt(img,gaborArray);
%figure
%subplot(2,6,1);
%for p = 1:6
%    subplot(1,6,p)
%    imshow(gaborMag(:,:,p),[]);
%    theta = gaborArray(p).Orientation;
%    lambda = gaborArray(p).Wavelength;
%    title(sprintf('Orientation=%d, Wavelength=%d',theta,lambda));
%end
%gaborResult = conv2(img,gaborArray);
% J{u,v} = filter2(G{u,v},I);

%h = fspecial( 'gaussian', 5, 1.0 );
%C1 = imfilter( img, h );
%wavelength = 2;
%orientation = 75;
%h= imgaborfilt(img,wavelength,orientation);
%C1 = conv2(img, h,'same');
%figure; imshow( C1, [] ); title( 'filtered image' );

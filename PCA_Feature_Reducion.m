function PCA_Feature_Reducion
%==========================================================================
%Use PCARES function to do that:
ndim=500;
[residuals,reconstructed] = pcares(X,ndim)
%The 'reconstructed' will have the reduced dimensions data based on 
%the ndims input. Note that 'reconstructed' will still be the original dimension.
%You can choose the first ndims if you'd like.
FeatureForGIm= reconstructed(:,1:ndim)';

%If you want the reduced dimensions in the new basis then just take the first ndims of the SCORE variable
%SCORE(:,1:ndims)
%[COEFF,SCORE] = princomp(X)
%==========================================================================
%% some data points for 2 features
%X = [1,1,1, 2,2,2, 3,3,3 ; 1,2,3, 2,3,4, 3,4,5];
%numX = size(X,2);
%% PCA
%covX = zeros(2,2); % sample covariance
%meanX = mean(X,2); % sample mean
%for k = 1:numX
%    covX = covX + (X(:,k) - meanX) * (X(:,k) - meanX)';
%end
%covX = covX / (numX - 1);
% essential part of PCA:
%[V,D] = eig(covX);
%Now feature reduction by PCA usually means to interpret the directions of highest variance
%(corresponding to diagonal entries in D) as most discriminative ones.
%So you can use just a few columns of V to reweight your features to a smaller subset of largest variation.
%==========================================================================
%%
%noofdim=4
%[r,c] = size(img);       
 %Calculate cov matrix and the PCA matrixes
%m = mean(img')';
% S = ((img - m*ones(1,c)) * (img - m*ones(1,c))');     
%[Coeff latent]= eig(S);
%[latent, ind] = sort(diag(latent), 'descend');
%M1 = Coeff(:,ind(1:noofdim));
%latent1 = latent(1:noofdim);

end


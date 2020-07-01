function [ NMFImage ] = ReNMFImage01( Gimage,myFactor )

%====================== NMFImage Algorithm ===========================%
[N M]= size(Gimage);
F=myFactor;
opt = statset('MaxIter',1,'Display','off','useParallel',true);
[W,H] = nnmf(Gimage,F,'replicates',1,'options',opt,'algorithm','als');%'mult');
%D = norm(A-W*H,'fro')/sqrt(N*M);
%fprintf(D,'\n');
NMFImage=W*H;
%===================================================================%


end


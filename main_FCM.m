clc
close all     
clear all   

i_ori=imread('brain.bmp');
%f_ori=imnoise(f_ori,'gaussian',0.03);
imData = reshape(i_ori,[],1);
imData = double(imData);
% classic FCM function taking a vector and the number of clusters 
%and returning the centers, the membership matrix U and the value of the objective function in each iteration
[centers,U,objFunc] = fcm(imData,3);   

[c,n]=size(i_ori);  % get the size of the original image
[~,idx_c]=max(U);   %each data point belongs to which cluster

seg_index=reshape(idx_c,[c n]); % matrix of cluster membership
seg_built=zeros(c,n); 
for k=1:length(centers(:,1))
    x=(seg_index==k).*centers(k);   %add the 3 segments to the same figure
    seg_built=seg_built+x; 
end
seg = uint8(seg_built);
imshow(seg)
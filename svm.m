clc
listpos=dir('pos');
listneg=dir('neg');
lnpos=size(listpos)
lnneg=size(listneg)
j=1;
H=zeros(lnpos(1)+lnneg(1)-4,3780);
% For Negative Images
count=0;
for i=3:lnneg(1)
   [w,h,d]=size(imread(strcat('neg/',listneg(i).name)));
   if(d==3)
    H(j,:)=getHOGDescriptor(rgb2gray(imresize(imread(strcat('neg/',listneg(i).name)),[130,66])));
   else
       count=count+1;
   end
    j=j+1;
    
end

display('Done Training for Negative Images')
for i=3:lnpos(1)
    strcat('pos/',listpos(i).name);
    H(j,:)=getHOGDescriptor(rgb2gray(imresize(imread(strcat('pos/',listpos(i).name)),[130,66])));
    j=j+1;
    
end
display('done pos')

labels(1:lnpos(1)-2)=1;
labels(lnpos(1)-1:lnpos(1)-1+lnneg(1)-3-count)=0;

model=fitcsvm(H,labels)
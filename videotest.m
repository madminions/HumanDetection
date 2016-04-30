v=VideoReader('v4.mp4');
boxwidth=300;
boxheight=600;
hgap=70;
vgap=60;
load('final');
count=1;
while hasFrame(v)
    readFrame(v);
    count=count+1;
    if count>1000
        break;
    end
end
while hasFrame(v)
    frame= readFrame(v);
    imshow(frame);
    [frameheight,framewidth,x]=size(frame);
    i=1;
    j=1;
  %boxheight=frameheight-1;
   while(i<=frameheight-boxheight)
        j=1;
       while(j<=framewidth-boxwidth)
        % H=getHOGDescriptor(rgb2gray(imresize(frame,[130 66])));
       H=getHOGDescriptor(rgb2gray(imresize(frame(i:i+boxheight-1,j:j+boxwidth-1,:),[130 66])));
   %     imshow(frame(i:i+boxheight,j:j+boxwidth,:))
            res= predict(model,H');
           %res=1;
           if(res==0)
               res
              rectangle('Position',[j i boxwidth boxheight],'EdgeColor','w')
             pause(0.00000001)
           end
            j=j+hgap;
        end
        i=i+vgap;
     
   end
   
end
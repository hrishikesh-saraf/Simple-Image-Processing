function main()
for x=1:5
    fname=strcat('img0',num2str(x),'.jpg');
    imgq=imread(fname);  
    if size(imgq,3)==3
    imgq=rgb2gray(imgq);
    end
    sigma=1;
    [Im Io Ix Iy] = myEdgeFilter(imgq,sigma);
    figure;
    imshow(imgq);
    
    threshold=800000;
    [R]=myHarrisCorner(Ix,Iy,threshold);
    [r, c]=size(R);
    for i=1:r
        for j=1:c
            if R(i,j)>threshold
                hold on
                plot(j,i,'ro','MarkerSize',2);
                R(i,j)=1;
            else
                R(i,j)=0;
            end
        end
    end
    sn=strcat('final',num2str(x),'.jpg');
    saveas(gcf,sn);
    

end

         
              
    
    
    
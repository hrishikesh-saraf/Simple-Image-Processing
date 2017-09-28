function[Im Io Ix Iy] = myEdgeFilter(img,sigma)
img0=img;
if sigma<=1
   msize=3;
elseif sigma>1
   msize=(floor(sigma))*2+1;
end  

G=fspecial('Gaussian',msize,sigma);
img0 = myImageFilter(img0, G);

Gx=[-1 0 1;
    -2 0 2 ;
    -1 0 +1];

Gy=[1 2 1;
    0 0 0 ;
    -1 -2 -1];

Ix = myImageFilter(img0, Gx);
Iy = myImageFilter(img0, Gy);

[r c] = size(img0);
Im=zeros(r,c);
Io=zeros(r,c);

for x=1:r
    for y=1:c
        Im(x,y)=sqrt(Ix(x,y)^2 + Iy(x,y)^2);
        Io(x,y)=atan(Iy(x,y)/Ix(x,y));
    end
end









    
    
   
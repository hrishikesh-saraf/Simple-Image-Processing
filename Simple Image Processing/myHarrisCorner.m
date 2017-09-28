function[R]=myHarrisCorner(Ix,Iy,threshold)


Ix2=Ix.^2;
Iy2=Iy.^2;
Ixy=Ix.*Iy;

sigma=0.4;
if sigma<=1
   msize=3;
elseif sigma>1
   msize=(floor(sigma))*2+1;
end

G=fspecial('Gaussian',msize,sigma);
Ix2 = myImageFilter(Ix2, G);
Iy2 = myImageFilter(Iy2, G);
Ixy = myImageFilter(Ixy, G);

[r c] = size(Ix);
R=zeros(r,c);
k=0.04;
for x=1:r
    for y=1:c
        M=[Ix2(x,y) Ixy(x,y);
                Ixy(x,y) Iy2(x,y)];
        R(x,y)=det(M)-k*trace(M)^2 ;    
    end
end


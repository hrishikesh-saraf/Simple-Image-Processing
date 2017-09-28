function img1 = myImageFilter(img0,h);
[r c] = size(img0);  %Saves the dimensions of image in an array
[m n] = size(h);     %Saves the dimensions of convolution matrix in an array
h = rot90(h, 2);     %Rotates the convolution array twice
center = floor((size(h)+1)/2); %Finding the center element
left = center(2) - 1; %Finding left padding 
right = n - center(2); %Finding right padding
top = center(1) - 1; %Finding top padding
bottom = m - center(1); %Finding bottom padding
Rep = zeros(r + top + bottom, c + left + right);  %Create an intermediate matrix with padded zeros
for x = 1 + top : r + top   %For rows
    for y = 1 + left : c + left % For columns
        Rep(x,y) = img0(x - top, y - left); %Copying img0 matrix into Rep (which has padded zr
    end
end
img1 = zeros(r , c);
for x = 1 : r
    for y = 1 : c
        for i = 1 : m
            for j = 1 : n
                q = x - 1;
                w = y -1;
                img1(x, y) = img1(x, y) + (Rep(i + q, j + w) * h(i, j));
            end
        end
    end
end
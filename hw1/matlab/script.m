sigma     = 2;
threshold = 0.03;
rhoRes    = 2;
thetaRes  = pi/90;
nLines    = 50;

img = imread('../data/img01.jpg');
img = double(img) / 255;


[Im Io Ix Iy] = myEdgeFilter(img, sigma);
[H, rhoScale, thetaScale] = myHoughTransform(Im, threshold, rhoRes, thetaRes);
[rhos, thetas] = myHoughLines(H, nLines);

lines = houghlines(Im>threshold, 180*(thetaScale/pi), rhoScale, [rhos,thetas],'FillGap',5,'MinLength',10);

img2 = img/max(img(:));
for j=1:numel(lines)
   img2 = drawLine(img2, lines(j).point1, lines(j).point2); 
end  

imshow(img2)
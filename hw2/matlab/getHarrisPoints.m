function [points] = getHarrisPoints(I, alpha, k)
% Finds the corner points in an image using the Harris Corner detection algorithm
% Input:
%   I:                      grayscale image
%   alpha:                  number of points
%   k:                      Harris parameter
% Output:
%   points:                    point locations
%
    % -----fill in your implementation here --------

    
    points = zeros(alpha, 2);
    if size(size(I), 2) == 3
        Im = rgb2gray(I);
    end
    [m, n] = size(Im);
    fx = [-1, 0, 1; -1, 0, 1; -1, 0, 1];
    Ix = filter2(fx, Im);
    fy = [-1, -1, -1; 0, 0, 0; 1, 1, 1];
    Iy = filter2(fy, Im);

    Ix2 = Ix.^2;
    Iy2 = Iy.^2;
    Ixy = Ix.*Iy;
    clear Ix;
    clear Iy;

    h= fspecial('gaussian',[7 7],2);
    Ix2 = filter2(h,Ix2);
    Iy2 = filter2(h,Iy2);
    Ixy = filter2(h,Ixy);

    result = zeros(m, n);
    R = zeros(m, n); 

    for i = 1:m 
        for j = 1:n 
            M = [Ix2(i,j), Ixy(i,j); Ixy(i,j), Iy2(i,j)];
            R(i,j) = det(M) - k * (trace(M))^2;
        end
    end

    Rmax = max(R(:));
 
    cnt = 0;
    while cnt < alpha
        for i = 2:m - 1 
            for j = 2:n - 1
                rect = R(i - 1:i + 1, j - 1:j + 1);
                if R(i, j) > 0.1 * k *Rmax && R(i, j) == max(rect(:))
                    % R(i, j) = 0;
                    result(i,j) = 1;
                    cnt = cnt + 1; 
                    points(cnt, 1) = i;
                    points(cnt, 2) = j;
                end
            end
        end
    end

    points = points(1:alpha, :);

    % figure;
    % imshow(I);
    % hold on;
    % plot(points(:, 2),points(:, 1),'r+');

    % ------------------------------------------

end

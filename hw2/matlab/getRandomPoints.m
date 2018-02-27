function [points] = getRandomPoints(I, alpha)
% Generates random points in the image
% Input:
%   I:                      grayscale image
%   alpha:                  random points
% Output:
%   points:                    point locations
%
	% -----fill in your implementation here --------

    [m, n, c] = size(I);
    points = zeros(alpha, 2);
    for i = 1:alpha
        points(i, 1) = floor(m * rand()) + 1;
        points(i, 2) = floor(n * rand()) + 1;
    end

    % ------------------------------------------

end


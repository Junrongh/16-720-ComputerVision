% As input, the function takes a greyscale image (img0) and a convolution
% filter stored in matrix h. The output of the function should be an image
% img1 of the same size as img0 which results from convolving img0 with h.
% You can assume that the filter h is odd sized along both dimensions.
% You will need to handle boundary cases on the edges of the image.
% For example, when you place a convolution mask on the top left corner of
% the image, most of the filter mask will lie outside the image.
% One possible solution is to pad the image such that pixels lying outside
% the image boundary have the same intensity value as the nearest pixel
% that lies inside the image.

% Note: this function has already matched the request of Q3.2
% Convolution with One for Loop

function [img1] = myImageFilter(img0, h)
    [m, n] = size(img0);
    pad_w = (size(h, 1) + 1) / 2 - 1;
    pad_h = (size(h, 2) + 1) / 2 - 1;

    img0 = double(img0);

    % Pad the img to the request: pixels lying outside the image boundary have
    % the same intensity value as the nearest pixel that lies inside the image.
    pad = [ones(pad_w, pad_h) * img0(1, 1), ones(pad_w, 1) * img0(1, :), ones(pad_w, pad_h) * img0(1, n);
           img0(:, 1) * ones(1, pad_h), img0, img0(:, n) * ones(1, pad_h);
           ones(pad_w, pad_h) * img0(m, 1), ones(pad_w, 1) * img0(m, :), ones(pad_w, pad_h) * img0(m, n)];

    % Converlutional filter
    img1 = ones(m, n);
    for i = [1:m]
        for j = [1:n]
            temp = pad(i:i + pad_w * 2, j:j + pad_h * 2).*h;
            img1(i, j) = sum(temp(:));
        end
    end
end

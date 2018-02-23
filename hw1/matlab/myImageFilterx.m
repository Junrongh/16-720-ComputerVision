function [img1] = myImageFilter(img0, h)
    [m, n] = size(img0);
    pad_w = (size(h, 1) + 1) / 2 - 1;
    pad_h = (size(h, 2) + 1) / 2 - 1;

    % Pad the img to the request: pixels lying outside the image boundary have
    % the same intensity value as the nearest pixel that lies inside the image.
    pad = [ones(pad_w, pad_h) * img0(1, 1), ones(pad_w, 1) * img0(1, :), ones(pad_w, pad_h) * img0(1, n);
           img0(:, 1) * ones(1, pad_h), img0, img0(:, n) * ones(1, pad_h);
           ones(pad_w, pad_h) * img0(m, 1), ones(pad_w, 1) * img0(m, :), ones(pad_w, pad_h) * img0(m, n)];

    % Converlutional filter
    img1 = ones(m, n);
    for i = [1:m]
        for j = [1:n]
            A1 = (pad(i:i + pad_w * 2, j:j + pad_h * 2) + h).^2;
            A2 = (pad(i:i + pad_w * 2, j:j + pad_h * 2) - h).^2;
            img1(i, j) = (sum(A1(:)) - sum(A2(:))) / 4;
        end
    end
end

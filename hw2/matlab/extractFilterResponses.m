function [filterResponses] = extractFilterResponses(I, filterBank)
% CV Spring 2018 - Provided Code
% Extract the filter responses given the image and filter bank
% Pleae make sure the output format is unchanged.
% Inputs:
%   I:                  a 3-channel RGB image with width W and height H
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a HxWx3N matrix of filter responses


    %Convert input Image to Lab
    doubleI = double(I);
    if length(size(doubleI)) == 2
        tmp = doubleI;
        doubleI(:,:,1) = tmp;
        doubleI(:,:,2) = tmp;
        doubleI(:,:,3) = tmp;
    end
    [L,a,b] = RGB2Lab(double(I(:,:,1)), double(I(:,:,2)), double(I(:,:,3)));
    h = size(I,1);
    w = size(I,2);

    % -----fill in your implementation here --------

    Lab = zeros(h, w, 3);
    Lab(:, :, 1) = L;
    Lab(:, :, 2) = a;
    Lab(:, :, 3) = b;
    n = size(filterBank, 1);
    for i = 1:n
        filted = imfilter(Lab, filterBank{i});
        filterResponses(:, :, 3 * i - 2:3 * i) = filted;
    end

    % ------------------------------------------
end



function [rhos, thetas] = myHoughLines(H, nLines)
    %Your implemention here
    [m, n] = size(H);

    diffr = diff([zeros(1, n); H], 1, 1);
    diffc = diff([zeros(m, 1), H], 1, 2);

    if diffr(m, 1) < 0
        H(m, 1) = 0;
    end

    if diffc(1, n) < 0
        H(1, n) = 0;
    end

    if diffr(2, 1) > 0 || diffc(1, 2) > 0
        H(1, 1) = 0;
    end

    if diffc(m, n) < 0 || diffc(m, n) < 0
        H(m, n) = 0;
    end

    for i = 1:m - 1
        if diffr(i, 1) < 0 || diffr(i + 1, 1) > 0 || diffc(i, 2) > 0
            H(i, 1) = 0;
        end
        if diffr(i, n) < 0 || diffr(i + 1, n) > 0 || diffc(i, n) < 0
            H(i, n) = 0;
        end
    end

    for j = 1:n - 1
        if diffc(1, j) < 0 || diffc(1, j + 1) > 0 || diffr(2, j) > 0
            H(1, j) = 0;
        end
        if diffc(m, j) < 0 || diffc(m, j + 1) > 0 || diffr(m, j) < 0
            H(m, j) = 0;
        end
    end

    for i = 2:m - 1
        for j = 2:n - 1
            if diffr(i, j) < 0 || diffc(i, j) < 0 || diffr(i + 1, j) > 0 || diffc(i, j + 1) > 0
                H(i, j) = 0;
            end
        end
    end

    % Hr = H;
    % if Hr(1, 1) < max(Hr(1:3, 1:3))
    %     H(1, 1) = 0;
    % end
    % if Hr(1, n) < max(Hr(1:3, n - 2:n))
    %     H(1, n) = 0;
    % end
    % if Hr(m, 1) < max(Hr(m - 2:m, 1:3))
    %     H(m, 1) = 0;
    % end
    % if Hr(m, n) < max(Hr(m - 2:m, n - 2:n))
    %     H(m, n) = 0;
    % end

    % for i = [2:m-1]
    %     if Hr(i, 1) < max(max(Hr(i - 1:i + 1, 1:2)))
    %         H(i, 1) = 0;
    %     end
    %     if Hr(i, n) < max(max(Hr(i - 1:i + 1, n - 1:n)))
    %         H(i, n) = 0;
    %     end
    % end
    % for j = [2:n-1]
    %     if Hr(1, j) < max(max(Hr(1:2, j - 1:j + 1)))
    %         H(1, j) = 0;
    %     end
    %     if Hr(m, j) < max(max(Hr(m - 1:m, j - 1:j + 1)))
    %         H(m, j) = 0;
    %     end
    % end

    % for i = [4:m - 3]
    %     for j = [4:n - 3]
    %         if Hr(i, j) < max(max(Hr(i - 3:i + 3, j - 3:j + 3)))
    %             H(i, j) = 0;
    %         end
    %     end
    % end


    list = sort(reshape(H, [m * n, 1]), 'descend');

    [rhos, thetas] = find(H == list(1));
    for i = 2:nLines
        [x, y] = find(H == list(i));
        rhos = [rhos; x];
        thetas = [thetas; y];
    end

    % imwrite(H/max(H(:)), '../results/H.png');

    rhos = rhos(1:nLines);
    thetas = thetas(1:nLines);
end
        
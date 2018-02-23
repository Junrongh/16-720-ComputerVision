function [Im Io Ix Iy] = myEdgeFilter(img, sigma)
    %Your implemention
    hsize = 2 * ceil(3 * sigma) + 1;
    h = fspecial('gaussian', hsize, sigma);
    smoothed = myImageFilter(img, h);

    sobelx = [1, 0, -1; 2, 0, -2; 1, 0, -1];
    sobely = [1, 2, 1; 0, 0, 0; -1, -2, -1];

    Ix = myImageFilter(smoothed, sobelx);
    Iy = myImageFilter(smoothed, sobely);
    Imr = (Ix.^2 + Iy.^2).^(0.5);
    Io = atan2d(Iy, Ix);
    [m, n] = size(Imr);
    Im = zeros(m, n);

    for i = [2:m - 2]
        for j = [2:n - 2]
            ang = round(Io(i, j) / 45);
            if ang < 0
                ang = ang + 4;
            end
            if ang == 0 || ang == 4
                if Imr(i, j) < Imr(i, j + 1) || Imr(i, j) < Imr(i, j - 1)
                    Im(i, j) = 0;
                else
                    Im(i, j) = Imr(i, j);
                end
            elseif ang == 1
                if Imr(i, j) < Imr(i + 1, j + 1) || Imr(i, j) < Imr(i - 1, j - 1)
                    Im(i, j) = 0;
                else
                    Im(i, j) = Imr(i, j);
                end          
            elseif ang == 2
                if Imr(i, j) < Imr(i + 1, j) || Imr(i, j) < Imr(i - 1, j)
                    Im(i, j) = 0;
                else
                    Im(i, j) = Imr(i, j);
                end
            elseif ang == 3
                if Imr(i, j) < Imr(i + 1, j - 1) || Imr(i, j) < Imr(i - 1, j + 1)
                    Im(i, j) = 0;
                else
                    Im(i, j) = Imr(i, j);
                end
            end
        end
    end
end
% for i = [3:m - 2]
%     for j = [3:n - 2]
%         ang = round(Io(i, j) / 45);
%         if ang < 0
%             ang = ang + 4;
%         end
%         if ang == 0 || ang == 4
%             if Imr(i, j) < max(max(Imr(i:i + 2, j - 1:j + 1))) || Imr(i, j) < max(max(Imr(i - 2:i, j - 1:j + 1)))
%                 Im(i, j) = 0;
%             else
%                 Im(i, j) = Imr(i, j);
%             end
%         elseif ang == 1
%             if Imr(i, j) < max(max(Imr(i:i + 2, j:j + 2))) || max(max(Imr(i - 2:i, j - 2:j)))
%                 Im(i, j) = 0;
%             else
%                 Im(i, j) = Imr(i, j);
%             end          
%         elseif ang == 2
%             if Imr(i, j) < max(max(Imr(i - 1:i + 1, j:j + 2))) || Imr(i, j) < max(max(Imr(i - 1:i + 1, j - 2:j)))
%                 Im(i, j) = 0;
%             else
%                 Im(i, j) = Imr(i, j);
%             end
%         elseif ang == 3
%             if Imr(i, j) < max(max(Imr(i - 2:i, j:j + 2))) || Imr(i, j) < max(max(Imr(i:i + 2, j - 2:j)))
%                 Im(i, j) = 0;
%             else
%                 Im(i, j) = Imr(i, j);
%             end
%         end
%     end
% end
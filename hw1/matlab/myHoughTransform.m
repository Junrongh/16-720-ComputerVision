function [H, rhoScale, thetaScale] = myHoughTransform(Im, threshold, rhoRes, thetaRes)
    %Your implementation here
    %Im - grayscale image - 
    %threshold - prevents low gradient magnitude points from being included
    %rhoRes - resolution of rhos - scalar
    %thetaRes - resolution of theta - scalar
    [m, n] = size(Im);
    rhomax = sqrt(m^2 + n^2);
    rhoScale = [-rhomax:rhoRes:rhomax];
    thetaScale = [0:thetaRes:2 * pi];

    rhomax = size(rhoScale, 2) - 1;
    thetamax = size(thetaScale, 2) - 1;
    H = zeros(rhomax, thetamax);

    for i = [1:m]
        for j = [1:n]
            if Im(i, j) > threshold
                for theta = [1:thetamax]
                    rho = floor(rhomax / 2 + (i * sin(theta * thetaRes) + j * cos(theta * thetaRes))/rhoRes);
                    if rho == 0
                        continue
                    end
                    H(rho, theta) = H(rho, theta) + 10;
                end
            end           
        end
    end

end
        
        

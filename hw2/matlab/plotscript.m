I1 = imread('../data/test1.jpg');
I2 = imread('../data/test2.jpg');
I3 = imread('../data/test3.jpg');

Im = {I1, I2, I3};
alpha = 500;
for i = 1:3
    [randpoints] = getRandomPoints(Im{i}, alpha);
    h = figure;
    imshow(Im{i});
    hold on
    for j = 1:alpha
        plot(randpoints(j, 2), randpoints(j, 1),'o', 'markerfacecolor', [0, 0, 1], 'markersize', 5);
    end
    fname = sprintf('../results/I%s_rand.png', num2str(i));
    saveas(h, fname);
end

k = 0.04;
for i = 1:3
    [harrispoints] = getHarrisPoints(Im{i}, alpha, k);
    h = figure;
    imshow(Im{i});
    hold on
    for j = 1:alpha
        plot(harrispoints(j, 2), harrispoints(j, 1),'o', 'markerfacecolor', [0, 0, 1], 'markersize', 5);
    end
    fname = sprintf('../results/I%s_harris.png', num2str(i));
    saveas(h, fname);
end
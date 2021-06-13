function DTWDistance = DTW(t, r)
    n = length(t);
    m = length(r);
    % 帧匹配距离矩阵
    d = zeros(n, m);

    for i = 1:n

        for j = 1:m
            d(i, j) = sum((t(i, :) - r(j, :)).^2);
        end

    end

    % 累积距离矩阵
    D = ones(n, m) * realmax;
    D(1, 1) = d(1, 1);
    % 动态规划
    for i = 2:n

        for j = 1:m
            D1 = D(i - 1, j);

            if j > 1
                D2 = D(i - 1, j - 1);
            else
                D2 = realmax;
            end

            if j > 2
                D3 = D(i - 1, j - 2);
            else
                D3 = realmax;
            end

            D(i, j) = d(i, j) + min([D1, D2, D3]);
        end

    end

    DTWDistance = D(n, m);
end

%% KNN_FUN KNN算法匹配样本与训练
% data：输入数据
% K：指定KNN系数
% result:样本匹配结果
function [result] = KNN_fun(dis, K, dataNum)
    % 已知的数据分布情况
    distribution = [ones(1,dataNum/2) 2*ones(1,dataNum/2)];
    % 排序，找到最小距离并输出
    [~, ind] = sort(dis);
    K = K - 1 + mod(K, 2);
    temp = tabulate(distribution(ind(1:K)));
    [~, I] = max(temp(:, 3));
    result = temp(I, 1);
end

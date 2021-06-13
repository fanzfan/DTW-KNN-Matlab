%% 训练程序
close all;clear all;
result = zeros(1, 12);
for j = 1: 12
    [p, fs] = audioread(['.\校验文件\' num2str(j) '.wav']);
    p = preprocess(p, fs);
    dataNum = 20;
    dis = ones(1, dataNum);
    % DTW比较
    for i = 1:dataNum
        [s, fs] = audioread(['.\本人\' num2str(i) '.wav']);
        s = preprocess(s, fs);
        dis(i) = DTW(p,s);
    end
    % KNN算法
    result(j) = KNN_fun(dis, 2, dataNum);
end
stem(result, 'color','#A2142F','LineWidth', 2.2);
hold on
stem((result - 1) * 2, 'color','#0072BD','LineWidth', 2.2);
title('预测结果')
xlabel('数据')
ylabel('结果')
yline(1, 'r--','LineWidth', 1.2)
yline(2, 'k-.','LineWidth', 1.2)
set(gca, 'FontSize',21)
legend('预测为“打开”', '预测为“关闭”', '打开', '关闭')
axis([0 15 -0.2 2.2])
% 
% if(result == 1)
%     disp('识别结果：（打）开后备箱')
% else
%     disp('识别结果：关（闭）后备箱')
% end
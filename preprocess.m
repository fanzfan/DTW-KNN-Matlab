% 预处理
function out = preprocess(p, fs)
fs1 = 8000;
% 降采样
p = p(1:fix(fs/fs1):length(p));
% Vad，短时能量法
 p = p(abs(p) > 0.1 * mean(abs(p)));
% 归一化
 p = (p - mean(p))/norm(p);
% 分帧加窗
 out = enframe(p, fs1);
end

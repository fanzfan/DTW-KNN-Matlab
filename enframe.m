function out = enframe(data, fs)
% 帧持续长度，单位为毫秒
timeOfFrame = 10;
len = length(data);
lenOfFrame = fs/1000*timeOfFrame;
% 分帧与调整维度，方便加窗计算
data = reshape(data(1:(fix(len/lenOfFrame)*lenOfFrame)), [],lenOfFrame);
out = zeros(1, fix(len/lenOfFrame));
% 汉明窗
w = hamming(lenOfFrame);
for i = 1 : size(data,1)
    data(i,:) = data(i,:).*w';
    out(i) = data(i,:)*data(i,:)';
end
out = out';
end

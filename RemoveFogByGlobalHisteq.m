function In = RemoveFogByGlobalHisteq(I,flag)
%对RGB图像通过直方图均衡，达到去雾化效果
%输入：
%I-原始图像
%flag-显示标记
%输出：
%In-均衡后的图像
if nargin < 2
   flag = 1;
end
%提取图像RGB分量
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
%分别对RGB分量进行直方图均衡化
r = histeq(R);
g = histeq(G);
b = histeq(B);
%构成新图像
In = cat(3,r,g,b);
%显示结果
if flag
   figture;
   subplot(2,2,1);imshow(I),title('原图像','FontWeight','Bold');
   subplot(2,2,2);imshow(In),title('均衡后图像','FontWeight','Bold');
%灰度化，用于计算直方图
   Q = rgb2gray(I);
   W = rgb2gray(In);
   subplot(2,2,3);imshow(Q),title('原图像','FontWeight','Bold');
   subplot(2,2,4);imshow(W),title('均衡后图像','FontWeight','Bold');
end
   
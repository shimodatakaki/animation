% Template m file for animation
% Copyright 2017 Shimoda Takaki, The University of Tokyo.
%
% Make animation using VideoWriter()
% for more detail, see https://jp.mathworks.com/help/matlab/ref/videowriter.html

anime.T = 1; %Animation Time 
anime.N=100; %Animation sampling rate
anime.name = 'name'; %Animation File Name
anime.FileFormat = 'avi';
anime.FrameRate = 30;

%Time Series
t = linspace(0,anime.T,anime.N);

%Plot and save each figure to file
fig=figure;
v = VideoWriter(anime.name);
v.FrameRate = anime.FrameRate;
open(v);
for i=1:length(t)
    %CODE BEGIN
    %CODE HERE
    %CODE END
    frame = getframe(fig);
    writeVideo(v,frame);
end
close(v);
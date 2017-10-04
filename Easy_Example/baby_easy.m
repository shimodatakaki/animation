% Easy example of animation
% Copyright 2017 Shimoda Takaki, The University of Tokyo.
% Built-in function. 

clear all
close all
clc

%Time Series
LINES=200;
t = linspace(0,1,LINES);

% Create N random circles to display,
N=50;
X = rand(N,1);
Y = rand(N,1);
centers = [X Y];
radii = 0.1*rand(N,1);

delta=0.05;

%Color map
cmap = colormap(jet(length(t)));
%see 
% https://jp.mathworks.com/help/matlab/ref/colormap.html#buc3wsn-6

%Video 
video_name = 'baby_easy';

%Plot
fig=figure;
%VIDEO WRITER
v = VideoWriter(video_name);
v.FrameRate = 29.97;
open(v);
for i=1:length(t)
    %CODE BEGIN
    %%%%%%%%%%%%%
    cla;
    for j=1:length(centers)
        centers(j, 2) = centers(j, 2) + delta;
        if  centers(j, 2) > 1.1
            centers(j,1)=rand;
            centers(j,2)=rand;
            radii(j) = 0.1*rand;
        end
    end   
    xlim([-0.1 1.1])
    ylim([-0.1 1.1])
    axis square
    viscircles(centers,radii);
    %%%%%%%%%%%%%
    %CODE END
    frame = getframe(fig);
    writeVideo(v,frame);
end
close(v);

% Easy example of animation
% Copyright 2017 Shimoda Takaki, The University of Tokyo.
% Built-in function. 

clear all
close all
clc

%Time Series
t = linspace(0,1);
x = cos(2*pi*t);
y = sin(2*pi*t);

%Color map
cmap = colormap(jet(length(t)));
%see 
% https://jp.mathworks.com/help/matlab/ref/colormap.html#buc3wsn-6

%Video 
video_name = 'easy';

%Plot
fig=figure;
v = VideoWriter(video_name);
v.FrameRate = 10;
open(v);
for i=1:length(t)
    %CODE BEGIN
    %%%%%%%%%%%%%
    h=plot(x(i),y(i),'o');
    h.Color=cmap(i,:);
    h.LineWidth = 2;
    xlim([-2 2]);
    ylim([-2 2]);
    title(['t=', num2str(t(i)), ' (s)']);
    legend(['Plot: ', num2str(i)]);
    %%%%%%%%%%%%%
    %CODE END
    frame = getframe(fig);
    writeVideo(v,frame);
end
close(v);

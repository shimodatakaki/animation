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
video_name = 'another_easy';

%Plot
fig=figure;
%VIDEO WRITER
v = VideoWriter(video_name);
v.FrameRate = 29.97;
open(v);
for i=1:length(t)
    %CODE BEGIN
    %%%%%%%%%%%%%
    h(1)=plot(x(i),y(i),'o');
    hold on;
    p1 = [x(i), y(i)]; % start
    p2 = [x(i) - y(i),  y(i) + x(i)]; % end
    h(2)=quiver(p1(1), p1(2), p2(1)-p1(1), p2(2)-p1(2), 0);
    for j=1:length(h)
        h(j).Color = cmap(i,:);
    end
    xlim([-3 3])
    ylim([-3 3])
    hold off;
    %%%%%%%%%%%%%
    %CODE END
    frame = getframe(gca);
    writeVideo(v,frame);
end
close(v);

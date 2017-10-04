% Make animation of 2-link robot motion
% Copyright 2017 Shimoda Takaki, The University of Tokyo.
% Built-in function. 

clear all
close all
clc

load('Robot_Control_Result.mat');
t = th.time;
theta = th.signals.values;
reference = ref.signals.values;

fig=figure;
v = VideoWriter('Robot_Motion.avi');
v.FrameRate = 15;  % Default 30
open(v);
N=length(t);
NPLOT=floor(N/400);
for i=1:NPLOT:N
    p1(1)=R.L1*cos(theta(i,1)); p1(2)=R.L1*sin(theta(i,1));
    p2(1)=p1(1)+R.L2*cos(theta(i,1)+theta(i,2)); p2(2)=p1(2)+R.L2*sin(theta(i,1)+theta(i,2));
    r1(1)=R.L1*cos(reference(i,1)); r1(2)=R.L1*sin(reference(i,1));
    r2(1)=r1(1)+R.L2*cos(reference(i,1)+reference(i,2)); r2(2)=r1(2)+R.L2*sin(reference(i,1)+reference(i,2));
    xminmax=[-1.2 1.2];
    yminmax=xminmax;
    %Line
    h=plot([0,p1(1)], [0, p1(2)], 'k');
    h.LineWidth=2.2;
    hold on
    h=plot([p1(1), p2(1)],[p1(2), p2(2)], 'b');
    h.LineWidth=2.2;
    %Line
    h=plot([0,r1(1)], [0, r1(2)], 'm--');
    h.LineWidth=2;
    h=plot([r1(1), r2(1)],[r1(2), r2(2)], 'c--');
    h.LineWidth=2;
    %Marker
    h=plot(0,0,'o');
    h.MarkerSize=10;
    h.MarkerFaceColor='k';
    h=plot(p1(1), p1(2),'o');
    h.MarkerSize=5;
    h.MarkerFaceColor='b';
    xlim(xminmax)
    ylim(yminmax)
    hold off
    title(['t=', num2str(t(i)), ' [s]'])
    %legend('Link1','Link2')
    frame = getframe(fig);
    writeVideo(v,frame);
    %pause(0.01)
end
close(v);

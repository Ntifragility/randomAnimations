clear, clc, close all;

%Christopher Lum
%lum@uw.edu
%
%Illustrate animation in Matlab
%
%This file is designed to accompany the YouTube video at 
%https://youtu.be/3I1_5M7Okqo

%Version History
%11/12/13: Created (from lecture 14 in AA447)
%11/09/14: Updated for 2014
%11/03/18: Moved to YouTube structure, updated documentation, add drawnow,


%% Step 1: Generate Data
%Animate a point moving along a 3D parametric curve
t = linspace(0,4*pi, 200);
x = 5*cos(t);
y = 2*sin(t);
z = t;

%% Step 2: Draw/Render Scenario
figh = figure;

for k=1:length(t)
    
    %Clear the figure to start with a blank slate
    clf
    
    %Extract data at the current time step
    t_k = t(k);
    x_k = x(k);
    y_k = y(k);
    z_k = z(k);
    
    %Where is the current point?
    plot3(x_k, y_k, z_k, 'r*', 'MarkerSize', 15, 'LineWidth', 3)
    
    %Plot the entire curve
    hold on
    plot3(x, y, z, 'b-', 'LineWidth', 2);
    
    %Add plotting options
    grid on
    xlabel('x')
    ylabel('y')
    zlabel('z')
    title(['t = ',num2str(t_k)]) % Time updating
    view([20 35 15])             % Angle of inclination (°) in every axis: x y z   
      % view([35+10*t_k 35])         % Rotate viewpoint can be manipulated
    
    %% Step 3: Take a Snapshot
    %Save the frame
    movieVector(k) = getframe(figh, [10 10 520 400]);
      % movieVector(k) = getframe(figh, [10 10 520 400]); %manually specify getframe region
    
    %% Step 4: Advance Time
    %Happens automatically if using a for loop
end

%% Step 5: Save Movie
%Create a VideoWriter object and set properties
myWriter = VideoWriter('Helicoide', 'MPEG-4');            %create an .avi file
myWriter.FrameRate = 20;

%Open the VideoWriter object, write the movie, and close the file
open(myWriter);
writeVideo(myWriter, movieVector);
close(myWriter);

%% Step 6: Export figure
exportgraphics(figh,'Helicoide.png')

disp('DONE!')
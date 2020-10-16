%% Clear all windows and dock figure
clf;
clc;
clear;
set(0,'DefaultFigureWindowStyle', 'docked')

%% Setup the physical envrionment                                     
hold on;      % Add to the plot
xlabel('x');
ylabel('y');
zlabel('z');
axis equal;
camlight;

workspace = [1 -1 1 -1 1 -1];
scale = 0.1;

q = zeros(1,7);       

%% Define the DH parameters to create the kinematic model - DOBOT MAGICIAN WITH A TWO CLAW GRIPPER
L1 = Link('d',0.139,'a',0,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-180),deg2rad(180)]); 
L2 = Link('d',0,'a',0.135,'alpha',0,'offset',0,'qlim',[deg2rad(-15),deg2rad(100)]);
L3 = Link('d',0,'a',0.147,'alpha',0,'offset',0,'qlim',[deg2rad(-160),deg2rad(-12)]);
L4 = Link('d',0,'a',0.0584,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-90),deg2rad(72)]);
L5 = Link('theta',deg2rad(0),'a',0,'alpha',pi/2,'offset',0.135,'qlim',[-0.052 0]);
L6 = Link('theta',deg2rad(-90),'a',-0.0305,'alpha',0,'offset',0,'qlim',[-0.03 0]);
L7 = Link('theta',deg2rad(180),'a',0,'alpha',0,'offset',0.06,'qlim',[-0.06 0]);

robot = SerialLink([L1 L2 L3 L4 L5 L6 L7],'name','Dobot Magician');    

%robot.plot(q,'workspace',workspace,'scale',scale)
robot.name = 'Dobot Magician Arm';                                            

%% Teach function with skeleton model for DOBOT
%robot.teach();

%% Display robot
for linkIndex = 0:robot.n
    [faceData, vertexData, plyData{linkIndex+1} ] = plyread(['../CAD/Ply Files/Dobot Magician J',num2str(linkIndex),'.ply'],'tri'); %#ok<AGROW>

robot.faces{linkIndex+1} = faceData;
robot.points{linkIndex+1} = vertexData;
end
robot.plot3d(q,'workspace',workspace);

if isempty(findobj(get(gca,'Children'),'Type','Light'))
    camlight
end  
robot.delay = 0.000000001;

%% Try to correctly colour the arm (if colours are in ply file data)
for linkIndex = 0:robot.n
    handles = findobj('Tag', robot.name);
    h = get(handles,'UserData');
    try 
        h.link(linkIndex+1).Children.FaceVertexCData = [plyData{linkIndex+1}.vertex.red ...
                                                          , plyData{linkIndex+1}.vertex.green ...
                                                          , plyData{linkIndex+1}.vertex.blue]/255;
        h.link(linkIndex+1).Children.FaceColor = 'interp';
    catch ME_1
        disp(ME_1);
        continue;
    end
end

%% Teach function with ply models for DOBOT
robot.teach();

function PickAndPlace

close all
clc

%% Options
interpolation = 1;                                                          % 1 = Quintic Polynomial, 2 = Trapezoidal Velocity
steps = 50;                                                                % Specify no. of steps
workspace = [1 -1 1 -1 1 -1];

%% Load Model
DobotDHParameters;                                                                 
qlim = robot.qlim;                                                           

%% Define End-Effector transformation, use inverse kinematics to get joint angles
T1 = transl(0.340,0.06,-0.027);                                                  % Create translation matrix
q1 = robot.ikine(T1);                                                        % Derive joint angles for required end-effector transformation
T2 = transl(0.297,0.06,0.09);                                                   % Define a translation matrix            
q2 = robot.ikine(T2);                                                        % Use inverse kinematics to get the joint angles

%% Interpolate joint angles, also calculate relative velocity, accleration
qMatrix = jtraj(q1,q2,steps);
% switch interpolation
%     case 1
%         qMatrix = jtraj(q1,q2,steps);
%     case 2
%         s = lspb(0,1,steps);                                             	% First, create the scalar function
%         qMatrix = nan(steps,6);                                             % Create memory allocation for variables
%             for i = 1:steps
%                 qMatrix(i,:) = (1-s(i))*q1 + s(i)*q2;                   	% Generate interpolated joint angles
%             end
%     otherwise
%         error('interpolation = 1 for Quintic Polynomial, or 2 for Trapezoidal Velocity')
% end
%         
velocity = zeros(steps,7);
acceleration  = zeros(steps,7);
for i = 2:steps
    velocity(i,:) = qMatrix(i,:) - qMatrix(i-1,:);                          % Evaluate relative joint velocity
    acceleration(i,:) = velocity(i,:) - velocity(i-1,:);                    % Evaluate relative acceleration
end

%% Plot the results
robot.plot(qMatrix,'workspace',workspace,'trail','r-');                                       % Plot the motion between poses, draw a red line of the end-effector path

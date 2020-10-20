function robot = createRobot()
clf;
clear;

base = transl(0, 0, 0.2115);

L1 = Link('d',0.1635,'a',0,'alpha',pi/2,'qlim',deg2rad([-170 170]), 'offset',pi);
L2 = Link('d',0,'a',0.305,'alpha',0,'qlim',deg2rad([-120 120]), 'offset',pi/2);
L3 = Link('d',0,'a',0,'alpha',-pi/2,'qlim',deg2rad([-125 155]), 'offset', -pi/2);
L4 = Link('d',0.3,'a',0.01,'alpha',pi/2,'qlim',deg2rad([-270 270]));
L5 = Link('d',0,'a',0,'alpha',-pi/2,'qlim',deg2rad([-120 120]));
L6 = Link('d',0.07,'a',0,'alpha',0,'qlim',deg2rad([-360 360]));

robot = SerialLink([L1 L2 L3 L4 L5 L6],'base',base,'name','DensoVS');

workspace = [-1 1 -1 1 -0.5 2];

scale = 0.5;

q = zeros(1,6); 

robot.plot(q,'workspace',workspace,'scale',scale);
% robot.teach
end

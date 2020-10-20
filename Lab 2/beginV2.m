robot = createRobot;
q=[0 0 0 0 0 0];
robot.plot(q)

box1Tr = transl(0.3,-0.4,0.2)*trotx(pi);
box2Tr = transl(0.3,-0.2,0.2)*trotx(pi);
box3Tr = transl(0.3,0,0.2)*trotx(pi);
box4Tr = transl(0.3,0.2,0.2)*trotx(pi);
box5Tr = transl(0.3,0.4,0.2)*trotx(pi);


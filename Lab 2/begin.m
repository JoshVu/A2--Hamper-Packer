robot = createRobot;
q=[0 0 0 0 0 0];
robot.plot(q)
tr1 = transl(0.4722,0,0.4209)*trotx(pi);
tr2 = tr1*transl(0,0,-0.15);
tr3 = tr2*trotz(pi/2);
tr4 = tr3*transl(0,-0.07,-0.07)*trotx(pi/2);

q5 = robot.ikcon(tr4);
q5 = q5 - [deg2rad(120) 0 0 0 0 0];
tr5 = robot.fkine(q5);

movement(robot, tr1, 50)
display('step 1 complete');
movement(robot, tr2, 30)
display('step 2 complete');
movement(robot, tr3, 30)
display('step 3 complete');
movement(robot, tr4, 30)
display('step 4 complete');
movement(robot, tr5, 50)
display('step 5 complete');

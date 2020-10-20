function movement(robot, q2, steps)
%tr1 = robot.fkine(robot.getpos);
%tr2 = robot.fkine(q);

% traj = jtraj(tr1,tr,steps)
qmatrix = zeros(steps,6);
% 
% for i = 1:size(traj,1)
%     tr = [traj(i,1:4);traj(i,5:8);traj(i,9:12);traj(i,13:16)]';
%     qmatrix(i,:) = robot.ikcon(tr);
% end
q1 = robot.getpos
%q2 = robot.ikcon(tr)
s = lspb(0, 1, steps);
for i = 1:steps
    qmatrix(i, :) = (1-s(i))*q1 + s(i)*q2;
end
    
robot.animate(qmatrix)

end

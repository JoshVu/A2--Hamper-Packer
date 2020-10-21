close all;
clc;
startup_rvc;
pause on;
workspace = [4 -4 4 -4 4 -0.5];
 %% Robot
% Robot1= UR3(transl(-3,0.23,0));
% hold on;
% Robot2=UR3(transl(3,0.23,0));
L1=Link('alpha',-pi/2,'a',0.180, 'd',0.475, 'offset',0, 'qlim',[deg2rad(-170), deg2rad(170)]);
L2=Link('alpha',0,'a',0.385, 'd',0, 'offset',-pi/2, 'qlim',[deg2rad(-90), deg2rad(135)]);
L3=Link('alpha',pi/2,'a',-0.100, 'd',0, 'offset',pi/2, 'qlim',[deg2rad(-80), deg2rad(165)]);
L4=Link('alpha',-pi/2,'a',0, 'd',0.329+0.116, 'offset',0, 'qlim',[deg2rad(-185), deg2rad(185)]);
L5=Link('alpha',pi/2,'a',0, 'd',0, 'offset',0, 'qlim',[deg2rad(-120), deg2rad(120)]);
L6=Link('alpha',0,'a',0, 'd',0.09, 'offset',0, 'qlim',[deg2rad(-360), deg2rad(360)]);
    
densoRobot = SerialLink([L1 L2 L3 L4 L5 L6],'name','Denso VM6083G');
densoRobot.name = 'Denso VM6083G';
qStart = deg2rad([0,45,90,0,45,0]);
densoRobot.plot(qStart);
hold on;

%% Enviroment
%brick1
[f,v,data] = plyread('brick1.ply','tri');
brick1VertexCount = size(v,1);
midPoint = sum(v)/brick1VertexCount;
brick1Verts = v - repmat(midPoint,brick1VertexCount,1);
brick1Pose = transl(0.2,-0.6,-0.2);
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
brick1Mesh_h = trisurf(f,brick1Verts(:,1) + brick1Pose(1,4),brick1Verts(:,2) + brick1Pose(2,4), brick1Verts(:,3) + brick1Pose(3,4) ...
    ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');

%brick2
[f,v,data] = plyread('brick2.ply','tri');
brick2VertexCount = size(v,1);
midPoint = sum(v)/brick1VertexCount;
brick2Verts = v - repmat(midPoint,brick2VertexCount,1);
brick2Pose = transl(0.6,-0.6,-0.13);
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
brick2Mesh_h = trisurf(f,brick2Verts(:,1) + brick2Pose(1,4),brick2Verts(:,2) + brick2Pose(2,4), brick2Verts(:,3) + brick2Pose(3,4) ...
    ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');

%brick3
[f,v,data] = plyread('brick3.ply','tri');
brick3VertexCount = size(v,1);
midPoint = sum(v)/brick3VertexCount;
brick3Verts = v - repmat(midPoint,brick3VertexCount,1);
brick3Pose = transl(0.8,-0.6,-0.2);
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
brick3Mesh_h = trisurf(f,brick3Verts(:,1) + brick3Pose(1,4),brick3Verts(:,2) + brick3Pose(2,4), brick3Verts(:,3) + brick3Pose(3,4) ...
    ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');



%Table
        [f,v,data] = plyread('table.ply','tri');
        tableVertexCount = size(v,1);
        midPoint = sum(v)/tableVertexCount;
        tableVerts = v - repmat(midPoint,tableVertexCount,1);
        tablePose = transl(0,0,-0.4);
        vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
        tableMesh_h = trisurf(f,tableVerts(:,1) + tablePose(1,4),tableVerts(:,2) + tablePose(2,4), tableVerts(:,3) + tablePose(3,4) ...
    ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
%floor
        [f,v,data] = plyread('floor.ply','tri');
        floorVertexCount = size(v,1);
        midPoint = sum(v)/floorVertexCount;
        floorVerts = v - repmat(midPoint,floorVertexCount,1);
        floorPose = transl(0,0,-0.65);
        vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
        floorMesh_h = trisurf(f,floorVerts(:,1) + floorPose(1,4),floorVerts(:,2) + floorPose(2,4), floorVerts(:,3) + floorPose(3,4) ...
    ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
%fence
        [f,v,data] = plyread('fence.ply','tri');
        fenceVertexCount = size(v,1);
        midPoint = sum(v)/fenceVertexCount;
        fenceVerts = v - repmat(midPoint,fenceVertexCount,1);
        fencePose = transl(0,0,0.2);
        vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
        fenceMesh_h = trisurf(f,fenceVerts(:,1) + fencePose(1,4),fenceVerts(:,2) + fencePose(2,4), fenceVerts(:,3) + fencePose(3,4) ...
    ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
%box
        [f,v,data] = plyread('obox.ply','tri');
        oboxVertexCount = size(v,1);
        midPoint = sum(v)/oboxVertexCount;
        oboxVerts = v - repmat(midPoint,oboxVertexCount,1);
        oboxPose = transl(-0.6,-0.6,0.05);
        vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
        oboxMesh_h = trisurf(f,oboxVerts(:,1) + oboxPose(1,4),oboxVerts(:,2) + oboxPose(2,4), oboxVerts(:,3) + oboxPose(3,4) ...
    ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');

%close box
    [f,v,data] = plyread('box.ply','tri');
        boxVertexCount = size(v,1);
        midPoint = sum(v)/boxVertexCount;
        boxVerts = v - repmat(midPoint,boxVertexCount,1);
        boxPose = transl(-0.8,0.6,0.05);
        vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
        boxMesh_h = trisurf(f,boxVerts(:,1) + boxPose(1,4),boxVerts(:,2) + boxPose(2,4), boxVerts(:,3) + boxPose(3,4) ...
    ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');

%estop
    [f,v,data] = plyread('estop.ply','tri');
        estopVertexCount = size(v,1);
        midPoint = sum(v)/estopVertexCount;
        estopVerts = v - repmat(midPoint,estopVertexCount,1);
        estopPose = transl(1,1,0.05);
        vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
        estopMesh_h = trisurf(f,estopVerts(:,1) + estopPose(1,4),estopVerts(:,2) + estopPose(2,4), estopVerts(:,3) + estopPose(3,4) ...
    ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
%% Movement
gui = app1_exported();
TStart = densoRobot.fkine(qStart);
Tobject = transl(0.2,-0.6,0);
TTarget = TStart;
TTarget(1:2,4) = Tobject(1:2,4);
steps = 50;
qTarget = densoRobot.ikcon(TTarget,densoRobot.getpos());
qMatrix = jtraj(qStart,qTarget,steps);
% densoRobot.animate(qMatrix);
for i = 1:size(qMatrix,1)
    while gui.eStop
    end
    densoRobot.plot(qMatrix(i,:));

end

Tobject1 = transl(0,0,-0.1);
TTarget1 = TTarget;
TTarget1(3,4) = Tobject1(3,4);
qTarget1 = densoRobot.ikcon(TTarget1,densoRobot.getpos());
qMatrix = jtraj(qTarget,qTarget1,steps);
% densoRobot.animate(qMatrix);
for i = 1:size(qMatrix,1)
    while gui.eStop
    end
    densoRobot.plot(qMatrix(i,:));
end

TTarget2 = TTarget1;
qTarget2 = densoRobot.ikcon(TTarget2,densoRobot.getpos());
qMatrix = jtraj(qTarget1,qTarget2,steps);
% densoRobot.animate(qMatrix);
for i = 1:size(qMatrix,1)
    while gui.eStop
    end
    densoRobot.plot(qMatrix(i,:));
    %% Move object
    Tcurrent = densoRobot.fkine(qMatrix(i,:));
    t = Tcurrent(1:3,4)';
    rotation = tr2rpy(Tcurrent);
    objectTransl = makehgtform('translate',t);
    objectRotate = makehgtform('xrotate',rotation(1),'yrotate',rotation(2),'zrotate',rotation(3));
    objectPose = objectTransl*objectRotate;
    updatedPoints = [objectPose * [brick1Verts,ones(brick1VertexCount,1)]']';  
    brick1Mesh_h.Vertices = updatedPoints(:,1:3);
end

Tobject3 = transl(-0.4,-0.6,0);
TTarget3 = TStart;
qTarget3 = densoRobot.ikcon(TTarget3,densoRobot.getpos());
qMatrix = jtraj(qTarget2,qTarget3,steps);
% densoRobot.animate(qMatrix);
for i = 1:size(qMatrix,1)
    while gui.eStop
    end
    densoRobot.plot(qMatrix(i,:));
    %% Move object
    Tcurrent = densoRobot.fkine(qMatrix(i,:));
    t = Tcurrent(1:3,4)';
    rotation = tr2rpy(Tcurrent);
    objectTransl = makehgtform('translate',t);
    objectRotate = makehgtform('xrotate',rotation(1),'yrotate',rotation(2),'zrotate',rotation(3));
    objectPose = objectTransl*objectRotate;
    updatedPoints = [objectPose * [brick1Verts,ones(brick1VertexCount,1)]']';  
    brick1Mesh_h.Vertices = updatedPoints(:,1:3);
end

TTarget4 = TTarget3;
TTarget4(1:2,4) = Tobject3(1:2,4);
qTarget4 = densoRobot.ikcon(TTarget4,densoRobot.getpos());
qMatrix = jtraj(qTarget3,qTarget4,steps);
% densoRobot.animate(qMatrix);
for i = 1:size(qMatrix,1)
    while gui.eStop
    end
    densoRobot.plot(qMatrix(i,:));
    %% Move object
    Tcurrent = densoRobot.fkine(qMatrix(i,:));
    t = Tcurrent(1:3,4)';
    rotation = tr2rpy(Tcurrent);
    objectTransl = makehgtform('translate',t);
    objectRotate = makehgtform('xrotate',rotation(1),'yrotate',rotation(2),'zrotate',rotation(3));
    objectPose = objectTransl*objectRotate;
    updatedPoints = [objectPose * [brick1Verts,ones(brick1VertexCount,1)]']';  
    brick1Mesh_h.Vertices = updatedPoints(:,1:3);
end

Tobject5 = transl(0,0,-0.2);
TTarget5 = TTarget4;
TTarget5(3,4) = Tobject5(3,4);
qTarget5 = densoRobot.ikcon(TTarget5,densoRobot.getpos());
qMatrix = jtraj(qTarget4,qTarget5,steps);
% densoRobot.animate(qMatrix);
for i = 1:size(qMatrix,1)
    while gui.eStop
    end
    densoRobot.plot(qMatrix(i,:));
    %% Move object
    Tcurrent = densoRobot.fkine(qMatrix(i,:));
    t = Tcurrent(1:3,4)';
    rotation = tr2rpy(Tcurrent);
    objectTransl = makehgtform('translate',t);
    objectRotate = makehgtform('xrotate',rotation(1),'yrotate',rotation(2),'zrotate',rotation(3));
    objectPose = objectTransl*objectRotate;
    updatedPoints = [objectPose * [brick1Verts,ones(brick1VertexCount,1)]']';  
    brick1Mesh_h.Vertices = updatedPoints(:,1:3);
end

TTarget6 = TTarget4;
qTarget6 = densoRobot.ikcon(TTarget6,densoRobot.getpos());
qMatrix = jtraj(qTarget5,qTarget6,steps);
% densoRobot.animate(qMatrix);
for i = 1:size(qMatrix,1)
    while gui.eStop
    end
    densoRobot.plot(qMatrix(i,:));
end

Tobject6 = transl(0.6,-0.6,0);
TTarget7 = TStart;
qTarget7 = densoRobot.ikcon(TTarget7,densoRobot.getpos());
qMatrix = jtraj(qTarget6,qTarget7,steps);
% densoRobot.animate(qMatrix);
for i = 1:size(qMatrix,1)
    while gui.eStop
    end
    densoRobot.plot(qMatrix(i,:));
end


TTarget8 = TTarget7;
TTarget8(1:2,4) = Tobject6(1:2,4);
steps = 50;
qTarget8 = densoRobot.ikcon(TTarget8,densoRobot.getpos());
qMatrix = jtraj(qTarget7,qTarget8,steps);
% densoRobot.animate(qMatrix);
for i = 1:size(qMatrix,1)
    while gui.eStop
    end
    densoRobot.plot(qMatrix(i,:));

end

Tobject7 = transl(0,0,-0.1);
TTarget9 = TTarget8;
TTarget9(3,4) = Tobject7(3,4);
qTarget9 = densoRobot.ikcon(TTarget9,densoRobot.getpos());
qMatrix = jtraj(qTarget8,qTarget9,steps);
% densoRobot.animate(qMatrix);
for i = 1:size(qMatrix,1)
    while gui.eStop
    end
    densoRobot.plot(qMatrix(i,:));
end

TTarget10 = TTarget8;
qTarget10 = densoRobot.ikcon(TTarget10,densoRobot.getpos());
qMatrix = jtraj(qTarget9,qTarget10,steps);
for i = 1:size(qMatrix,1)
    while gui.eStop
    end
    densoRobot.plot(qMatrix(i,:));
    %% Move object
    Tcurrent = densoRobot.fkine(qMatrix(i,:));
    t = Tcurrent(1:3,4)';
    rotation = tr2rpy(Tcurrent);
    objectTransl = makehgtform('translate',t);
    objectRotate = makehgtform('xrotate',rotation(1),'yrotate',rotation(2),'zrotate',rotation(3));
    objectPose = objectTransl*objectRotate;
    updatedPoints = [objectPose * [brick2Verts,ones(brick2VertexCount,1)]']';  
    brick2Mesh_h.Vertices = updatedPoints(:,1:3);
end

Tobject8 = transl(-0.8,-0.6,0);
TTarget11 = TTarget10;
TTarget11(1:2,4) = Tobject8(1:2,4);
qTarget11 = densoRobot.ikcon(TTarget11,densoRobot.getpos());
qMatrix = jtraj(qTarget10,qTarget11,steps);
for i = 1:size(qMatrix,1)
    while gui.eStop
    end
    densoRobot.plot(qMatrix(i,:));
    %% Move object
    Tcurrent = densoRobot.fkine(qMatrix(i,:));
    t = Tcurrent(1:3,4)';
    rotation = tr2rpy(Tcurrent);
    objectTransl = makehgtform('translate',t);
    objectRotate = makehgtform('xrotate',rotation(1),'yrotate',rotation(2),'zrotate',rotation(3));
    objectPose = objectTransl*objectRotate;
    updatedPoints = [objectPose * [brick2Verts,ones(brick2VertexCount,1)]']';  
    brick2Mesh_h.Vertices = updatedPoints(:,1:3);
end

Tobject9 = transl(0,0,-0.3);
TTarget12 = TTarget11;
TTarget12(3,4) = Tobject9(3,4);
qTarget12 = densoRobot.ikcon(TTarget12,densoRobot.getpos());
qMatrix = jtraj(qTarget11,qTarget12,steps);
for i = 1:size(qMatrix,1)
    while gui.eStop
    end
    densoRobot.plot(qMatrix(i,:));
    %% Move object
    Tcurrent = densoRobot.fkine(qMatrix(i,:));
    t = Tcurrent(1:3,4)';
    rotation = tr2rpy(Tcurrent);
    objectTransl = makehgtform('translate',t);
    objectRotate = makehgtform('xrotate',rotation(1),'yrotate',rotation(2),'zrotate',rotation(3));
    objectPose = objectTransl*objectRotate;
    updatedPoints = [objectPose * [brick2Verts,ones(brick2VertexCount,1)]']';  
    brick2Mesh_h.Vertices = updatedPoints(:,1:3);
end

TTarget13 = TTarget11;
qTarget13 = densoRobot.ikcon(TTarget13,densoRobot.getpos());
qMatrix = jtraj(qTarget12,qTarget13,steps);
% densoRobot.animate(qMatrix);
for i = 1:size(qMatrix,1)
    while gui.eStop
    end
    densoRobot.plot(qMatrix(i,:));
end
% hold on;
% densoRobot.teach;
% Robot1= densoRobot(transl(1,1,1));
%GetPose(Robot1,transl(0.1,0.2,0.3));

%%Enviroment
%     %Table
%         [f,v,data] = plyread('table.ply','tri');
%         vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
%         
%             tableMesh_h = trisurf(f,v(:,1),v(:,2), v(:,3) ...
%                 ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
      
            
       %brick
%         [f,v,data] = plyread('brick1.ply','tri');
%         vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
%         
%             brick1Mesh_h = trisurf(f,v(:,1),v(:,2), v(:,3) ...
%                 ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
%             
%          [f,v,data] = plyread('brick2.ply','tri');
%         vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
%         
%             brick2Mesh_h = trisurf(f,v(:,1),v(:,2), v(:,3) ...
%                 ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
%          [f,v,data] = plyread('brick3.ply','tri');
%         vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
%         
%             brick3Mesh_h = trisurf(f,v(:,1),v(:,2), v(:,3) ...
%                 ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
%             
%          [f,v,data] = plyread('brick4.ply','tri');
%         vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
%         
%             brick4Mesh_h = trisurf(f,v(:,1),v(:,2), v(:,3) ...
%                 ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
%             
%          [f,v,data] = plyread('brick5.ply','tri');
%         vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
%         
%             brick5Mesh_h = trisurf(f,v(:,1),v(:,2), v(:,3) ...
%                 ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
%          [f,v,data] = plyread('brick6.ply','tri');
%         vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
%         
%             brick6Mesh_h = trisurf(f,v(:,1),v(:,2), v(:,3) ...
%                 ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
%             
%          [f,v,data] = plyread('brick7.ply','tri');
%         vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
%         
%             brick7Mesh_h = trisurf(f,v(:,1),v(:,2), v(:,3) ...
%                 ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
%          [f,v,data] = plyread('brick8.ply','tri');
%         vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
%         
%             brick8Mesh_h = trisurf(f,v(:,1),v(:,2), v(:,3) ...
%                 ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
    
%     %Floor
%         [f,v,data] = plyread('floor.ply','tri');
%         vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
% 
%         FloorMesh_h = trisurf(f,v(:,1),v(:,2), v(:,3) ...
%             ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
%     %fence
%         [f,v,data] = plyread('fence.ply','tri');
%         vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
% 
%         FenceMesh_h = trisurf(f,v(:,1),v(:,2), v(:,3) ...
%             ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
%         
        %Model
%         [f,v,data] = plyread('untitled.ply','tri');
%         vertexColours = [data.vertex.gray, data.vertex.green, data.vertex.blue] / 255;
% 
%         UntitledMesh_h = trisurf(f,v(:,1),v(:,2), v(:,3) ...
%             ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');

     
classdef app1_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure     matlab.ui.Figure
        EstopButton  matlab.ui.control.Button
        LampLabel    matlab.ui.control.Label
        Lamp         matlab.ui.control.Lamp
    end

    
    properties (Access = public)
        eStop = false; % Description
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: EstopButton
        function EstopButtonPushed(app, event)
            if app.eStop
                app.eStop = false;
            else
                app.eStop = true;
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'UI Figure';

            % Create EstopButton
            app.EstopButton = uibutton(app.UIFigure, 'push');
            app.EstopButton.ButtonPushedFcn = createCallbackFcn(app, @EstopButtonPushed, true);
            app.EstopButton.Position = [271 230 100 22];
            app.EstopButton.Text = 'Estop';

            % Create LampLabel
            app.LampLabel = uilabel(app.UIFigure);
            app.LampLabel.HorizontalAlignment = 'right';
            app.LampLabel.Position = [270 280 36 22];
            app.LampLabel.Text = 'Lamp';

            % Create Lamp
            app.Lamp = uilamp(app.UIFigure);
            app.Lamp.Position = [321 280 20 20];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app1_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end
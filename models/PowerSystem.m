classdef PowerSystem < WorkspaceMapper
    %SYSTEM Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        data_script;
    end
    
    methods
        function obj = PowerSystem(data_script)
            %SYSTEM Construct an instance of this class
            %   Detailed explanation goes here
            obj.data_script = data_script;
            obj.build()
        end

        function build(obj)
            eval(obj.data_script);
            obj.export()
            lfybus
            obj.import()
        end

        function solve_flow(obj)
            obj.build()
            % Script execution
            obj.export()
            lfnewton
            obj.import()
        end

        function solve_stability(obj, nf, tc, tf, fline, figure_title) 
            obj.reset()
            obj.build()
            obj.solve_flow()
            tc = tc;
            nf = nf;
            tf = tf;
            fline = fline;
            figure_title = figure_title;
            % Script execution
            obj.export()
            trstab
            obj.import()
        end

        function show_flow(obj)
            obj.export()
            busout
        end

        function reset(obj)
            obj.dinamic_properties = struct();
        end
    end
end


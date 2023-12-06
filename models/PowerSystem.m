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
            eval(data_script);
            obj.import();
        end

        function build(obj)
            obj.export()
            lfybus
            obj.import()
        end

        function solve_flow(obj)
            obj.build()
            obj.export()
            lfnewton
            obj.import()
        end

        function solve_stability(obj, nf, tc, tf, fline)  
            obj.solve_flow()
            obj.export()
            tc_interval = [0, tf/2];
            nf = nf;
            tf = tf;
            fline = fline;

            trstab
            obj.import()
        end

        function bool_arr = is_stable(obj)
            obj.export()
            for i=1:length(del)
                delta_convergence(t, delta)
            end
        end

        function show_flow(obj)
            obj.export()
            busout
        end

        function show_stability(obj)
            obj.export()
        end
    end
end


classdef WorkspaceMapper < handle
    % Workspace interface object
    
    properties
        dinamic_properties = struct();
    end
    
    methods
        function obj = WorkspaceMapper()
            %Null constructor, dont need implementation
        end

        function export(obj)
            % Get field names
            fields = fieldnames(obj.dinamic_properties);
            
            % Iterate over fields
            for i = 1:length(fields)
                field_name = fields{i};
                field_value = obj.dinamic_properties.(field_name);
                assignin("caller", field_name, field_value)
            end
        end
       
        function import(obj)
            info_struct = evalin("caller", "whos");

            for i = 1:length(info_struct)
                varName = info_struct(i).name;
                obj.dinamic_properties.(varName) = evalin('caller', varName);
            end
        end

    end
end


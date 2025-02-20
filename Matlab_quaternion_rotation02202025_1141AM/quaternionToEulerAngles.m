function [yaw,pitch,roll] = quaternionToEulerAngles(q,unit)
arguments
        q
        unit{mustBeTextScalar, mustBeMember(unit, {'rad', 'deg'})} = 'rad'
    end
   

    if strcmp(unit, 'deg')
        conv = 1;
    else
        conv = 0;
    end

end
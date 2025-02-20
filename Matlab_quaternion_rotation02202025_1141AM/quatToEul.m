
function [yaw,pitch,roll] = quatToEul(q,unit)
arguments
        q
        unit{mustBeTextScalar, mustBeMember(unit, {'rad', 'deg'})} = 'rad'
    end
   

    if strcmp(unit, 'deg')
        conv = 1;
    else
        conv = 0;
    end
%yaw, pitch, roll
[q0,q1,q2,q3] = parts(q);
pitch = asin(2*(q0*q2-q1*q3));

roll = atan2(2*(q0*q1+q2*q3),q0.^2-q1.^2-q2.^2+q3.^2);

yaw = atan2(2*(q0*q3+q1*q2),q0.^2+q1.^2-q2.^2-q3.^2);

if conv
    [yaw,pitch,roll] = rad2deg([yaw,pitch,roll]);
end
end



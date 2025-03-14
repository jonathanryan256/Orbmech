function q = BodyToNedQuaternion(yaw,pitch,roll, unit)
%quaternion to represent a Body point in the NED frame%
%INPUTS:
%yaw: nx1 array
%pitch: nx1 array
%roll: nx1 array
%unit: "deg" or "rad" - default is "rad"
arguments
        yaw
        pitch
        roll
        unit{mustBeTextScalar, mustBeMember(unit, {'rad', 'deg'})} = 'rad'
    end
   

    if strcmp(unit, 'deg')
        yaw = deg2rad(yaw);
        pitch = deg2rad(pitch);
        roll = deg2rad(roll);
    end

zero = zeros(size(yaw));
q_yaw = quaternion(cos(yaw/2),zero,zero,sin(yaw/2));
q_pitch = quaternion(cos(pitch/2),zero,sin(pitch/2),zero);
q_roll = quaternion(cos(roll/2),sin(roll/2),zero,zero);

q = q_yaw.*q_pitch.*q_roll;
end
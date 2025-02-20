function q = BodyToNedQuaternion(yaw,pitch,roll, unit)
%quaternion to represent an Body point in the NED frame
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
q_yaw = quaternion(cos(yaw/2),0,0,sin(yaw/2));
q_pitch = quaternion(cos(pitch/2),0,sin(pitch/2),0);
q_roll = quaternion(cos(roll/2),sin(roll/2),0,0);

q = q_yaw.*q_pitch.*q_roll;
end
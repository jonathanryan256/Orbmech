function q = quatBodyToNed(q_in,yaw,pitch,roll,unit)
    arguments
        q_in
        yaw
        pitch
        roll
        unit{mustBeTextScalar, mustBeMember(unit, {'rad', 'deg'})} = 'rad'
    end
   

    q = BodyToNedQuaternion(yaw,pitch,roll,unit).*q_in;
end
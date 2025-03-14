function q = quatNedToBody(q_in,yaw,pitch,roll,unit)
%Convert an orientation quaternion from the NED frame to the Body frame
%
%INPUTS:
%q_in: nx1 matlab quaternion object
%yaw: nx1 array
%pitch: nx1 array
%roll: nx1 array
%unit: "deg" or "rad" - default is "rad"
    arguments
        q_in
        yaw
        pitch
        roll
        unit{mustBeTextScalar, mustBeMember(unit, {'rad', 'deg'})} = 'rad'
    end
   

    q = NedToBodyQuaternion(yaw,pitch,roll,unit).*q_in;
end
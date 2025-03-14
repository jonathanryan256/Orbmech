function q = quatBodyToWind(q_in,beta,alpha,unit)
%Convert an orientation quaternion from the Body frame to the Wind frame
%
%INPUTS:
%q_in: nx1 matlab quaternion object
%beta: sideslip angle, nx1 array
%alpha: angle of attack, nx1 array
%unit: "deg" or "rad" - default is "rad"

    arguments
        q_in
        beta
        alpha
        unit{mustBeTextScalar, mustBeMember(unit, {'rad', 'deg'})} = 'rad'
    end
   

    q = BodyToWindQuaternion(beta,alpha,unit).*q_in;
end
function q = BodyToWindQuaternion(beta,alpha,unit)
%quaternion to represent a Body point in the Wind frame
%
%INPUTS:
%beta: sideslip angle, nx1 array
%alpha: angle of attack, nx1 array
%unit: "deg" or "rad" - default is "rad"
arguments
        beta
        alpha
        unit{mustBeTextScalar, mustBeMember(unit, {'rad', 'deg'})} = 'rad'
    end
   

    if strcmp(unit, 'deg')
        beta = deg2rad(beta);
        alpha = deg2rad(alpha);
    end

    zero = zeros(size(beta));
%intrinsic
q_beta = quaternion(cos(beta/2),zero,zero,sin(beta/2));
q_alpha = quaternion(cos(alpha/2),zero,sin(alpha/2),zero);

q = q_beta.*q_alpha;
end
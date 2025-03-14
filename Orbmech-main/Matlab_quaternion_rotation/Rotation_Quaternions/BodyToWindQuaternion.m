function q = BodyToWindQuaternion(beta,alpha,unit)
%quaternion to represent an Body point in the Wind frame
arguments
        beta
        alpha
        unit{mustBeTextScalar, mustBeMember(unit, {'rad', 'deg'})} = 'rad'
    end
   

    if strcmp(unit, 'deg')
        beta = deg2rad(beta);
        alpha = deg2rad(alpha);
    end

%intrinsic
q_beta = quaternion(cos(beta/2),0,0,sin(beta/2));
q_alpha = quaternion(cos(alpha/2),0,sin(alpha/2),0);

q = q_beta.*q_alpha;
end
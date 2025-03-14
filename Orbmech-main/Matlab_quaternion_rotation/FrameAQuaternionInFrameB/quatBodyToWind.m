function q = quatBodyToWind(q_in,beta,alpha,unit)
    arguments
        q_in
        beta
        alpha
        unit{mustBeTextScalar, mustBeMember(unit, {'rad', 'deg'})} = 'rad'
    end
   

    q = BodyToWindQuaternion(beta,alpha,unit).*q_in;
end
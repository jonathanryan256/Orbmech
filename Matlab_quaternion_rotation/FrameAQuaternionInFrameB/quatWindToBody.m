function q = quatWindToBody(q_in,beta,alpha,unit)
    arguments
        q_in
        beta
        alpha
        unit{mustBeTextScalar, mustBeMember(unit, {'rad', 'deg'})} = 'rad'
    end
   

    q = WindToBodyQuaternion(beta,alpha,unit).*q_in;
end
function pPrime = pointWindToBody(beta,alpha,p,unit)
%Represent a Wind point in the Body frame
%
%INPUTS:
%beta: sideslip angle, nx1 array
%alpha: angle of attack, nx1 array
%p: nx3 matlab array - the points to be represented in a different frame
%unit: "deg" or "rad" - default is "rad"

    qRot = WindToBodyQuaternion(beta,alpha,unit);
    pPrime = rotatepoint(qRot,p);
end
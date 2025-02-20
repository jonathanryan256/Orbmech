function pPrime = pointBodyToWind(beta,alpha,p,unit)
    qRot = BodyToWindQuaternion(beta,alpha,unit);
    pPrime = rotatepoint(qRot,p);
end
function pPrime = pointWindToBody(beta,alpha,p,unit)
    qRot = WindToBodyQuaternion(beta,alpha,unit);
    pPrime = rotatepoint(qRot,p);
end
function pPrime = pointEcefToNed(latd,lngd,p)
    qRot = EcefToNedQuaternion(latd,lngd);
    pPrime = rotatepoint(qRot,p);
end
function pPrime = pointNedToEcef(latd,lngd,p)
    qRot = NedToEcefQuaternion(latd,lngd);
    pPrime = rotatepoint(qRot,p);
end
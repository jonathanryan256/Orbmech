function pPrime = pointBodyToNed(yaw,pitch,roll,p,unit)
    qRot = BodyToNedQuaternion(yaw,pitch,roll,unit);
    pPrime = rotatepoint(qRot,p);
end
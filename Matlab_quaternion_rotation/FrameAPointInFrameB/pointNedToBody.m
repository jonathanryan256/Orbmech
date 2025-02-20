function pPrime = pointNedToBody(yaw,pitch,roll,p,unit)
    qRot = NedToBodyQuaternion(yaw,pitch,roll,unit);
    pPrime = rotatepoint(qRot,p);
end
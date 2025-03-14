function pPrime = pointNedToEcef(latd,lngd,p)
%Represent a NED point in the ECEF frame
%
%INPUTS:
%latd: latitude angle in degrees, nx1 array
%lngd: longitude angle in degrees, nx1 array
%p: nx3 matlab array - the points to be represented in a different frame

    qRot = NedToEcefQuaternion(latd,lngd);
    pPrime = rotatepoint(qRot,p);
end
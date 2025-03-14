function pPrime = pointEcefToNed(latd,lngd,p)
%Represent an ECEF point in the NED frame
%
%INPUTS:
%latd: latitude angle in degrees, nx1 array
%lngd: longitude angle in degrees, nx1 array
%p: nx3 matlab array - the points to be represented in a different frame

    qRot = EcefToNedQuaternion(latd,lngd);
    pPrime = rotatepoint(qRot,p);
end
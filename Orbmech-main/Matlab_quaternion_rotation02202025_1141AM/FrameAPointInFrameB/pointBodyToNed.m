function pPrime = pointBodyToNed(yaw,pitch,roll,p,unit)
%Represent a Body point in the NED frame
%
%INPUTS:
%yaw: nx1 array
%pitch: nx1 array
%roll: nx1 array
%p: nx3 matlab array - the points to be represented in a different frame
%unit: "deg" or "rad" - default is "rad"

    qRot = BodyToNedQuaternion(yaw,pitch,roll,unit);
    pPrime = rotatepoint(qRot,p);
end
function q = quatEcefToNed(q_in,latd,lngd)
%Convert an orientation quaternion from the ECEF frame to the NED frame
%
%INPUTS:
%q_in: nx1 matlab quaternion object
%latd: latitude angle in degrees, nx1 array
%lngd: longitude angle in degrees, nx1 array

    arguments
        q_in
        latd
        lngd
    end
   

    q = EcefToNedQuaternion(latd,lngd).*q_in;
end
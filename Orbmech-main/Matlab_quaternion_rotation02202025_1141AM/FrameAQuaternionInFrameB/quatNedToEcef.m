function q = quatNedToEcef(q_in,latd,lngd)
%Convert an orientation quaternion from the NED frame to the ECEF frame
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
   

    q = NedToEcefQuaternion(latd,lngd).*q_in;
end
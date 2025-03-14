function q = NedToEcefQuaternion(latd,lngd)
%quaternion to represent a NED point in the ECEF frame
%
%INPUTS:
%latd: latitude angle in degrees, nx1 array
%lngd: longitude angle in degrees, nx1 array

lat = deg2rad(latd);
lng = deg2rad(lngd);

zero = zeros(size(latd));
%intrinsic
q_z = quaternion(cos(lng/2),zero,zero,sin(lng/2));
q_y = quaternion(cos(-lat/2-deg2rad(90)/2),zero,sin(-lat/2-deg2rad(90)/2),zero);

q = q_z.*q_y; %rotate about y then about z (extrinsic)
end
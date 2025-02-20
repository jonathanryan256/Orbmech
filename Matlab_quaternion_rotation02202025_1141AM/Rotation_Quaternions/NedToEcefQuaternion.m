function q = NedToEcefQuaternion(latd,lngd)
%quaternion to represent an NED point in the ECEF frame

lat = deg2rad(latd);
lng = deg2rad(lngd);


%intrinsic
q_z = quaternion(cos(lng/2),0,0,sin(lng/2));
q_y = quaternion(cos(-lat/2-deg2rad(90)/2),0,sin(-lat/2-deg2rad(90)/2),0);

q = q_z.*q_y; %rotate about y then about z (extrinsic)
end
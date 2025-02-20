function q = EcefToNedQuaternion(latd,lngd)
%quaternion to represent an ECEF point in the NED frame

lat = deg2rad(latd);
lng = deg2rad(lngd);


q_z = quaternion(cos(-lng/2),0,0,sin(-lng/2));
q_y = quaternion(cos(+lat/2+deg2rad(90)/2),0,sin(lat/2+deg2rad(90)/2),0);

q = q_y.*q_z;
end
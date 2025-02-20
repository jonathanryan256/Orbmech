function err = eulerToQuatToEulerTest(n)
%error should all be zero, but its not
err = zeros(n,3);
for i = 1:n
    roll = 360*rand(1)-180;
    pitch = 180*rand(1)-90;
    yaw = 360*rand(1)-180;
    E_orig = [yaw,pitch,roll];
    q = BodyToNedQuaternion(yaw,pitch,roll,"deg");
    E=eulerd(q,"ZYX","frame");
    err(i,:) = E-E_orig;
end`` 
end
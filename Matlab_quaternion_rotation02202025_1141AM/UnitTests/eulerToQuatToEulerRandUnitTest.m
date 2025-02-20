function pass = eulerToQuatToEulerRandUnitTest(n)
    %n is number of random tests
    err = zeros(n,1);

        for i = 1:n
            u = randi([0,1]);
            if u == 1
                unit = 'deg';
                yaw = 360*rand(1)-180;
                pitch = 180*rand(1)-90;
                roll = 360*rand(1)-180;
            else
                unit = 'rad';
                yaw = 2*pi*rand(1)-pi;
                pitch = pi*rand(1)-pi/2;
                roll = 2*pi*rand(1)-pi;
            end
            unit
            E = [yaw,pitch,roll];
            q = BodyToNedQuaternion(yaw,pitch,roll,unit);
            E2 = quaternionToEuler(q,unit);
            err(i) = norm(E2-E);
        end
    if norm(err)<1e-9*sqrt(n)
        pass = "Passed";
    else
        pass = "Failed";
    end
end
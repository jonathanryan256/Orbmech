function pass = eulerToQuatToEulerRandUnitTest(n,unit)
    arguments
        n
        unit{mustBeTextScalar,mustBeMember(unit,{'rad','deg'})} = 'rad'
    end
    err = zeros(n,1);
    if strcmp(unit,'deg')
        for i = 1:n
            yaw = 360*rand(1)-180;
            pitch = 180*rand(1)-90;
            roll = 360*rand(1)-180;
            E = [yaw,pitch,roll];
            q = BodyToNedQuaternion(yaw,pitch,roll,unit);
            E2 = quaternionToEuler(q,unit);
            err(i) = norm(E2-E);
        end
    else
        for i = 1:n
            yaw = 2*pi*rand(1)-pi;
            pitch = pi*rand(1)-pi/2;
            roll = 2*pi*rand(1)-pi;
            E = [yaw,pitch,roll];
            q = BodyToNedQuaternion(yaw,pitch,roll,unit);
            E2 = quaternionToEuler(q,unit);
            err(i) = norm(E2-E);
        end
    end
    if norm(err)<1e-9*sqrt(n)
        pass = "Passed";
    else
        pass = "Failed";
    end
end
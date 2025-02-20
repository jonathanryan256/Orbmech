function pass = pointBodyToNedToBodyUnitTest(n)
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
        p = 10*rand(1,3)-[5,5,5];
        pNed = pointBodyToNed(yaw,pitch,roll,p,unit);
        p2 = pointNedToBody(yaw,pitch,roll,pNed,unit);
        err(i) = norm(p2-p);
        unit
    end
    
    if norm(err)<1e-9*sqrt(n)
        pass = "Passed";
    else
        pass = "Failed";
    end
end
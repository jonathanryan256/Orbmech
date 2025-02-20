function pass = quatNedToEcefToNedUnitTest(n)
    %n is number of random tests
    err = zeros(n,1);
    for i = 1:n
        q = rand(1,4);
        q = q/norm(q);
        q = quaternion(q);
        latd = 180*rand(1)-90;
        lngd = 360*rand(1)-180;
        qEcef = quatNedToEcef(q,latd,lngd);
        q2 = quatEcefToNed(qEcef,latd,lngd);
        err(i) = norm(q2-q);
    end
    if norm(err)<1e-9*sqrt(n)
        pass = "Passed";
    else
        pass = "Failed";
    end
end
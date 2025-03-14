function pass = pointNedToEcefToNedUnitTest(n)
    %n is number of random tests
    err = zeros(n,1);

    for i = 1:n
        latd = 180*rand(1)-90;
        lngd = 360*rand(1)-180;
        p = 10*rand(1,3)-[5,5,5];
        pEcef = pointNedToEcef(latd,lngd,p);
        p2 = pointEcefToNed(latd,lngd,pEcef);
        err(i) = norm(p2-p);
    end

    if norm(err)<1e-9*sqrt(n)
        pass = "Passed";
    else
        pass = "Failed";
    end
end
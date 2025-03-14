function pass = pointBodyToWindToBodyUnitTest(n)
    %n is number of random tests
    err = zeros(n,1);

    for i = 1:n
        u = randi([0,1]);
        if u == 1
            unit = 'deg';
            beta = 360*rand(1)-180;
            alpha = 180*rand(1)-90;
            
        else
            unit = 'rad';
            beta = 2*pi*rand(1)-pi;
            alpha = pi*rand(1)-pi/2;
        end
        p = 10*rand(1,3)-[5,5,5];
        pWind = pointBodyToWind(beta,alpha,p,unit);
        p2 = pointWindToBody(beta,alpha,pWind,unit);
        err(i) = norm(p2-p);
        %unit
    end

    if norm(err)<1e-9*sqrt(n)
        pass = "Passed";
    else
        pass = "Failed";
    end
end
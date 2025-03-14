function pass = quatBodyToWindToBodyUnitTest(n)
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
        q = rand(1,4);
        q = q/norm(q);
        q = quaternion(q);
        qWind = quatBodyToWind(q,beta,alpha,unit);
        q2 = quatWindToBody(qWind,beta,alpha,unit);
        err(i) = norm(q2-q);
    end
    if norm(err)<1e-9*sqrt(n)
        pass = "Passed";
    else
        pass = "Failed";
    end
end
function q = quatNedToEcef(q_in,latd,lngd)
    arguments
        q_in
        latd
        lngd
    end
   

    q = NedToEcefQuaternion(latd,lngd).*q_in;
end
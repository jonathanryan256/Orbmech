function q = quatEcefToNed(q_in,latd,lngd)
    arguments
        q_in
        latd
        lngd
    end
   

    q = EcefToNedQuaternion(latd,lngd).*q_in;
end
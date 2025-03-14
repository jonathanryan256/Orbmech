function err = matlabQuatFunctionTest(n)
%error should all be zero, but its not
err = zeros(n,1);
for i = 1:n
    q = rand(1,4);
    q = 2*q-1;
    q = q/norm(q);
    Quat = quaternion(q);
    E = eulerd(Quat,"ZYX","frame");
    Quat2 = quaternion(E,"eulerd","ZYX","frame");
    err(i)=norm(Quat-Quat2);
end
end
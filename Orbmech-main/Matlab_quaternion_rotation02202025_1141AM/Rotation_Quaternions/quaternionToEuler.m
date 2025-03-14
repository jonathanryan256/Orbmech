function E = quaternionToEuler(q,unit)
%Convert an orientation quaternion to euler angles - does not change
%reference frame, so make sure your quaternion is in the right reference
%frame
%
%INPUTS:
%q: nx1 matlab quaternion object
%unit: "deg" or "rad" - default is "rad"
    arguments
        q
        unit{mustBeTextScalar, mustBeMember(unit,{'rad','deg'})} = 'rad'
    end
    if strcmp(unit,"deg")
        E = eulerd(q,"ZYX","frame"); % For some reason frame works and point doesn't
    else
        E = euler(q,"ZYX","frame"); % For some reason frame works and point doesn't
    end
end
function E = quaternionToEuler(q,unit)
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
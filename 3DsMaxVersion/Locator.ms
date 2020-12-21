fn FindLocator name =
(
    locator = getNodeByName name
    
    if(superClassOf locator == helper) then(
        return locator
    )

    return false  
)
l1 = findLocator "Loc_LeftEyeCtrl"
-- include "CommonFunction.ms"
fn AddCricle cirName cirRadius cirColor = (  
    cir = circle radius:cirRadius name:cirName wireColor:cirColor
    return cir
)

fn AddPoint pointName pointSize pointsColor = (  
    pit = point name:pointName size: pointSize wireColor:pointsColor
    return pit
)
fn AddDummy dummyName dummySize = (  
    dum = Dummy name:dummyName boxsize: dummySize 
    return dum
)

fn CreateController = (
    -- Shape Part
    cir = AddCricle "face_CircleCtr" 0.25 blue
    pit = AddPoint "face_PointLoc" 0.25 blue
    dum = AddDummy "face_dumEXP" [0.25, 0.25, 0.25] 

    -- Axis
    cir.rotation.x_rotation=90
    -- RotatePivot cir 90 0 -90
    -- RotatePivot points 90 0 -90
    -- RotatePivot dum 90 0 -90
    cir.parent = dum
    dum.parent = points

    -- FreezeTransform pit

	return pit
)


-- CreateController()
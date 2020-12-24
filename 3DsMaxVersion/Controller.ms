-- include "CommonFunction.ms"
fn AddCricle cirName cirRadius cirColor = (  
    cir = circle radius:cirRadius name:cirName wireColor:cirColor
    cir.rotation.x_rotation = 90
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
fn AddRectangle RectangleName RectangleLenght RectangleWidth RectangleColor = (  
    rec = Rectangle name:RectangleName wireColor:RectangleColor
    rec.width = RectangleWidth
    rec.length = RectangleLenght
    rec.rotation.x_rotation = 90
    return rec 
)


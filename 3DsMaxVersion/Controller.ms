include "CommonFunction.ms"
fn AddCricle cirName cirRadius cirColor = (  
    cir = circle radius:cirRadius name:cirName wireColor:cirColor
    return cir
)
fn CreateController = (

    -- Shape Part
    cir = AddCricle "Circleabc" 20 [0, 0, 150]
    -- cir.name = "Circleabc"
    
    -- Convert to Editable Spline
    
    -- Name

    -- Color

    -- Axis
    cir.rotation.x_rotation=90
    RotatePivot cir 90 0 -90
    
)

CreateController()
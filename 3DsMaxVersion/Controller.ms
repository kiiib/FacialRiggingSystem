-- include "CommonFunction.ms"
fn AddCricle cirName cirRadius cirColor = (  
    cir = circle radius:cirRadius name:cirName wireColor:cirColor
    return cir
)
fn CreateComController = (
    -- Shape Part
    cir = AddCricle "face_CircleCtr" 0.25 blue
    -- Axis
    cir.rotation.x_rotation=90
    -- RotatePivot cir 90 0 -90
    -- RotatePivot points 90 0 -90
    -- RotatePivot dum 90 0 -90
    --cir.parent = dum
    --dum.parent = points

    -- FreezeTransform pit

	
)
--Create"AimEyeRectangle"
fn AddRectangle RectangleName RectangleLenght RectangleWidth RectangleColor = (  
    rec = Rectangle name:RectangleName wireColor:RectangleColor
    rec.width = RectangleWidth
    rec.length = RectangleLenght
    return rec 
)
fn CreateRectangle = (
    rec = AddRectangle "AimEye" 6 15 blue
    rec.rotation.x_rotation=90
)
fn AddEyeRtCtrl eyeRtCtrlName  eyeRtCtrlRadius eyeRtCtrlColor = (  
    eyeRtCtrl = circle radius:eyeRtCtrlRadius name:eyeRtCtrlName wireColor:eyeRtCtrlColor
    return eyeRtCtrl
)
fn CreatEyeRtCtrl = (
    eyeRtCtrl = AddEyeRtCtrl  "EyeRtCtrl" 2 blue
    
    eyeRtCtrl.rotation.x_rotation=90
)
fn AddEyeLfCtrl eyeLfCtrlName  eyeLfCtrlRadius eyeLfCtrlColor = (  
    eyeLfCtrl = circle radius:eyeLfCtrlRadius name:eyeLfCtrlName wireColor:eyeLfCtrlColor
    return eyeLfCtrl
)
fn CreatEyeLfCtrl = (
    eyeLfCtrl = AddEyeLfCtrl  "EyeLfCtrl" 2 blue
    
    eyeLfCtrl.rotation.x_rotation=90
)
fn faceSystemCtrl = (
    CreateComController()
    CreateRectangle()
    CreatEyeRtCtrl()
    CreatEyeLfCtrl ()
)
faceSystemCtrl()

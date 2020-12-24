filein "Controller.ms"

fn faceSystem = (
    ------- Eye Part -------

    -- Get Locator
    Loc_LeftEyeCtrl1 = FindLocator "Loc_LeftEyeCtrl1"
    Loc_LeftEyeCtrl2 = FindLocator "Loc_LeftEyeCtrl2"
    Loc_LeftEyeCtrl3 = FindLocator "Loc_LeftEyeCtrl3"

    -- Create Controller
    eyeRtCtrl = AddCricle "EyeRtCtrl" 2 blue
    eyeLfCtrl = AddCricle "EyeLfCtrl" 2 blue
    AimEyeCtrl = AddRectangle "AimEye" 6 15 blue

    -- Create Bones
    bone_LeftEye1 = AddBone [0, 0, 0] [0, 0, 5]
    bone_LeftEye2 = AddBone [0, 0, 0] [0, 0, 5]
    bone_LeftEye3 = AddBone [0, 0, 0] [0, 0, 5]

    ------- End Eye Part --------

    ------- Eyebrow Part -------

    ------- End Eyebrow Part --------
)
faceSystem()
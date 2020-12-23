filein "CommonFunction.ms"
filein "WindowGUI.ms"
filein "Controller.ms"
filein "Bone.ms"
filein "AssignControllerFunction.ms"

fn Main = (
    ------Left Eye Part--------

    -- Get Locator
    Loc_LeftEyeCtrl = FindLocator "Loc_LeftEyeCtrl"
    Loc_LeftEyeBone1 = FindLocator "Loc_LeftEyeBone1"
    Loc_LeftEyeBone2 = FindLocator "Loc_LeftEyeBone2"
    Loc_LeftEyeBone3 = FindLocator "Loc_LeftEyeBone3"

    -- Create Controller
    ctrl_LeftEye = CreateController()

    -- Create Bones
    bone_LeftEye1 = AddBone [0, 0, 0] [0, 0, 5]
    bone_LeftEye2 = AddBone [0, 0, 0] [0, 0, 5]
    bone_LeftEye3 = AddBone [0, 0, 0] [0, 0, 5]

    -- Align the objects to the locator
    AlignTwoObject ctrl_LeftEye Loc_LeftEyeCtrl
    AlignTwoObject bone_LeftEye1 Loc_LeftEyeBone1
    AlignTwoObject bone_LeftEye2 Loc_LeftEyeBone2
    AlignTwoObject bone_LeftEye3 Loc_LeftEyeBone3

    -- Init Controllers and bones
    FreezeTransform ctrl_LeftEye
    FreezeTransform bone_LeftEye1
    FreezeTransform bone_LeftEye2
    FreezeTransform bone_LeftEye3

    
    scriptContent = "degTorad((face_PointLoc.controller[1][2].value)[3])"
    -- scriptContent = ""
    AssignOneAxisFloatScriptRotationController bone_LeftEye1 ctrl_LeftEye "Z" scriptContent

    -- Relation between the Controller and Bones
    -- BoneControllerRelation bone_LeftEye1 ctrl_LeftEye
    -- BoneControllerRelation bone_LeftEye2 ctrl_LeftEye
    -- BoneControllerRelation bone_LeftEye3 ctrl_LeftEye

    --AlignTwoObject ctrl1 selection[1]
    -- b = box pos:[0, 0, 0]
    -- RotatePivot b 90 0 180
    
    ------End Left Eye Part--------
)

Main()
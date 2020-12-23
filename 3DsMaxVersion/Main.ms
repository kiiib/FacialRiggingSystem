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
    ctrl_LeftEye2 = CreateController()
    ctrl_LeftEye2.name = "dfdsf"

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
    FreezeTransform ctrl_LeftEye2
    FreezeTransform bone_LeftEye1
    FreezeTransform bone_LeftEye2
    FreezeTransform bone_LeftEye3

    -- Script Variables
    ctrlVar = #()
    append ctrlVar ctrl_LeftEye
    append ctrlVar ctrl_LeftEye2

    -- Assign script
    RotZScriptContent = "degTorad((" + ctrlVar[1].name + ".controller[1][2].value)[3] + (" + ctrlVar[2].name + ".controller[1][2].value)[2])"
    PosYScriptContent = "(" + ctrlVar[1].name + ".controller[1][2].value)[3] * 0.8 + (" + ctrlVar[2].name + ".controller[1][2].value)[3] * 0.5"
    AssignOneAxisFloatScriptRotationController bone_LeftEye1 ctrlVar "Z" RotZScriptContent
    AssignOneAxisFloatScriptPositionController bone_LeftEye1 ctrlVar "Y" PosYScriptContent

    PosScriptContent = "[(" + ctrlVar[1].name + ".controller[1][2].value)[1] + (" + ctrlVar[2].name + ".controller[1][2].value)[1], (" + ctrlVar[1].name + ".controller[1][2].value)[2] + (" + ctrlVar[2].name + ".controller[1][2].value)[2], (" + ctrlVar[1].name + ".controller[1][2].value)[3] + (" + ctrlVar[2].name + ".controller[1][2].value)[3]]"
    AssignPositionScriptController bone_LeftEye2 ctrlVar PosScriptContent
    
    ------End Left Eye Part--------
)

Main()
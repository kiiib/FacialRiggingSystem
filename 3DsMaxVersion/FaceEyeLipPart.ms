fn FaceEyeLipPart jt_head mainCtrl = (
    ------- EyeLipRt Part -------
    -- Get JtLocator -------
    loc_eyeLidRtUpInner = FindLocator "Loc_EyeLidUpRtJt001"
    loc_eyeLidRtUpOuter = FindLocator "Loc_EyeLidUpRtJt002"
    loc_eyeLidRtDnInner = FindLocator "Loc_EyeLidDnRtJt001"
    loc_eyeLidRtDnOuter = FindLocator "Loc_EyeLidDnRtJt002"

    -- Get CtrlLocator -------
    loc_eyeLidRtInCtrl = FindLocator "Loc_EyeLidUpRtInCtrl001"
    loc_eyeLidRtOutCtrl = FindLocator "Loc_EyeLidUpRtOutCtrl001"


    -- Create Controller
    ctrl_eyeLipRtIn = AddCricle loc_eyeLidRtInCtrl 0.4 blue
    ctrl_eyeLipRtOut= AddCricle loc_eyeLidRtOutCtrl 0.4 blue

    -- Create Bones
    bone_eyeLidRtUpInner = AddBone loc_eyeLidRtUpInner [0, 0, 0] [0, 2, 0] 
    bone_eyeLidRtUpOuter = AddBone loc_eyeLidRtUpOuter [0, 0, 0] [0, 2, 0]

    bone_eyeLidRtDnInner = AddBone loc_eyeLidRtDnInner [0, 0, 0] [0, 2, 0] 
    bone_eyeLidRtDnOuter = AddBone loc_eyeLidRtDnOuter [0, 0, 0] [0, 2, 0] 

    -- Align the objects to the locator
    AlignTwoObject ctrl_eyeLipRtIn loc_eyeLidRtInCtrl
    AlignTwoObject ctrl_eyeLipRtOut loc_eyeLidRtOutCtrl
    AlignTwoObject bone_eyeLidRtUpInner loc_eyeLidRtUpInner
    AlignTwoObject bone_eyeLidRtUpOuter loc_eyeLidRtUpOuter
    AlignTwoObject bone_eyeLidRtDnInner loc_eyeLidRtDnInner
    AlignTwoObject bone_eyeLidRtDnOuter loc_eyeLidRtDnOuter



    -- Parent and Constraint Relevance
    ctrl_eyeLipRtIn.parent = mainCtrl
    ctrl_eyeLipRtOut.parent = mainCtrl
    bone_eyeLidRtUpInner.parent = jt_head
    bone_eyeLidRtUpOuter.parent = jt_head
    bone_eyeLidRtDnInner.parent = jt_head
    bone_eyeLidRtDnOuter.parent = jt_head

    -- Init Controllers and bones
    FreezeTransform ctrl_eyeLipRtIn
    FreezeTransform ctrl_eyeLipRtOut
    FreezeTransform bone_eyeLidRtUpInner
    FreezeTransform bone_eyeLidRtUpOuter
    FreezeTransform bone_eyeLidRtDnInner
    FreezeTransform bone_eyeLidRtDnOuter
    
    -- Script Variables
    ctrlVarEyeLipUpInRt = #()
    ctrlVarEyeLipUpOutRt = #()
    append ctrlVarEyeLipUpInRt ctrl_eyeLipRtIn
    append ctrlVarEyeLipUpOutRt ctrl_eyeLipRtOut

    -- Assign script
    PosXScriptInContent ="(" + ctrlVarEyeLipUpInRt[1].name + ".controller[1][2].value)[3] * 0.3"
    PosZScriptInContent ="(" + ctrlVarEyeLipUpInRt[1].name + ".controller[1][2].value)[1] * 0.3"

    PosXScriptOutContent ="(" + ctrlVarEyeLipUpOutRt[1].name + ".controller[1][2].value)[3] * 0.3"
    PosZScriptOutContent ="(" + ctrlVarEyeLipUpOutRt[1].name + ".controller[1][2].value)[1] * 0.3"

    PosXScriptDnInContent ="(" + ctrlVarEyeLipUpInRt[1].name + ".controller[1][2].value)[3] * 0.3"
    PosZScriptDnInContent ="(" + ctrlVarEyeLipUpInRt[1].name + ".controller[1][2].value)[1] * 0.3"

    PosXScriptDnOutContent ="(" + ctrlVarEyeLipUpOutRt[1].name + ".controller[1][2].value)[3] * 0.3"
    PosZScriptDnOutContent ="(" + ctrlVarEyeLipUpOutRt[1].name + ".controller[1][2].value)[1] * 0.3"

    -- Assign Script to Controller
    AssignOneAxisFloatScriptPositionController  bone_eyeLidRtUpInner ctrlVarEyeLipUpInRt "X" PosXScriptInContent
    AssignOneAxisFloatScriptPositionController bone_eyeLidRtUpInner ctrlVarEyeLipUpInRt "Z" PosZScriptInContent

    AssignOneAxisFloatScriptPositionController  bone_eyeLidRtUpOuter ctrlVarEyeLipUpOutRt "X"  PosXScriptOutContent
    AssignOneAxisFloatScriptPositionController bone_eyeLidRtUpOuter ctrlVarEyeLipUpOutRt "Z" PosZScriptOutContent

    AssignOneAxisFloatScriptPositionController  bone_eyeLidRtDnInner ctrlVarEyeLipUpInRt "X" PosXScriptDnInContent
    AssignOneAxisFloatScriptPositionController bone_eyeLidRtDnInner ctrlVarEyeLipUpInRt "Z" PosZScriptDnInContent

    AssignOneAxisFloatScriptPositionController  bone_eyeLidRtDnOuter ctrlVarEyeLipUpOutRt "X" PosXScriptDnOutContent
    AssignOneAxisFloatScriptPositionController bone_eyeLidRtDnOuter ctrlVarEyeLipUpOutRt "Z" PosZScriptDnOutContent
    ------- End EyeLipUpRt Part --------

    ------- EyeLipLf Part -------
    -- Get JtLocator -------
    loc_eyeLidLfUpInner = FindLocator "Loc_EyeLidUpLfJt001"
    loc_eyeLidLfUpOuter = FindLocator "Loc_EyeLidUpLfJt002"
    loc_eyeLidLfDnInner = FindLocator "Loc_EyeLidDnLfJt001"
    loc_eyeLidLfDnOuter = FindLocator "Loc_EyeLidDnLfJt002"

    -- Get CtrlLocator -------
    loc_eyeLidLfInCtrl = FindLocator "Loc_EyeLidUpLfInCtrl001"
    loc_eyeLidLfOutCtrl = FindLocator "Loc_EyeLidUpLfOutCtrl001"

    -- Create Controller-------
    ctrl_eyeLidLfIn = AddCricle loc_eyeLidLfInCtrl 0.4 blue
    ctrl_eyeLidLfOut = AddCricle loc_eyeLidLfOutCtrl 0.4 blue

    -- Create Bones-------
    bone_eyeLidLfUpInner = AddBone loc_eyeLidLfUpInner [0, 0, 0] [0, 2, 0] 
    bone_eyeLidLfUpOuter = AddBone loc_eyeLidLfUpOuter [0, 0, 0] [0, 2, 0]

    bone_eyeLidLfDnInner = AddBone loc_eyeLidLfDnInner [0, 0, 0] [0, 2, 0] 
    bone_eyeLidLfDnOuter = AddBone loc_eyeLidLfDnOuter [0, 0, 0] [0, 2, 0] 

    -- Align the objects to the locator-------
    AlignTwoObject ctrl_eyeLidLfIn loc_eyeLidLfInCtrl
    AlignTwoObject ctrl_eyeLidLfOut loc_eyeLidLfOutCtrl
    AlignTwoObject bone_eyeLidLfUpInner loc_eyeLidLfUpInner
    AlignTwoObject bone_eyeLidLfUpOuter loc_eyeLidLfUpOuter
    AlignTwoObject bone_eyeLidLfDnInner loc_eyeLidLfDnInner
    AlignTwoObject bone_eyeLidLfDnOuter loc_eyeLidLfDnOuter

    -- Parent and Constraint Relevance-------
    ctrl_eyeLidLfIn.parent = mainCtrl
    ctrl_eyeLidLfOut.parent = mainCtrl
    bone_eyeLidLfUpInner.parent = jt_head
    bone_eyeLidLfUpOuter.parent = jt_head
    bone_eyeLidLfDnInner.parent = jt_head
    bone_eyeLidLfDnOuter.parent = jt_head

    -- Init Controllers and bones-------
    FreezeTransform ctrl_eyeLidLfIn
    FreezeTransform ctrl_eyeLidLfOut
    FreezeTransform bone_eyeLidLfUpInner
    FreezeTransform bone_eyeLidLfUpOuter
    FreezeTransform bone_eyeLidLfDnInner
    FreezeTransform bone_eyeLidLfDnOuter
    
    -- Script Variables-------
    ctrlVarEyeLipUpInLf = #()
    ctrlVarEyeLipUpOutLf = #()
    append ctrlVarEyeLipUpInLf ctrl_eyeLidLfIn
    append ctrlVarEyeLipUpOutLf ctrl_eyeLidLfOut

    -- Assign script-------
    PosXScriptInLfContent ="(" + ctrlVarEyeLipUpInLf[1].name + ".controller[1][2].value)[3] * 0.3"
    PosZScriptInLfContent ="(" + ctrlVarEyeLipUpInLf[1].name + ".controller[1][2].value)[1] * 0.3"

    PosXScriptOutLfContent ="(" + ctrlVarEyeLipUpOutLf[1].name + ".controller[1][2].value)[3] * 0.3"
    PosZScriptOutLfContent ="(" + ctrlVarEyeLipUpOutLf[1].name + ".controller[1][2].value)[1] * 0.3"

    PosXScriptDnLfInContent ="(" + ctrlVarEyeLipUpInLf[1].name + ".controller[1][2].value)[3] * 0.3"
    PosZScriptDnLfInContent ="(" + ctrlVarEyeLipUpInLf[1].name + ".controller[1][2].value)[1] * 0.3"

    PosXScriptDnLfOutContent ="(" + ctrlVarEyeLipUpOutLf[1].name + ".controller[1][2].value)[3] * 0.3"
    PosZScriptDnLfOutContent ="(" + ctrlVarEyeLipUpOutLf[1].name + ".controller[1][2].value)[1] * 0.3"

    -- Assign Script to Controller-------
    AssignOneAxisFloatScriptPositionController  bone_eyeLidLfUpInner ctrlVarEyeLipUpInLf "X" PosXScriptInLfContent
    AssignOneAxisFloatScriptPositionController bone_eyeLidLfUpInner ctrlVarEyeLipUpInLf "Z" PosZScriptInLfContent

    AssignOneAxisFloatScriptPositionController  bone_eyeLidLfUpOuter ctrlVarEyeLipUpOutLf "X"  PosXScriptOutLfContent
    AssignOneAxisFloatScriptPositionController bone_eyeLidLfUpOuter ctrlVarEyeLipUpOutLf "Z" PosZScriptOutLfContent

    AssignOneAxisFloatScriptPositionController  bone_eyeLidLfDnInner ctrlVarEyeLipUpInLf "X" PosXScriptDnLfInContent
    AssignOneAxisFloatScriptPositionController bone_eyeLidLfDnInner ctrlVarEyeLipUpInLf "Z" PosZScriptDnLfInContent

    AssignOneAxisFloatScriptPositionController  bone_eyeLidLfDnOuter ctrlVarEyeLipUpOutLf "X" PosXScriptDnLfOutContent
    AssignOneAxisFloatScriptPositionController bone_eyeLidLfDnOuter ctrlVarEyeLipUpOutLf "Z" PosZScriptDnLfOutContent
)
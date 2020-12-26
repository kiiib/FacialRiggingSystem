fn FaceEyeBrowPart jt_head mainCtrl = (
       ------- EyeBrowRt Part -------

    -- Get JtLocator -------
    loc_eyeBrowRtInner = FindLocator "Loc_EyeBrowRtJt001"
    loc_eyeBrowRtMid = FindLocator "Loc_EyeBrowRtJt002"
    loc_eyeBrowRtOut = FindLocator "Loc_EyeBrowRtJt003"

    -- Get CtrlLocator -------
    loc_eyeBrowRtUpCtrl = FindLocator "Loc_EyeBrowUpRtCtrl001"

    -- Create Controller
    ctrl_eyeRt = AddCricle loc_eyeBrowRtUpCtrl 0.5 blue

    -- Create Bones
    bone_eyeBrowRtInner = AddBone loc_eyeBrowRtInner [0, 0, 0] [0, 2, 0]
    bone_eyeBrowRtMid  = AddBone loc_eyeBrowRtMid [0, 0, 0] [0, 2, 0]
    bone_eyeBrowRtOut = AddBone loc_eyeBrowRtOut [0, 0, 0] [0, 2, 0]

    -- Align the objects to the locator
    AlignTwoObject ctrl_eyeRt loc_eyeBrowRtUpCtrl
    AlignTwoObject bone_eyeBrowRtInner loc_eyeBrowRtInner
    AlignTwoObject bone_eyeBrowRtMid loc_eyeBrowRtMid
    AlignTwoObject bone_eyeBrowRtOut loc_eyeBrowRtOut

    -- Parent and Constraint Relevance
    ctrl_eyeRt.parent = mainCtrl
    bone_eyeBrowRtInner.parent = jt_head
    bone_eyeBrowRtMid.parent = jt_head
    bone_eyeBrowRtOut.parent = jt_head

    -- Init Controllers and bones
    FreezeTransform ctrl_eyeRt
    FreezeTransform bone_eyeBrowRtInner
    FreezeTransform bone_eyeBrowRtMid
    FreezeTransform bone_eyeBrowRtOut

    -- Script Variables
    ctrlVar = #()
    append ctrlVar ctrl_eyeRt

    -- Assign script
    scriptContent = "[(" + ctrlVar[1].name + ".controller[1][2].value)[3],(" + ctrlVar[1].name + ".controller[1][2].value)[2],(" + ctrlVar[1].name + ".controller[1][2].value)[1]]"

    -- Assign Script to Controller
    AssignPositionScriptController bone_eyeBrowRtInner ctrlVar scriptContent
    AssignPositionScriptController bone_eyeBrowRtMid ctrlVar scriptContent
    AssignPositionScriptController bone_eyeBrowRtOut ctrlVar scriptContent

    ------- End EyeBrowRt Part --------

    -------  EyeBrowLf Part -------
    -- Get JtLocator -------
    loc_eyeBrowLfInner = FindLocator "Loc_EyeBrowLfJt001"
    loc_eyeBrowLfMid= FindLocator "Loc_EyeBrowLfJt002"
    loc_eyeBrowLfOut = FindLocator "Loc_EyeBrowLfJt003"
    -- Get CtrlLocator -------
    loc_eyeBrowLfUpCtrl = FindLocator "Loc_EyeBrowUpLfCtrl001"

    -- Create Controller
    ctrl_eyeLf = AddCricle loc_eyeBrowLfUpCtrl 0.5 blue

    -- Create Bones
    bone_eyeBrowLfInner = AddBone loc_eyeBrowLfInner [0, 0, 0] [0, 2, 0]
    bone_eyeBrowLfMid  = AddBone loc_eyeBrowLfMid [0, 0, 0] [0, 2, 0]
    bone_eyeBrowLfOut = AddBone loc_eyeBrowLfOut [0, 0, 0] [0, 2, 0]

    -- Align the objects to the locator
    AlignTwoObject ctrl_eyeLf loc_eyeBrowLfUpCtrl
    AlignTwoObject bone_eyeBrowLfInner loc_eyeBrowLfInner
    AlignTwoObject bone_eyeBrowLfMid loc_eyeBrowLfMid
    AlignTwoObject bone_eyeBrowLfOut loc_eyeBrowLfOut

    -- Parent and Constraint Relevance
    ctrl_eyeLf.parent = mainCtrl
    bone_eyeBrowLfInner.parent = jt_head
    bone_eyeBrowLfMid.parent = jt_head
    bone_eyeBrowLfOut.parent = jt_head

    -- TwoObjControllerRelation eyeRtCtrl jt_head


    -- Init Controllers and bones
    FreezeTransform ctrl_eyeLf
    FreezeTransform bone_eyeBrowLfInner
    FreezeTransform bone_eyeBrowLfMid
    FreezeTransform bone_eyeBrowLfOut

    -- Script Variables
    ctrlVarEyeBrowLf = #()
    append ctrlVarEyeBrowLf ctrl_eyeLf

    -- Assign script
    scriptContent = "[(" + ctrlVarEyeBrowLf[1].name + ".controller[1][2].value)[3],(" + ctrlVarEyeBrowLf[1].name + ".controller[1][2].value)[2],(" + ctrlVarEyeBrowLf[1].name + ".controller[1][2].value)[1]]"

    -- Assign Script to Controller
    AssignPositionScriptController bone_eyeBrowLfInner ctrlVarEyeBrowLf scriptContent
    AssignPositionScriptController bone_eyeBrowLfMid ctrlVarEyeBrowLf scriptContent
    AssignPositionScriptController bone_eyeBrowLfOut ctrlVarEyeBrowLf scriptContent


    ------- End EyeBrowLf Part --------

    ------- EyeBrowMid Part -------
    ------- End EyeBrowMid Part -------
)


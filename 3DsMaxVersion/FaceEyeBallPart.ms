fn FaceEyeBallPart jt_head mainCtrl = (
    ------- EyeBall Part -------

    -- Get EyeBall Rectangle Controller-------
    loc_eyeBallMidCtrl = FindLocator "Loc_eyeBallMidCtrl"
    
    -- Create Controller-------
    ctrl_eyeBallMidCtrl = AddRectangle loc_eyeBallMidCtrl 5 12 yellow

     -- Align the objects to the locator-------
    AlignTwoObject ctrl_eyeBallMidCtrl loc_eyeBallMidCtrl
   
     -- Parent and Constraint Relevance-------
    ctrl_eyeBallMidCtrl.parent = mainCtrl

     -- Init Controllers and bones-------
    FreezeTransform ctrl_eyeBallMidCtrl
    -- End EyeBall Rectangle Controller-------
    
    
    -- Get EyeBall Controller-------
    loc_eyeBallRtCtrl = FindLocator "Loc_eyeBallRtCtrl"
    loc_eyeBallRtRootJt = FindLocator "Loc_EyeBallRtRootJt"

    loc_eyeBallLfCtrl = FindLocator "Loc_eyeBallLfCtrl"
    loc_eyeBallLfRootJt = FindLocator "Loc_EyeBallLfRootJt"

    -- Create Controller-------
    ctrl_eyeBallRtCtrl = AddCricle loc_eyeBallRtCtrl 0.5 blue
    ctrl_eyeBallLfCtrl = AddCricle loc_eyeBallLfCtrl 0.5 blue

    -- Create Bones-------
    bone_eyeBallRtUP = AddBone loc_eyeBallRtRootJt [0, 2, 0] [0, 0, 1]
    bone_eyeBallRtUP.name = "Jt_EyeBallRtUP"
    bone_eyeBallRtMid = AddBone loc_eyeBallRtRootJt [0, 2, 0] [0, 0, 0]
    bone_eyeBallRtMid.name = "Jt_EyeBallRtMid"
    bone_eyeBallRtDn = AddBone loc_eyeBallRtRootJt [0, 2, 0] [0, 0, -1]
    bone_eyeBallRtDn.name = "Jt_EyeBallRtDn"
    
    bone_eyeBallLfUP = AddBone loc_eyeBallLfRootJt [0, 2, 0] [0, 0, 1]
    bone_eyeBallLfUP.name = "Jt_EyeBallLfUP"
    bone_eyeBallLfMid = AddBone loc_eyeBallLfRootJt [0, 2, 0] [0, 0, 0]
    bone_eyeBallLfMid.name = "Jt_EyeBallLfMid"
    bone_eyeBallLfDn = AddBone loc_eyeBallLfRootJt [0, 2, 0] [0, 0, -1]
    bone_eyeBallLfDn.name = "Jt_EyeBallLfDn"
    
     -- Align the objects to the locator-------
    AlignTwoObject ctrl_eyeBallRtCtrl loc_eyeBallRtCtrl

    AlignTwoObject bone_eyeBallRtUP loc_eyeBallRtRootJt
    AlignTwoObject bone_eyeBallRtMid loc_eyeBallRtRootJt
    AlignTwoObject bone_eyeBallRtDn loc_eyeBallRtRootJt

    AlignTwoObject ctrl_eyeBallLfCtrl loc_eyeBallLfCtrl

    AlignTwoObject bone_eyeBallLfUP loc_eyeBallLfRootJt
    AlignTwoObject bone_eyeBallLfMid loc_eyeBallLfRootJt
    AlignTwoObject bone_eyeBallLfDn loc_eyeBallLfRootJt

     -- Parent and Constraint Relevance-------
    ctrl_eyeBallRtCtrl.parent = ctrl_eyeBallMidCtrl
    ctrl_eyeBallLfCtrl.parent = ctrl_eyeBallMidCtrl

    bone_eyeBallRtUP.parent = jt_head
    bone_eyeBallRtMid.parent = jt_head
    bone_eyeBallRtDn.parent = jt_head

    bone_eyeBallLfUP.parent = jt_head
    bone_eyeBallLfMid.parent = jt_head
    bone_eyeBallLfDn.parent = jt_head
   
     -- Init Controllers and bones-------
    FreezeTransform ctrl_eyeBallRtCtrl
    FreezeTransform bone_eyeBallRtUP
    FreezeTransform bone_eyeBallRtMid
    FreezeTransform bone_eyeBallRtDn
    FreezeTransform ctrl_eyeBallLfCtrl
    FreezeTransform bone_eyeBallLfUP
    FreezeTransform bone_eyeBallLfMid
    FreezeTransform bone_eyeBallLfDn

    -- Script Variables
    ctrlVarEyeballRt = #()
    append ctrlVarEyeballRt ctrl_eyeBallRtCtrl
    append ctrlVarEyeballRt ctrl_eyeBallMidCtrl

    -- Assign script-------
    ScriptContent ="(degToRad((" + ctrlVarEyeballRt[1].name + ".controller[1][2].value)[2] +(" + ctrlVarEyeballRt[2].name + ".controller[1][2].value)[3]))"

    -- Assign Script to Controller
    AssignOneAxisFloatScriptRotationController bone_eyeBallRtUP ctrlVarEyeballRt "Z" ScriptContent
    AssignOneAxisFloatScriptRotationController bone_eyeBallRtMid ctrlVarEyeballRt "Z" ScriptContent
    AssignOneAxisFloatScriptRotationController bone_eyeBallRtDn ctrlVarEyeballRt "Z" ScriptContent

    -- Assign script-------
    ScriptContent ="(degToRad((" + ctrlVarEyeballRt[1].name + ".controller[1][2].value)[1] +(" + ctrlVarEyeballRt[2].name + ".controller[1][2].value)[1]))"

    -- Assign Script to Controller
    AssignOneAxisFloatScriptRotationController bone_eyeBallRtUP ctrlVarEyeballRt "Y" ScriptContent
    AssignOneAxisFloatScriptRotationController bone_eyeBallRtMid ctrlVarEyeballRt "Y" ScriptContent
    AssignOneAxisFloatScriptRotationController bone_eyeBallRtDn ctrlVarEyeballRt "Y" ScriptContent

    -- Script Variables
    ctrlVarEyeballLf = #()
    append ctrlVarEyeballLf ctrl_eyeBallLfCtrl
    append ctrlVarEyeballLf ctrl_eyeBallMidCtrl

    -- Assign script-------
    ScriptContent ="(degToRad((" + ctrlVarEyeballLf[1].name + ".controller[1][2].value)[2] +(" + ctrlVarEyeballLf[2].name + ".controller[1][2].value)[3]))"

    -- Assign Script to Controller
    AssignOneAxisFloatScriptRotationController bone_eyeBallLfUP ctrlVarEyeballLf "Z" ScriptContent
    AssignOneAxisFloatScriptRotationController bone_eyeBallLfMid ctrlVarEyeballLf "Z" ScriptContent
    AssignOneAxisFloatScriptRotationController bone_eyeBallLfDn ctrlVarEyeballLf "Z" ScriptContent

    -- Assign script-------
    ScriptContent ="(degToRad((" + ctrlVarEyeballLf[1].name + ".controller[1][2].value)[1] +(" + ctrlVarEyeballLf[2].name + ".controller[1][2].value)[1]))"

    -- Assign Script to Controller
    AssignOneAxisFloatScriptRotationController bone_eyeBallLfUP ctrlVarEyeballLf "Y" ScriptContent
    AssignOneAxisFloatScriptRotationController bone_eyeBallLfMid ctrlVarEyeballLf "Y" ScriptContent
    AssignOneAxisFloatScriptRotationController bone_eyeBallLfDn ctrlVarEyeballLf "Y" ScriptContent

    -------  Part -------
)
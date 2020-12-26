filein "CommonFunction.ms"
filein "Bone.ms"
filein "CreateCtrlLocator.ms"
filein "CreateJtLocator.ms"
filein "AssignControllerFunction.ms"


fn faceSystem = (
    -- Beginning About Bone Head and MainCtrl --

    jt_head = getNodeByName "Bip001 Head"
    -- print jt_head.transform.pos
    dummy_jt_head = AddDummy "Dummy_BipHead" [3, 3, 3]
    -- AlignTwoObject dummy_jt_head jt_head
    dummy_jt_head.pos = jt_head.transform.pos
    dummy_jt_head.parent = jt_head
    mainCtrl = AddPoint "Ctrl_Main" 1.5 yellow
    mainCtrl.pos = [0, 0, 180]

    TwoObjControllerRelation mainCtrl dummy_jt_head

    ------- EyeBallMid Part -------
    
    -- Get CtrlLocator -------
    loc_eyeBallMidCtrl = FindLocator "Loc_eyeBallMidCtrl"
    
    -- Create Controller-------
    ctrl_eyeBallMidCtrl = AddCricle loc_eyeBallMidCtrl 0.4 blue

    
   

     -- Align the objects to the locator-------
     AlignTwoObject ctrl_eyeBallRtCtrl Loc_eyeBallRtCtrl
   
    
 
     -- Parent and Constraint Relevance-------
     ctrl_eyeBallRtCtrl.parent = mainCtrl
     bone_eyeBallRtUP.parent = jt_head
     bone_eyeBallRtMid.parent = jt_head
   
 
     -- Init Controllers and bones-------
     FreezeTransform ctrl_eyeBallRtCtrl
     FreezeTransform bone_eyeBallRtUP
     FreezeTransform bone_eyeBallRtMid
     FreezeTransform bone_eyeBallRtDn

     -- Script Variables
    ctrlVar = #()
    append ctrlVar ctrl_eyeBallRtYCtrl
    append ctrlVar ctrl_eyeBallRtZCtrl

    -- Assign script-------
    RotateYScriptInLfContent ="(degToRad-(" + ctrl_eyeBallRtCtrl[1].name + ".controller[2].value)[3] * 0.1)"

    -- Assign Script to Controller
    AssignPositionScriptController bone_eyeBrowRtInner ctrlVar scriptContent
    AssignPositionScriptController bone_eyeBrowRtMid ctrlVar scriptContent
    AssignPositionScriptController bone_eyeBrowRtOut ctrlVar scriptContent

    
    -- End Beginning About Bone Head and MainCtrl --


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

    ------- EyeBall Part -------
    --- Get JtLocator -------
    loc_EyeBallRtRootUpJt = FindLocator "Loc_EyeBallRtRootUpJt"

    
    -- Get CtrlLocator -------
    loc_eyeBallRtCtrl = FindLocator "Loc_AimEyeRtJt"
    loc_eyeBallMidCtrl = FindLocator "Loc_AimEyeRtJt"
    -- Create Controller-------
    ctrl_eyeBallRtCtrl = AddCricle Loc_eyeBallRtCtrl 0.4 blue
    
    
    -- Create Bones-------
    bone_eyeBallRtUP = AddBone loc_eyeBallRtCtrl [0, 0, 0] [0, 2, 0] 
    RotateXYZ bone_eyeBallRtUP 0 0 0
    bone_eyeBallRtMid = AddBone loc_eyeBallRtCtrl [0, 0, 0] [0, 2, 0]
    bone_eyeBallRtDn = AddBone loc_eyeBallRtCtrl [0, 0, 0] [0, 2, 0] 
    RotateXYZ bone_eyeBallRtUP 0 0 0

     -- Align the objects to the locator-------
     AlignTwoObject ctrl_eyeBallRtCtrl Loc_eyeBallRtCtrl
     AlignTwoObject bone_eyeBallRtUP loc_eyeBallRtCtrl
     AlignTwoObject bone_eyeBallRtMid loc_eyeBallRtCtrl
     AlignTwoObject bone_eyeBallRtDn loc_eyeBallRtCtrl
    
 
     -- Parent and Constraint Relevance-------
     ctrl_eyeBallRtCtrl.parent = mainCtrl
     bone_eyeBallRtUP.parent = jt_head
     bone_eyeBallRtMid.parent = jt_head
     bone_eyeBallRtDn.parent = jt_head
     
 
     -- Init Controllers and bones-------
     FreezeTransform ctrl_eyeBallRtCtrl
     FreezeTransform bone_eyeBallRtUP
     FreezeTransform bone_eyeBallRtMid
     FreezeTransform bone_eyeBallRtDn

     -- Script Variables
    ctrlVar = #()
    append ctrlVar ctrl_eyeBallRtYCtrl
    append ctrlVar ctrl_eyeBallRtZCtrl

    -- Assign script-------
    RotateYScriptInLfContent ="(degToRad-(" + ctrl_eyeBallRtCtrl[1].name + ".controller[2].value)[3] * 0.1)"

    -- Assign Script to Controller
    AssignPositionScriptController bone_eyeBrowRtInner ctrlVar scriptContent
    AssignPositionScriptController bone_eyeBrowRtMid ctrlVar scriptContent
    AssignPositionScriptController bone_eyeBrowRtOut ctrlVar scriptContent


     
    
     


    





    -------  Part -------
    

    



    
)
-- AssignOneAxisFloatScriptPositionController bone_LeftEye1 ctrlVar "Y" PosYScriptContent

    --  PosScriptContent = "[(" + ctrlVarEyeLipUpRt[1].name + ".controller[1][2].value)[1] + (" + ctrlVarEyeLipUpRt[2].name + ".controller[1][2].value)[1], (" + ctrlVarEyeLipUpRt[1].name + ".controller[1][2].value)[2] + (" + ctrlVarEyeLipUpRt[2].name + ".controller[1][2].value)[2], (" + ctrlVarEyeLipUpRt[1].name + ".controller[1][2].value)[3] + (" + ctrlVarEyeLipUpRt[2].name + ".controller[1][2].value)[3]]"

    -- scriptContent = "[(" + ctrlVar[1].name + ".controller[1][2].value)[1],(" + ctrlVar[1].name + ".controller[1][2].value)[2],(" + ctrlVar[1].name + ".controller[1][2].value)[3]]"

faceSystemCtrlLoc()
FaceSystemLocJtAll()
faceSystem()
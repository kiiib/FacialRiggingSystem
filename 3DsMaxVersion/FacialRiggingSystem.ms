filein "CommonFunction.ms"
filein "Bone.ms"
filein "CreateCtrlLocator.ms"
filein "CreateJtLocator.ms"
filein "AssignControllerFunction.ms"


fn faceSystem = (
    jt_head = getNodeByName "Bip001 Head"

    ------- EyeBrowRt Part -------

    -- Get JtLocator -------
    loc_eyeBrowRtInner = FindLocator "Loc_EyeBrowRtJt001"
    loc_eyeBrowRtMid = FindLocator "Loc_EyeBrowRtJt002"
    loc_eyeBrowRtOut = FindLocator "Loc_EyeBrowRtJt003"
    -- Get CtrlLocator -------
    loc_eyeBrowRtUpCtrl = FindLocator "Loc_EyeBrowUpRtCtrl001"

    -- Create Controller
    eyeRtCtrl = AddCricle loc_eyeBrowRtUpCtrl 0.5 blue

    -- Create Bones
    bone_eyeBrowRtInner = AddBone loc_eyeBrowRtInner [0, 0, 0] [0, 2, 0]
    bone_eyeBrowRtMid  = AddBone loc_eyeBrowRtMid [0, 0, 0] [0, 2, 0]
    bone_eyeBrowRtOut = AddBone loc_eyeBrowRtOut [0, 0, 0] [0, 2, 0]

    -- Align the objects to the locator
    AlignTwoObject eyeRtCtrl loc_eyeBrowRtUpCtrl
    AlignTwoObject bone_eyeBrowRtInner loc_eyeBrowRtInner
    AlignTwoObject bone_eyeBrowRtMid loc_eyeBrowRtMid
    AlignTwoObject bone_eyeBrowRtOut loc_eyeBrowRtOut

    -- Parent and Constraint Relevance
    bone_eyeBrowRtInner.parent = jt_head
    bone_eyeBrowRtMid.parent = jt_head
    bone_eyeBrowRtOut.parent = jt_head

    -- TwoObjControllerRelation eyeRtCtrl jt_head


    -- Init Controllers and bones
    FreezeTransform eyeRtCtrl
    FreezeTransform bone_eyeBrowRtInner
    FreezeTransform bone_eyeBrowRtMid
    FreezeTransform bone_eyeBrowRtOut
    

    -- Script Variables
    ctrlVar = #()
    append ctrlVar eyeRtCtrl
    --append ctrlVar ctrl_LeftEye2

    -- Assign script
    -- RotZScriptContent = "degTorad((" + ctrlVar[1].name + ".controller[1][2].value)[3] + (" + ctrlVar[2].name + ".controller[1][2].value)[2])"

    -- AssignOneAxisFloatScriptRotationController bone_eyeBrowRtInner ctrlVar "Z" RotZScriptContent
    -- AssignOneAxisFloatScriptPositionController bone_LeftEye1 ctrlVar "Y" PosYScriptContent

    -- PosScriptContent = "[(" + ctrlVar[1].name + ".controller[1][2].value)[1] + (" + ctrlVar[2].name + ".controller[1][2].value)[1], (" + ctrlVar[1].name + ".controller[1][2].value)[2] + (" + ctrlVar[2].name + ".controller[1][2].value)[2], (" + ctrlVar[1].name + ".controller[1][2].value)[3] + (" + ctrlVar[2].name + ".controller[1][2].value)[3]]"

    scriptContent = "[(" + ctrlVar[1].name + ".controller[1][2].value)[1],(" + ctrlVar[1].name + ".controller[1][2].value)[2],(" + ctrlVar[1].name + ".controller[1][2].value)[3]]"
    -- print scriptContent
    AssignPositionScriptController bone_eyeBrowRtInner ctrlVar scriptContent


    ------- End Eye Part --------




    ------- Eyebrow Part -------

    ------- End Eyebrow Part --------
)

faceSystemCtrlLoc()
FaceSystemLocJtAll()
faceSystem()
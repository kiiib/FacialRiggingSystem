filein "CommonFunction.ms"
filein "Bone.ms"
filein "CreateCtrlLocator.ms"
filein "CreateJtLocator.ms"
filein "AssignControllerFunction.ms"

filein "FaceEyeBrowPart.ms"
filein "FaceEyeLipPart.ms"
filein "FaceEyeBallPart.ms"
filein "FaceMouthPart.ms"

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

    -- FaceEyeBallPart jt_head mainCtrl
    -- FaceEyeLipPart jt_head mainCtrl
    -- FaceEyeBrowPart jt_head mainCtrl
    -- FaceMouthPart jt_head mainCtrl
    


)
-- AssignOneAxisFloatScriptPositionController bone_LeftEye1 ctrlVar "Y" PosYScriptContent

    --  PosScriptContent = "[(" + ctrlVarEyeLipUpRt[1].name + ".controller[1][2].value)[1] + (" + ctrlVarEyeLipUpRt[2].name + ".controller[1][2].value)[1], (" + ctrlVarEyeLipUpRt[1].name + ".controller[1][2].value)[2] + (" + ctrlVarEyeLipUpRt[2].name + ".controller[1][2].value)[2], (" + ctrlVarEyeLipUpRt[1].name + ".controller[1][2].value)[3] + (" + ctrlVarEyeLipUpRt[2].name + ".controller[1][2].value)[3]]"

    -- scriptContent = "[(" + ctrlVar[1].name + ".controller[1][2].value)[1],(" + ctrlVar[1].name + ".controller[1][2].value)[2],(" + ctrlVar[1].name + ".controller[1][2].value)[3]]"

-- faceSystemCtrlLoc()
-- FaceSystemLocJtAll()
faceSystem()
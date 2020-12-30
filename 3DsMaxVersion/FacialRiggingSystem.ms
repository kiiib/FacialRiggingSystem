filein "FaceEyeBrowPart.ms"
filein "FaceEyeLipPart.ms"
filein "FaceEyeBallPart.ms"
filein "FaceMouthPart.ms"
filein "FaceCheekPart.ms"
filein "FaceJawPart.ms"
fn FaceSystem = (
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

    FaceEyeBallPart jt_head mainCtrl
    FaceEyeLipPart jt_head mainCtrl
    FaceEyeBrowPart jt_head mainCtrl
    FaceMouthPart jt_head mainCtrl
    FaceCheekPart jt_head mainCtrl
    FaceJawPart jt_head mainCtrl

)

-- FaceSystem()
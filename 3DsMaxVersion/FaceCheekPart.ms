fn FaceCheekPart jt_head mainCtrl = (
    ------- FceCheek Part -------
    -- Get JtLocator -------
    loc_CheekRtJt = FindLocator "Loc_CheekRtJt"
    loc_CheekLfJt = FindLocator "Loc_CheekLfJt"

    loc_NosetrilRtJt = FindLocator "Loc_NosetrilRtJt"
    loc_NosetrilLfJt = FindLocator "Loc_NosetrilLfJt"

    loc_CheekRaiserRtJtIn = FindLocator "Loc_CheekRaiserRtJt001"
    loc_CheekRaiserRtJtOut = FindLocator "Loc_CheekRaiserRtJt002"

    loc_CheekRaiserLfJtIn = FindLocator "Loc_CheekRaiserLfJt001"
    loc_CheekRaiserLfJtOut = FindLocator "Loc_CheekRaiserLfJt002"

    -- Get CtrlLocator -------
    loc_SmLipRtCtrl = FindLocator "Loc_SmLipRtCtrl"
    loc_SmLipLfCtrl = FindLocator "Loc_SmLipLfCtrl"
    loc_NosetrilRtCtrl = FindLocator "Loc_NosetrilRtCtrl"
    loc_NosetrilLfCtrl = FindLocator "Loc_NosetrilLfCtrl"

    -- Create Controller
    -- ctrl_SmLipRtCtrl = AddCricle loc_SmLipRtCtrl 0.5 blue
    -- ctrl_SmLipLfCtrl =  AddCricle loc_SmLipLfCtrl 0.5 blue
    ctrl_SmLipRtCtrl = getNodeByName("Ctrl_SmLipRt")
    ctrl_SmLipLfCtrl = getNodeByName("Ctrl_SmLipLf")
    ctrl_NosetrilRtCtrl =  AddCricle loc_NosetrilRtCtrl 0.5 blue
    ctrl_NosetrilLfCtrl =  AddCricle loc_NosetrilLfCtrl 0.5 blue


    -- Create Bones
    bone_CheekRtJt = AddBone loc_CheekRtJt [0, 0, 0] [0, 2, 0]
    bone_CheekLfJt = AddBone loc_CheekLfJt [0, 0, 0] [0, 2, 0]

    bone_NosetrilRtJt = AddBone loc_NosetrilRtJt [0, 0, 0] [0, 2, 0]
    bone_NosetrilLfJt = AddBone loc_NosetrilLfJt [0, 0, 0] [0, 2, 0]

    bone_CheekRaiserRtJtIn = AddBone loc_CheekRaiserRtJtIn [0, 0, 0] [0, 2, 0]
    bone_CheekRaiserRtJtOut = AddBone loc_CheekRaiserRtJtOut [0, 0, 0] [0, 2, 0]

    bone_CheekRaiserLfJtIn =  AddBone loc_CheekRaiserLfJtIn [0, 0, 0] [0, 2, 0]
    bone_CheekRaiserLfJtOut = AddBone loc_CheekRaiserLfJtOut [0, 0, 0] [0, 2, 0]

    -- Align the objects to the locator
    AlignTwoObject ctrl_SmLipRtCtrl loc_SmLipRtCtrl
    AlignTwoObject ctrl_SmLipLfCtrl loc_SmLipLfCtrl
    AlignTwoObject ctrl_NosetrilRtCtrl loc_NosetrilRtCtrl
    AlignTwoObject ctrl_NosetrilLfCtrl loc_NosetrilLfCtrl

    AlignTwoObject bone_CheekRtJt loc_CheekRtJt
    AlignTwoObject bone_CheekLfJt loc_CheekLfJt
    AlignTwoObject bone_NosetrilRtJt loc_NosetrilRtJt
    AlignTwoObject bone_NosetrilLfJt loc_NosetrilLfJt

    AlignTwoObject bone_CheekRaiserRtJtIn loc_CheekRaiserRtJtIn
    AlignTwoObject bone_CheekRaiserRtJtOut loc_CheekRaiserRtJtOut
    AlignTwoObject bone_CheekRaiserLfJtIn loc_CheekRaiserLfJtIn
    AlignTwoObject bone_CheekRaiserLfJtOut loc_CheekRaiserLfJtOut

    -- Parent and Constraint Relevance
    ctrl_SmLipRtCtrl.parent = mainCtrl
    ctrl_SmLipLfCtrl.parent = mainCtrl
    ctrl_NosetrilRtCtrl.parent = mainCtrl
    ctrl_NosetrilLfCtrl.parent = mainCtrl

    bone_CheekRtJt.parent = jt_head
    bone_CheekLfJt.parent = jt_head
    bone_NosetrilRtJt.parent = jt_head
    bone_NosetrilLfJt.parent = jt_head
    bone_CheekRaiserRtJtIn.parent = jt_head
    bone_CheekRaiserRtJtOut.parent = jt_head
    bone_CheekRaiserLfJtIn.parent = jt_head
    bone_CheekRaiserLfJtOut.parent = jt_head

    -- Init Controllers and bones
    FreezeTransform ctrl_SmLipRtCtrl
    FreezeTransform ctrl_SmLipLfCtrl
    FreezeTransform ctrl_NosetrilRtCtrl
    FreezeTransform ctrl_NosetrilLfCtrl

    FreezeTransform bone_CheekRtJt
    FreezeTransform bone_CheekLfJt
    FreezeTransform bone_NosetrilRtJt
    FreezeTransform bone_NosetrilLfJt

    FreezeTransform bone_CheekRaiserRtJtIn
    FreezeTransform bone_CheekRaiserRtJtOut
    FreezeTransform bone_CheekRaiserLfJtIn
    FreezeTransform bone_CheekRaiserLfJtOut

    -- Script Variables
    ctrlVarCheek = #()
    append ctrlVarCheek ctrl_SmLipRtCtrl
    append ctrlVarCheek ctrl_NosetrilRtCtrl
    append ctrlVarCheek ctrl_SmLipLfCtrl
    append ctrlVarCheek ctrl_NosetrilLfCtrl

    -- Cheek --
    -- Assign script
    PosScriptContent = "[(" + ctrlVarCheek[1].name + ".controller[1][2].value)[3] * 0.3 + (" + ctrlVarCheek[2].name + ".controller[1][2].value)[3] * 0.3, -(" + ctrlVarCheek[1].name + ".controller[1][2].value)[2] * 0.3 - (" + ctrlVarCheek[2].name + ".controller[1][2].value)[2] * 0.3, (" + ctrlVarCheek[1].name + ".controller[1][2].value)[1] * 0.3 + (" + ctrlVarCheek[2].name + ".controller[1][2].value)[1] * 0.3]"
    -- Assign Script to Controller
    AssignPositionScriptController bone_CheekRtJt ctrlVarCheek PosScriptContent

    -- Assign script
    PosScriptContent = "[(" + ctrlVarCheek[3].name + ".controller[1][2].value)[3] * 0.3 + (" + ctrlVarCheek[4].name + ".controller[1][2].value)[3] * 0.3, -(" + ctrlVarCheek[3].name + ".controller[1][2].value)[2] * 0.3 - (" + ctrlVarCheek[4].name + ".controller[1][2].value)[2] * 0.3, (" + ctrlVarCheek[3].name + ".controller[1][2].value)[1] * 0.3 + (" + ctrlVarCheek[4].name + ".controller[1][2].value)[1] * 0.3]"
    -- Assign Script to Controller
    AssignPositionScriptController bone_CheekLfJt ctrlVarCheek PosScriptContent
    -- End Cheek --

    -- Nose --
    -- Assign script
    PosScriptContent = "[(" + ctrlVarCheek[1].name + ".controller[1][2].value)[3] * 0.3 + (" + ctrlVarCheek[2].name + ".controller[1][2].value)[3] * 0.3, -(" + ctrlVarCheek[1].name + ".controller[1][2].value)[2] * 0.3 - (" + ctrlVarCheek[2].name + ".controller[1][2].value)[2] * 0.3, (" + ctrlVarCheek[1].name + ".controller[1][2].value)[1] * 0.3 + (" + ctrlVarCheek[2].name + ".controller[1][2].value)[1] * 0.3]"
    -- Assign Script to Controller
    AssignPositionScriptController bone_NosetrilRtJt ctrlVarCheek PosScriptContent

    PosScriptContent = "[(" + ctrlVarCheek[3].name + ".controller[1][2].value)[3] * 0.3 + (" + ctrlVarCheek[4].name + ".controller[1][2].value)[3] * 0.3, -(" + ctrlVarCheek[3].name + ".controller[1][2].value)[2] * 0.3 - (" + ctrlVarCheek[4].name + ".controller[1][2].value)[2] * 0.3, (" + ctrlVarCheek[3].name + ".controller[1][2].value)[1] * 0.3 + (" + ctrlVarCheek[4].name + ".controller[1][2].value)[1] * 0.3]"
    -- Assign Script to Controller
    AssignPositionScriptController bone_NosetrilLfJt ctrlVarCheek PosScriptContent
    -- End Nose --

    -- Eyelid -- 
    -- Assign script
    PosScriptContent = "[(" + ctrlVarCheek[2].name + ".controller[1][2].value)[3] * 0.3, -(" + ctrlVarCheek[2].name + ".controller[1][2].value)[2] * 0.3, (" + ctrlVarCheek[2].name + ".controller[1][2].value)[1] * 0.3]"
    -- Assign Script to Controller
    AssignPositionScriptController bone_CheekRaiserRtJtIn ctrlVarCheek PosScriptContent

    -- Assign script
    PosScriptContent = "[(" + ctrlVarCheek[2].name + ".controller[1][2].value)[3] * 0.3, -(" + ctrlVarCheek[2].name + ".controller[1][2].value)[2] * 0.3, (" + ctrlVarCheek[2].name + ".controller[1][2].value)[1] * 0.3]"
    -- Assign Script to Controller
    AssignPositionScriptController bone_CheekRaiserRtJtOut ctrlVarCheek PosScriptContent

    -- Assign script
    PosScriptContent = "[(" + ctrlVarCheek[4].name + ".controller[1][2].value)[3] * 0.3, -(" + ctrlVarCheek[4].name + ".controller[1][2].value)[2] * 0.3, (" + ctrlVarCheek[4].name + ".controller[1][2].value)[1] * 0.3]"
    -- Assign Script to Controller
    AssignPositionScriptController bone_CheekRaiserLfJtIn ctrlVarCheek PosScriptContent

    -- Assign script
    PosScriptContent = "[(" + ctrlVarCheek[4].name + ".controller[1][2].value)[3] * 0.3, -(" + ctrlVarCheek[4].name + ".controller[1][2].value)[2] * 0.3, (" + ctrlVarCheek[4].name + ".controller[1][2].value)[1] * 0.3]"
    -- Assign Script to Controller
    AssignPositionScriptController bone_CheekRaiserLfJtOut ctrlVarCheek PosScriptContent






    ------- End FaceCheek Part --------


)


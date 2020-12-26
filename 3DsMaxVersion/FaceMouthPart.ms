fn FaceMouthPart jt_head mainCtrl = (
    ------- MouthLip Part -------

    -- Get Jt Locator -------
    loc_MouthLipUpJtIN = FindLocator "Loc_LipRtUpJt001"
    loc_MouthLipUpJtMid = FindLocator "Loc_LipMidUpJt"
    loc_MouthLipUpJtOut = FindLocator "Loc_LipLfUpJt002"

    -- Get Ctrl Locator -------
    loc_LipRegionUpCtrl = FindLocator "Loc_LipRegionCtrl001"
    loc_LipRegionDnCtrl = FindLocator "Loc_LipRegionCtrl002"
    loc_SmLipRtCtrl = FindLocator "Loc_SmLipRtCtrl"
    loc_SmLipLfCtrl = FindLocator "Loc_SmLipLfCtrl"
    
    -- Create Controller
    ctrl_LipRegionUp = AddCricle loc_LipRegionUpCtrl 0.5 blue
    ctrl_LipRegionDn = AddCricle loc_LipRegionDnCtrl 0.5 blue
    ctrl_SmLipRt = AddCricle loc_SmLipRtCtrl 0.5 blue
    ctrl_SmLipLf = AddCricle loc_SmLipLfCtrl 0.5 blue

    -- Create Bones
    bone_MouthLipUpJtIN = AddBone loc_MouthLipUpJtIN [0, 0, 0] [0, 2, 0]
    bone_MouthLipUpJtMid  = AddBone loc_MouthLipUpJtIN [0, 0, 0] [0, 2, 0]
    bone_MouthLipUpJtOut = AddBone loc_MouthLipUpJtOut [0, 0, 0] [0, 2, 0]

    -- Align the objects to the locator
    AlignTwoObject ctrl_LipRegionUp loc_LipRegionUpCtrl
    AlignTwoObject ctrl_LipRegionDn loc_LipRegionDnCtrl
    AlignTwoObject ctrl_SmLipRt loc_SmLipRtCtrl
    AlignTwoObject ctrl_SmLipLf loc_SmLipLfCtrl

    AlignTwoObject bone_MouthLipUpJtIN loc_MouthLipUpJtIN
    AlignTwoObject bone_MouthLipUpJtMid loc_MouthLipUpJtMid
    AlignTwoObject bone_MouthLipUpJtOut loc_MouthLipUpJtOut

    -- Parent and Constraint Relevance
    ctrl_LipRegionUp.parent = mainCtrl
    ctrl_LipRegionDn.parent = mainCtrl
    ctrl_SmLipRt.parent = mainCtrl
    ctrl_SmLipLf.parent = mainCtrl

    bone_MouthLipUpJtIN.parent = jt_head
    bone_MouthLipUpJtMid.parent = jt_head
    bone_MouthLipUpJtOut.parent = jt_head

    -- Init Controllers and bones
    FreezeTransform ctrl_LipRegionUp
    FreezeTransform ctrl_LipRegionDn
    FreezeTransform ctrl_SmLipRt
    FreezeTransform ctrl_SmLipLf

    FreezeTransform bone_MouthLipUpJtIN
    FreezeTransform bone_MouthLipUpJtMid
    FreezeTransform bone_MouthLipUpJtOut

    -- Script Variables
    ctrlVarMouthLip = #()
    append ctrlVarMouthLip ctrl_LipRegionUp
    append ctrlVarMouthLip ctrl_LipRegionDn
    append ctrlVarMouthLip ctrl_SmLipRt
    append ctrlVarMouthLip ctrl_SmLipLf

    -- Assign script
    -- 右嘴角左右
    scriptContent = "(" + ctrlVarMouthLip[3].name + ".controller[1][2].value)[1] * 0.4"
    -- Assign Script to Controller
    AssignOneAxisFloatScriptPositionController bone_MouthLipUpJtIN ctrlVarMouthLip "Z" scriptContent

    -- Assign script
    -- 右嘴角前后
    scriptContent = "(" + ctrlVarMouthLip[2].name + ".controller[1][2].value)[3] * 0.08"
    -- Assign Script to Controller
    AssignOneAxisFloatScriptPositionController bone_MouthLipUpJtIN ctrlVarMouthLip "Y" scriptContent

    -- Assign script
    -- 右嘴角上下
    scriptContent = "if((" + ctrlVarMouthLip[1].name + ".controller[1][2].value)[2] > 0) then (("+ ctrlVarMouthLip[2].name + ".controller[1][2].value)[3] * 0.1 + (" + ctrlVarMouthLip[1].name + ".controller[1][2].value)[2] * 0.2) else (0)"
    -- Assign Script to Controller
    AssignOneAxisFloatScriptPositionController bone_MouthLipUpJtIN ctrlVarMouthLip "X" scriptContent

    -- AssignPositionScriptController bone_MouthLipUpJtMid ctrlVarMouthLip scriptContent
    -- AssignPositionScriptController bone_MouthLipUpJtOut ctrlVarMouthLip scriptContent

    ------- End MouthLip Part --------



)


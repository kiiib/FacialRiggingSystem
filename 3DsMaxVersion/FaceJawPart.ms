fn FaceJawPart jt_head mainCtrl = (
    ------- Jaw Part -------

    -- Get Jt Locator -------
    loc_JawRootJt = FindLocator "Loc_JawRootJt"

    -- Get Ctrl Locator -------
    loc_LipRegionDnCtrl = FindLocator "Loc_LipRegionCtrl002"

    -- Create Controller
    -- ctrl_LipRegionDn = AddCricle loc_LipRegionDnCtrl 0.5 blue
    ctrl_LipRegionDn = getNodeByName("Ctrl_LipRegion002")

    -- Create Bones
    bone_JawRoot = AddBone loc_JawRootJt [0, 5.5, 0] [0, 0, -6.5] BoneEnd:true

    -- Align the objects to the locator
    -- AlignTwoObject ctrl_LipRegionDn loc_LipRegionDnCtrl
    AlignTwoObject bone_JawRoot loc_JawRootJt

    -- Parent and Constraint Relevance
    -- ctrl_LipRegionDn.parent = mainCtrl
    bone_JawRoot.parent = jt_head

    -- Init Controllers and bones
    -- FreezeTransform ctrl_LipRegionDn
    FreezeTransform bone_JawRoot

    -- Script Variables
    ctrlVarJaw = #()
    append ctrlVarJaw ctrl_LipRegionDn

    scriptContent = "(" + ctrlVarJaw[1].name + ".controller[1][2].value)[3] * 0.08"
    -- Assign Script to Controller
    AssignOneAxisFloatScriptRotationController bone_JawRoot ctrlVarJaw "Y" scriptContent

    ------- End Jaw Part -------
)
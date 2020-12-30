rollout allControls "C1 Facial Rigging System v1.0"(
    -- GroupBox BrbFacialRiggingSystem "C1 Facial Rigging System" pos:[8, 5] width:235 height:330
    -- button BtnImportBoneLocators "Import Bone Locators" pos:[25,30] width:200
    -- button BtnImportControllerLocators "Import Controller Locators" pos:[25, 170] width:200
    -- button BtnHideAllLocator "Hide All Locators"  pos:[25, 65] width:200
    -- button BtnUnhideAllLocator "Unhide All Locators"  pos:[25, 100] width:200
    -- button BtnSelectAllLocator "Select All Locators"  pos:[25, 135] width:200
    
    -- -- button BtnImportJoints "Import Joints" pos:[25, 205] width:200
    -- button BtnRelateControllerAndJoints "Create Ctrl And Joints" pos:[25, 240] width:200
    -- button BtnCreateBipBone "Create CS Bone" pos:[25, 275] width:200
    -- button BtnClearScene "Clear Scene" pos:[25, 310] width:200

    group "C1 Facial Rigging System" (
        button BtnImportBoneLocators "Import Bone Locators" width:200
        label LabelEmpty1 ""
        button BtnImportControllerLocators "Import Controller Locators" width:200
        label LabelEmpty2 ""
        button BtnHideAllLocator "Hide All Locators" width:200
        label LabelEmpty3 ""
        button BtnUnhideAllLocator "Unhide All Locators" width:200
        label LabelEmpty4 ""
        button BtnSelectAllLocator "Select All Locators" width:200
        label LabelEmpty5 ""
        
        button BtnRelateControllerAndJoints "Create Ctrl And Joints" width:200
        label LabelEmpty6 ""
        button BtnCreateBipBone "Create CS Bone" width:200
        label LabelEmpty7 ""
        button BtnClearScene "Clear Scene" width:200
        label LabelEmpty8 ""
        
        -- label LabelEmpty9 ""
        -- label LabelEmpty10 ""
        -- label LabelQuestion "让我们荡起双桨"
        label LabelAuthor "popo:liujianbin@corp.netease.com"
    )
    

    on BtnImportBoneLocators pressed do (
        FaceSystemLocJtAll()
    )

    on BtnImportControllerLocators pressed do (
        faceSystemCtrlLoc()
    )

    on BtnHideAllLocator pressed do (
        select $Loc*
        for i in selection do(
            hide i
        )
    )

    on BtnUnhideAllLocator pressed do (
        select $Loc*
        selection.isHidden = off
    )

    on BtnSelectAllLocator pressed do (
        select $Loc*
    )


    on BtnImportJoints pressed do (
        
    )

    on BtnRelateControllerAndJoints pressed do (
        FaceSystem()
    )

    on BtnClearScene pressed do (
        delete $*
    )

    on BtnCreateBipBone pressed do (
        s = pathConfig.removePathLeaf (getSourceFileName())
        s = s + "/CSBone.max"

        mergeMaxFile s
        -- mergeMaxFile "G:/Projects/FacialRiggingSystem/3DsMaxVersion/CSBone.max" 
    )
)
fn MainGUI = (
    CreateDialog allControls 250 400
)

-- MainGUI()
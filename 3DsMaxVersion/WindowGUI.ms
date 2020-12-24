rollout allControls "C1 Facial Rigging System v1.0"(
    GroupBox BrbFacialRiggingSystem "C1 Facial Rigging System" pos:[8, 5] width:235 height:280
    button BtnImportLocators "Import Locators"pos:[25,30] width:200
    button BtnHideLocator "Hide Locators"  pos:[25, 65] width:200
    button BtnImportControllers "Import Controllers" pos:[25, 100] width:200
    button BtnImportJoints "Import Joints" pos:[25, 135] width:200
    button BtnRelateControllerAndJoints "Relate Ctrl And Joints" pos:[25, 170] width:200

    label LabelEmpty ""
    label LabelEmpty2 ""
    label LabelQuestion "让我们荡起双桨"
    label LabelAuthor "popo:hello world@corp.netease.com"

    on BtnImportLocators pressed do (

    )

    on BtnHideLocator pressed do (
        
    )

    on BtnImportControllers pressed do (
        
    )

    on BtnImportJoints pressed do (
        
    )

    on BtnRelateControllerAndJoints pressed do (
        
    )
)
fn MainGUI = (
    CreateDialog allControls 250 300
)

-- MainGUI()
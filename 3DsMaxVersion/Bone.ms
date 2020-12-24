fn AddBone startPos endPos Locator width:0.2 height:0.2 BoneEnd:false= (

    -- About creating bone end refercence: https://forums.cgsociety.org/t/maxscript-need-help-creating-bones-on-selection/1587708/3
    bx1 = Dummy pos:startPos
    bx2 = Dummy pos:endPos

    dir = normalize(bx2.pos - bx1.pos)

    bn1 = boneSys.createBone bx1.pos bx2.pos (cross dir bx1.dir)
    BoneName = GetBoneName Locator.name
    bn1.name = BoneName

    if(BoneEnd == true) then (
        -- make end bone
        bn2 = boneSys.createBone bx2.pos (bx2.pos + 0.0001*dir) bn1.dir

        bn2.parent = bn1
        bn2.length = bn1.width

        bn2.name = BoneName + "_end"
    )
    
    -- RotatePivot bn1 90 0 -90
    -- RotatePivot bn2 90 0 -90
    delete bx1
    delete bx2

    return bn1
)

-- bone_LeftEye1 = AddBone [0, 0, 0] [0, 0, 5] "Bone1" BoneEnd:false
-- bone_LeftEye2 = AddBone [0, 0, 5] [0, 0, 12] "Bone2" BoneEnd:false
-- bone_LeftEye3 = AddBone [0, 0, 12] [0, 0, 18] "Bone3" 
-- bone_LeftEye3.parent = bone_LeftEye2
-- bone_LeftEye2.parent = bone_LeftEye1
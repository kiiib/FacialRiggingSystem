-- include "CommonFunction.ms"
-- include "Controller.ms"
fn AddBone startPos endPos width:0.2 height:0.2 = (
    bx1 = Dummy pos:startPos
    bx2 = Dummy pos:endPos

    dir = normalize(bx2.pos - bx1.pos)

    bn1 = boneSys.createBone bx1.pos bx2.pos (cross dir bx1.dir)
    -- make end bone
    bn2 = boneSys.createBone bx2.pos (bx2.pos + 0.0001*dir) bn1.dir
    bn2.parent = bn1
    bn2.length = bn1.width

    -- b = boneSys.createBone startPos endPos [0, 0, 1]
    -- b.width = width
    -- b.height = height
    -- RotatePivot bn1 90 0 -90
    -- RotatePivot bn2 90 0 -90
    -- bs = boneSys.createBone startPos endPos [0, 0, 1]
    -- return b;
    return bn1;
)

fn BoneControllerRelation bone controller = (
    --parent relation
    -- bone.parent = controller

    --- Constraint relation ---
    -- Position Constraint
    posCtrl = Position_Constraint()
    posCtrl.relative = false    --Not Keep Initial Offset
    posCtrl.appendTarget controller 100 --weight:100
    bone.position.controller = posCtrl

    -- Orientation Constraint
    oriCtrl = Orientation_Constraint()
    oriCtrl.relative = false    --Not Keep Initial Offset
    oriCtrl.appendTarget controller 100
    bone.rotation.controller = oriCtrl

)
-- cir = AddCricle "Circleabc" 1 [0, 0, 150]
-- cir.rotation.x_rotation=90
-- aBone = AddBone [0, 0, 0] [0, 0, 5]
-- BoneControllerRelation aBone cir

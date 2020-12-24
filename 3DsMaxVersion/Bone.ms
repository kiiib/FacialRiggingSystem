fn AddBone startPos endPos BoneName width:0.2 height:0.2 = (
    bx1 = Dummy pos:startPos
    bx2 = Dummy pos:endPos

    dir = normalize(bx2.pos - bx1.pos)

    bn1 = boneSys.createBone bx1.pos bx2.pos (cross dir bx1.dir)
    -- make end bone
    bn2 = boneSys.createBone bx2.pos (bx2.pos + 0.0001*dir) bn1.dir
    -- RotatePivot bn1 90 0 -90
    -- RotatePivot bn2 90 0 -90
    bn2.parent = bn1
    bn2.length = bn1.width

    -- b = boneSys.createBone startPos endPos [0, 0, 1]
    -- b.width = width
    -- b.height = height
    
    -- bs = boneSys.createBone startPos endPos [0, 0, 1]
    -- return b;
    delete bx1
    delete bx2
    bn1.name = BoneName
    bn2.name = BoneName + "_end"

    return bn1
)

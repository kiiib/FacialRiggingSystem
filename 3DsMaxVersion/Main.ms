filein "CommonFunction.ms"
filein "Controller.ms"
filein "Bone.ms"

fn Main = (
    ctrl1 = CreateController()
    bone1 = AddBone [0, 0, 0] [0, 0, 5]
    BoneControllerRelation bone1 ctrl1

    --AlignTwoObject ctrl1 selection[1]
)

Main()
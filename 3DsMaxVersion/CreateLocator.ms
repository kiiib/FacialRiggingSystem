filein "Controller.ms"
filein "Locator.ms"


delete $*

Loc_LeftEyeCtrl = AddPoint "Loc_LeftEyeCtrl" 3 green
Loc_LeftEyeCtrl.pos = [0, 40, 20] 


Loc_LeftEyeBone1 = AddPoint "Loc_LeftEyeBone1" 3 green
Loc_LeftEyeBone1.pos = [-40, 40, 20] 
-- Loc_LeftEyeBone1.rotation.y_rotation = 30

Loc_LeftEyeBone2 = AddPoint "Loc_LeftEyeBone2" 3 green
Loc_LeftEyeBone2.pos = [-80, 40, 20] 
-- Loc_LeftEyeBone2.rotation.z_rotation = 30

Loc_LeftEyeBone3 = AddPoint "Loc_LeftEyeBone3" 3 green
Loc_LeftEyeBone3.pos = [-120, 40, 20]
-- Loc_LeftEyeBone3.rotation.x_rotation = 30

hide Loc_LeftEyeCtrl
hide Loc_LeftEyeBone1
hide Loc_LeftEyeBone2
hide Loc_LeftEyeBone3
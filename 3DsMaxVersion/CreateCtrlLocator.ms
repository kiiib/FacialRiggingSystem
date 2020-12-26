filein "CommonFunction.ms"
--CreateEyeBrowRtUpCtrl--
fn CreateEyeBrowRtUpCtrl = (
    loc_eyeBrowRtUpCtrl = AddPoint "Loc_EyeBrowUpRtCtrl001" 0.6 blue 
    loc_eyeBrowRtUpCtrl.pos = [-0.961, -7.924, 170.514] 
)

--CreateEyeBrowLfUpCtrl--
fn CreateEyeBrowLfUpCtrl = (
    loc_eyeBrowLfUpCtrl = AddPoint "Loc_EyeBrowUpLfCtrl001" 0.6 blue 
    loc_eyeBrowLfUpCtrl.pos = [0.961, -7.924, 170.514] 
)

--CreateEyeLidRtCtrl--
fn CreateEyeLidRtCtrl = (
    loc_eyeLidRtInCtrl = AddPoint "Loc_EyeLidUpRtInCtrl001" 0.6 blue 
    loc_eyeLidRtInCtrl.pos = [-1.374, -5.777, 167.609] 
    loc_eyeLidRtOutCtrl = AddPoint "Loc_EyeLidUpRtOutCtrl001" 0.6 blue
    loc_eyeLidRtOutCtrl.pos = [-4.475, -4.922, 167.892] 
)

--CreateEyeLidLfCtrl--
fn CreateEyeLidLfCtrl = (
    loc_eyeLidLfInCtrl = AddPoint "Loc_EyeLidUpLfInCtrl001" 0.6 blue
    loc_eyeLidLfInCtrl.pos = [1.374, -5.777, 167.609] 
    loc_eyeLidLfOutCtrl = AddPoint "Loc_EyeLidUpLfOutCtrl001" 0.6 blue
    loc_eyeLidLfOutCtrl.pos = [4.475, -4.922, 167.892] 
)

--CreateEyeBallMidCtrl--
fn CreateEyeBallMidCtrl = (
    loc_eyeBallMidCtrl = AddPoint "Loc_eyeBallMidCtrl" 0.6 blue
    loc_eyeBallMidCtrl.pos = [-0.003,-11.115,168.022]
)
--CreateEyeBallRtCtrl--
fn CreateEyeBallRtCtrl = (
    loc_eyeBallRtCtrl = AddPoint "Loc_eyeBallRtCtrl" 0.6 blue
    loc_eyeBallRtCtrl.pos = [-2.884, -11.115, 168.016]
)
--CreateEyeBallLfCtrl--
fn CreateEyeBallLfCtrl = (
    loc_eyeBallLfCtrl = AddPoint "Loc_eyeBallLfCtrl" 0.6 blue
    loc_eyeBallLfCtrl.pos = [2.884, -11.115, 168.016]
)



--CreateNosetrilRtCtrl--
fn CreateNosetrilRtCtrl = (
    loc_NosetrilRtCtrl = AddPoint "Loc_NosetrilRtCtrl" 0.6 blue
    loc_NosetrilRtCtrl.pos = [-1.222, -6.169, 166.28] 
)

--CreateNosetrilLfCtrl--
fn CreateNosetrilLfCtrl = (
    loc_NosetrilLfCtrl = AddPoint "Loc_NosetrilLfCtrl" 0.6 blue
    loc_NosetrilLfCtrl.pos = [1.222, -6.169, 166.28] 
)

--CreateSmLipRtCtrl--
fn SmLipRtCtrl = (
    loc_SmLipRtCtrl = AddPoint "Loc_SmLipRtCtrl" 0.6 blue
    loc_SmLipRtCtrl.pos = [-2.53, -5.631, 162.406] 
)
--CreateSmLipLfCtrl--
fn SmLipLfCtrl = (
    loc_SmLipLfCtrl = AddPoint "Loc_SmLipLfCtrl" 0.6 blue
    loc_SmLipLfCtrl.pos = [2.53, -5.631, 162.406] 
)
--CreateLipRegionUpCtrl--
fn LipRegionUpCtrl = (
    loc_LipRegionUpCtrl= AddPoint "Loc_LipRegionCtrl001" 0.6 blue
    loc_LipRegionUpCtrl.pos = [-0.006, -6.92, 160.325] 
)
--CreateLipRegionDnCtrl--
fn LipRegionDnCtrl = (
    loc_LipRegionDnCtrl= AddPoint "Loc_LipRegionCtrl002" 0.6 blue
    loc_LipRegionDnCtrl.pos = [-0.006, -6.92, 159.435] 
)
--CreateTeethCtrl--
fn TeethCtrl = (
    loc_TeethUpCtrl= AddPoint "Loc_TeethUpCtrl" 0.6 red
    loc_TeethUpCtrl.pos = [-0.003, -5.523, 162.995] 
    loc_TeethDnCtrl= AddPoint "Loc_TeethDnCtrl" 0.6 red
    loc_TeethDnCtrl.pos = [-0.003, -5.523, 161.206] 
)

--CreateTongueCtrl--
fn TongueCtrl = (
    loc_TongueRootCtrl = AddPoint "Loc_TeethRootCtrl" 0.6 red
    loc_TongueRootCtrl.pos = [-0.003, -0.63, 160.895] 
    loc_TongueCtrl01 = AddPoint "Loc_TeethCtrl01" 0.6 red
    loc_TongueCtrl01.pos = [-0.003, -1.015, 161.816] 
    loc_TongueCtrl02 = AddPoint "Loc_TeethCtrl02" 0.6 red
    loc_TongueCtrl02.pos = [-0.003, -2.281, 161.816]
    loc_TongueCtrl03 = AddPoint "Loc_TeethCtrl03" 0.6 red
    loc_TongueCtrl03.pos = [-0.003, -3.674, 161.816]
    loc_TongueCtrl04 = AddPoint "Loc_TeethCtrl04" 0.6 red
    loc_TongueCtrl04.pos = [-0.003, -4.937, 161.631]
)


fn faceSystemCtrlLoc = (
    CreateEyeBrowRtUpCtrl()
    CreateEyeBrowLfUpCtrl()
    CreateEyeLidRtCtrl()
    CreateEyeLidLfCtrl()
    CreateNosetrilRtCtrl()
    CreateNosetrilLfCtrl()
    SmLipRtCtrl()
    SmLipLfCtrl()
    LipRegionUpCtrl()
    LipRegionDnCtrl()
    TeethCtrl ()
    TongueCtrl()
    CreateEyeBallRtCtrl()
    CreateEyeBallLfCtrl()
    CreateEyeBallMidCtrl()

)
--  faceSystemCtrlLoc()
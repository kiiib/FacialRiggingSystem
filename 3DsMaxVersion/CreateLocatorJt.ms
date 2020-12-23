filein "Controller.ms"
filein "Locator.ms"

--fn RotateXYZ obj X Y Z = (
    --obj.rotation.x_rotation = X
    --obj.rotation.y_rotation = Y
    --obj.rotation.z_rotation = Z
--)

--Create_EyeBrowRtJt
fn CreateEyeBrowRtJt = (
    Loc_eyeBrowRtInner = AddPoint "EyeBrowRtJt001" 0.5 green
    Loc_eyeBrowRtInner.pos = [-0.963, -6.808, 169.269] 
    Loc_eyeBrowRtMid = AddPoint "EyeBrowRtJt002" 0.5 green
    Loc_eyeBrowRtMid.pos = [-2.613, -6.56, 170.138] 
    --RotateXYZ Loc_eyeBrowRtMid 90 0 -27.807
    Loc_eyeBrowRtOut = AddPoint "EyeBrowRtJt003" 0.5 green
    Loc_eyeBrowRtOut.pos = [-4.281, -5.221, 170.144]
   -- RotateXYZ Loc_eyeBrowRtOut 84.222 -4.428 -42.27
)

--Create_EyeBrowLfJt
fn CreateEyeBrowLfJt = (
    Loc_eyeBrowLfInner = AddPoint "EyeBrowLfJt001" 0.5 green  
    Loc_eyeBrowLfInner.pos = [0.963, -6.808, 169.269] 
    Loc_eyeBrowLfMid = AddPoint "EyeBrowLfJt002" 0.5 green
    Loc_eyeBrowLfMid.pos = [2.613, -6.56, 170.138] 
    RotateXYZ Loc_eyeBrowLfMid 90 0 27.807
    Loc_eyeBrowLfOut = AddPoint "EyeBrowLfJt003" 0.5 green
    Loc_eyeBrowLfOut.pos = [4.281, -5.221, 170.144]
    --RotateXYZ Loc_eyeBrowLfOut 84.222 -4.428 -42.27
)

--Create_EyeBrowMidJt
fn CreateEyeBrowMidJt = (
    Loc_eyeBrowMid = AddPoint "EyeBrowMidJt" 0.5 green  
    Loc_eyeBrowMid.pos = [-0.003, -7.035, 169.403] 
)

--Create_EyeLipUpRtJt
fn CreateEyeLidUpRtJt = (
    Loc_eyeLidRtUpInner =  AddPoint "EyeLidUpRtJt001" 0.5 green
    Loc_eyeLidRtUpInner.pos = [-1.867,-5.462,168.112]
    Loc_eyeLidRtUpMid = AddPoint "EyeLidMidUpRtJt" 0.5 green
    Loc_eyeLidRtUpMid.pos = [-2.884,-5.694,168.467]
    Loc_eyeLidRtUpOuter =  AddPoint "EyeLidUpRtJt002" 0.5 green
    Loc_eyeLidRtUpOuter.pos = [-4.001,-4.984,168.152]

)

--Create_EyeLipDnRtJt
fn CreateEyeLidDnRtJt = (
    Loc_eyeLidRtDnInner =  AddPoint "EyeLidDnRtJt001" 0.5 green
    Loc_eyeLidRtDnInner.pos = [-2.105,-5.36,167.45]
    Loc_eyeLidRtDnMid = AddPoint "EyeLidMidDnRtJt" 0.5 green
    Loc_eyeLidRtDnMid.pos = [-2.884,-5.456,167.307]
    Loc_eyeLidRtDnOuter =  AddPoint "EyeLidDnRtJt002" 0.5 green
    Loc_eyeLidRtDnOuter.pos = [-3.906,-4.837,167.521]
)


--Create_EyeLipUpLfJt
fn CreateEyeLidUpLfJt = (
    Loc_eyeLidLfUpInner =  AddPoint "EyeLidUpLfJt001" 0.5 green
    Loc_eyeLidLfUPInner.pos = [1.867,-5.462,168.112]
    Loc_eyeLidLfUpMid = AddPoint "EyeLidMidUpLfJt" 0.5 green
    Loc_eyeLidLfUpMid.pos = [2.884,-5.694,168.467]
    Loc_eyeLidLfUpOuter =  AddPoint "EyeLidUpLfJt002" 0.5 green
    Loc_eyeLidLfUpOuter.pos = [4.001,-4.984,168.152]

)

--Create_EyeLipDnLfJt
fn CreateEyeLidDnLfJt = (
    Loc_eyeLidLfDnInner =  AddPoint "EyeLidDnLfJt001" 0.5 green
    Loc_eyeLidLfDnInner.pos = [2.105,-5.36,167.45]
    Loc_eyeLidLfDnMid = AddPoint "EyeLidMidDnLfJt" 0.5 green
    Loc_eyeLidLfDnMid.pos = [2.884,-5.456,167.307]
    Loc_eyeLidLfDnOuter =  AddPoint "EyeLidDnLfJt002" 0.5 green
    Loc_eyeLidLfDnOuter.pos = [3.906,-4.837,167.521]
)

--Create_EyeBallRtJt
fn CreateEyeBallRtJt = (
    Loc_EyeBallRtRootJt = AddPoint "AimEyeRtJt" 0.5 green
    Loc_EyeBallRtRootJt.pos = [-2.884,-4.531,168.157]
    Loc_EyeBallRtJt = AddPoint "AimEyeRtJt001" 0.5 green
    Loc_EyeBallRtJt.pos = [-2.884,-5.637,168.011]
)

--Create_EyeBallLfJt
fn CreateEyeBallLfJt = (
    Loc_EyeBallLfRootJt = AddPoint "AimEyeLfJt" 0.5 green
    Loc_EyeBallLfRootJt.pos = [2.884,-4.531,168.157]
    Loc_EyeBallLfJt = AddPoint "AimEyeLfJt001" 0.5 green
    Loc_EyeBallLfJt.pos = [2.884,-5.637,168.011]
)

--Create_CheekRaiserRtJt
fn CheekRaiserRtJt = (
    Loc_CheekRaiserRtJtIn = AddPoint "CheekRaiserRtJt001" 0.5 green
    Loc_CheekRaiserRtJtIn.pos = [-2.101,-5.474,166.536]
    Loc_CheekRaiserRtJtOut = AddPoint "CheekRaiserRtJt002" 0.5 green
    Loc_CheekRaiserRtJtOut.pos = [-3.835,-4.743,166.33]
)

--Create_CheekRaiserLfJt
fn CheekRaiserLfJt = (
    Loc_CheekRaiserLfJtIn = AddPoint "CheekRaiserLfJt001" 0.5 green
    Loc_CheekRaiserLfJtIn.pos = [2.101,-5.474,166.536]
    Loc_CheekRaiserLfJtOut = AddPoint "CheekRaiserLfJt002" 0.5 green
    Loc_CheekRaiserLfJtOut.pos = [3.835,-4.743,166.33]
)

--Create_NosetrilRtJt
fn NosetrilRtJt = (
    Loc_NosetrilRtJt = AddPoint "NosetrilRtJt" 0.5 green
    Loc_NosetrilRtJt.pos = [-1.394,-6.149,164.552]
)

--Create_NosetrilLfJt
fn NosetrilLfJt = (
    Loc_NosetrilLfJt = AddPoint "NosetrilLfJt" 0.5 green
    Loc_NosetrilLfJt.pos = [1.394,-6.149,164.552]
)

--Create_NoseMid
fn NoseMid = (
    Loc_NoseMid = AddPoint "NoseMidJt002" 0.5 green
    Loc_NoseMid.pos = [-0.0034,-8.287,164.687]
)

--Create_NoseMidTopJt
fn NoseMidTopJt = (
    Loc_NoseMidTopJt = AddPoint "NoseMidTopJt" 0.5 green
    Loc_NoseMidTopJt.pos = [-0.003,-6.884,167.333]
)

--Create_CheekRtJt
fn CheekRtJt = (
    Loc_CheekRtJt = AddPoint "cheekRtJt" 0.5 green
    Loc_CheekRtJt.pos = [-4.189,-3.766,163.495] 
)

--Create_CheekLfJt
fn CheekLfJt = (
    Loc_CheekLfJt = AddPoint "cheekLfJt" 0.5 green
    Loc_CheekLfJt.pos = [4.189,-3.766,163.495] 
)

--Create_MouthLipUpJt
fn MouthLipUpJt = (
    Loc_MouthLipUpJtIN = AddPoint "LipRtUpJt001" 0.5 green
    Loc_MouthLipUpJtIN.pos = [-1.309,-6.079,162.477]
    Loc_MouthLipUpJtMid = AddPoint "LipMidUpJt" 0.5 green
    Loc_MouthLipUpJtMid.pos = [-0.003,-6.886,162.549]
    Loc_MouthLipUpJtOut= AddPoint "LipLfUpJt002" 0.5 green
    Loc_MouthLipUpJtOut.pos = [1.309,-6.079,162.477]
) 

--Create_MouthLipDnJt
fn MouthLipDnJt = (
    Loc_MouthLipDnJtIN = AddPoint "LipRtDnJt001" 0.5 green
    Loc_MouthLipDnJtIN.pos = [-1.268,-5.872,161.951]
    Loc_MouthLipDnJtMid = AddPoint "LipMidDnJt" 0.5 green
    Loc_MouthLipDnJtMid.pos = [0,-6.442,161.755]
    Loc_MouthLipDnJtOut= AddPoint "LipLfDnJt002" 0.5 green
    Loc_MouthLipDnJtOut.pos = [1.268,-5.872,161.951]
)

--Create_JawRootJt
fn JawRootJt = (
    Loc_JawRootJt = AddPoint "JawRootJt" 0.5 green
    Loc_JawRootJt.pos = [-0.003,0.525,164.911]
    Loc_JawJtDn = AddPoint "JawJt001 " 0.5 green
    Loc_JawJtDn.pos = [-0.003,-5.15,159.053]
)

--Create_TeethJt
fn TeethJt = (
    Loc_TeethUpJt = AddPoint "teethUpJt" 0.5 green
    Loc_TeethUpJt.pos = [-0.003,-3.77,162.995]
    Loc_TeethDnJt = AddPoint "teethDnJt" 0.5 green
    Loc_TeethDnJt.pos = [-0.003,-3.77,161.206]

)

--Create_TongueJt
fn TongueJt = (
    Loc_TongueJt = AddPoint "tongueRootJt" 0.5 green
    Loc_TongueJt.pos = [-0.003,-0.63,160.895]
    Loc_TongueJt001 = AddPoint "tongueJt001" 0.5 green
    Loc_TongueJt001.pos = [-0.003,-1.015,161.816]
    Loc_TongueJt002 = AddPoint "tongueJt002" 0.5 green
    Loc_TongueJt002.pos = [-0.003,-2.281,161.816]
    Loc_TongueJt003 = AddPoint "tongueJt003" 0.5 green
    Loc_TongueJt003.pos = [-0.003,-3.674,161.816]
    Loc_TongueJt004 = AddPoint "tongueJt004" 0.5 green
    Loc_TongueJt004.pos = [-0.003,-4.937,161.631]

)

--FaceSystemLocJtAll
fn FaceSystemLocJtAll = (
    CreateEyeBrowRtJt() 
    CreateEyeBrowLfJt() 
    CreateEyeBrowMidJt() 
    CreateEyeLidUpRtJt() 
    CreateEyeLidUpLfJt()
    CreateEyeLidDnRtJt()
    CreateEyeLidDnLfJt()
    CreateEyeBallRtJt()
    CreateEyeBallLfJt()
    CheekRaiserRtJt()
    CheekRaiserLfJt()
    NosetrilRtJt()
    NosetrilLfJt()
    NoseMid()  
    NoseMidTopJt() 
    CheekRtJt()    
    CheekLfJt()
    MouthLipUpJt()  
    MouthLipDnJt()
    JawRootJt()
    TeethJt()
    TongueJt()
)
FaceSystemLocJtAll()

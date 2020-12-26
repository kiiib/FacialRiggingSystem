
--filein "CommonFunction.ms"


--Create_EyeBrowRtJt
fn CreateEyeBrowRtJt = (
    loc_eyeBrowRtInner = AddPoint "Loc_EyeBrowRtJt001" 0.5 green
    loc_eyeBrowRtInner.pos = [-0.963, -6.808, 169.269] 
    loc_eyeBrowRtMid = AddPoint "Loc_EyeBrowRtJt002" 0.5 green
    loc_eyeBrowRtMid.pos = [-2.613, -6.56, 170.138] 
    --RotateXYZ Loc_eyeBrowRtMid 90 0 -27.807
    loc_eyeBrowRtOut = AddPoint "Loc_EyeBrowRtJt003" 0.5 green
    loc_eyeBrowRtOut.pos = [-4.281, -5.221, 170.144]
   -- RotateXYZ Loc_eyeBrowRtOut 84.222 -4.428 -42.27
)

--Create_EyeBrowLfJt
fn CreateEyeBrowLfJt = (
    loc_eyeBrowLfInner = AddPoint "Loc_EyeBrowLfJt001" 0.5 green  
    loc_eyeBrowLfInner.pos = [0.963, -6.808, 169.269] 
    loc_eyeBrowLfMid = AddPoint "Loc_EyeBrowLfJt002" 0.5 green
    loc_eyeBrowLfMid.pos = [2.613, -6.56, 170.138] 
    --RotateXYZ loc_eyeBrowLfMid 90 0 27.807
    loc_eyeBrowLfOut = AddPoint "Loc_EyeBrowLfJt003" 0.5 green
    loc_eyeBrowLfOut.pos = [4.281, -5.221, 170.144]
    --RotateXYZ Loc_eyeBrowLfOut 84.222 -4.428 -42.27
)

--Create_EyeBrowMidJt
fn CreateEyeBrowMidJt = (
    loc_eyeBrowMid = AddPoint "Loc_EyeBrowMidJt" 0.5 green  
    loc_eyeBrowMid.pos = [-0.003, -7.035, 169.403] 
)

--Create_EyeLipUpRtJt
fn CreateEyeLidUpRtJt = (
    loc_eyeLidRtUpInner =  AddPoint "Loc_EyeLidUpRtJt001" 0.5 green
    loc_eyeLidRtUpInner.pos = [-1.867, -5.462, 168.112]
    
    loc_eyeLidRtUpOuter =  AddPoint "Loc_EyeLidUpRtJt002" 0.5 green
    loc_eyeLidRtUpOuter.pos = [-4.001, -4.984, 168.152]

)

--Create_EyeLipDnRtJt
fn CreateEyeLidDnRtJt = (
    loc_eyeLidRtDnInner =  AddPoint "Loc_EyeLidDnRtJt001" 0.5 green
    loc_eyeLidRtDnInner.pos = [-2.105, -5.36, 167.45]
    
    loc_eyeLidRtDnOuter =  AddPoint "Loc_EyeLidDnRtJt002" 0.5 green
    loc_eyeLidRtDnOuter.pos = [-3.906, -4.837, 167.521]
)


--Create_EyeLipUpLfJt
fn CreateEyeLidUpLfJt = (
    loc_eyeLidLfUpInner =  AddPoint "Loc_EyeLidUpLfJt001" 0.5 green
    loc_eyeLidLfUPInner.pos = [1.867,-5.462,168.112]
    
    loc_eyeLidLfUpOuter =  AddPoint "Loc_EyeLidUpLfJt002" 0.5 green
    loc_eyeLidLfUpOuter.pos = [4.001,-4.984,168.152]

)

--Create_EyeLipDnLfJt
fn CreateEyeLidDnLfJt = (
    loc_eyeLidLfDnInner =  AddPoint "Loc_EyeLidDnLfJt001" 0.5 green
    loc_eyeLidLfDnInner.pos = [2.105,-5.36,167.45]
    
    loc_eyeLidLfDnOuter =  AddPoint "Loc_EyeLidDnLfJt002" 0.5 green
    loc_eyeLidLfDnOuter.pos = [3.906,-4.837,167.521]
)

--Create_EyeBallRtJt
fn CreateEyeBallRtJt = (
    loc_EyeBallRtRootUpJt = AddPoint "Loc_EyeBallRtRootUpJt" 0.5 green
    loc_EyeBallRtRootUpJt.pos = [-2.884,-4.531,168.157]
    
)

--Create_EyeBallLfJt
fn CreateEyeBallLfJt = (
    loc_EyeBallLfRootUpJt = AddPoint "Loc_EyeBallLfRootUpJt" 0.5 green
    loc_EyeBallLfRootUpJt.pos = [2.884,-4.531,168.157]
    
)

--Create_CheekRaiserRtJt
fn CheekRaiserRtJt = (
    loc_CheekRaiserRtJtIn = AddPoint "Loc_CheekRaiserRtJt001" 0.5 green
    loc_CheekRaiserRtJtIn.pos = [-2.101,-5.474,166.536]
    loc_CheekRaiserRtJtOut = AddPoint "Loc_CheekRaiserRtJt002" 0.5 green
    loc_CheekRaiserRtJtOut.pos = [-3.835,-4.743,166.33]
)

--Create_CheekRaiserLfJt
fn CheekRaiserLfJt = (
    loc_CheekRaiserLfJtIn = AddPoint "Loc_CheekRaiserLfJt001" 0.5 green
    loc_CheekRaiserLfJtIn.pos = [2.101,-5.474,166.536]
    loc_CheekRaiserLfJtOut = AddPoint "Loc_CheekRaiserLfJt002" 0.5 green
    loc_CheekRaiserLfJtOut.pos = [3.835,-4.743,166.33]
)

--Create_NosetrilRtJt
fn NosetrilRtJt = (
    loc_NosetrilRtJt = AddPoint "Loc_NosetrilRtJt" 0.5 green
    loc_NosetrilRtJt.pos = [-1.394,-6.149,164.552]
)

--Create_NosetrilLfJt
fn NosetrilLfJt = (
    loc_NosetrilLfJt = AddPoint "Loc_NosetrilLfJt" 0.5 green
    loc_NosetrilLfJt.pos = [1.394,-6.149,164.552]
)

--Create_NoseMidJt
fn NoseMid = (
    loc_NoseMid = AddPoint "Loc_NoseMidJt002" 0.5 green
    loc_NoseMid.pos = [-0.0034,-8.287,164.687]
)

--Create_NoseMidTopJt
fn NoseMidTopJt = (
    loc_NoseMidTopJt = AddPoint "Loc_NoseMidTopJt" 0.5 green
    loc_NoseMidTopJt.pos = [-0.003,-6.884,167.333]
)

--Create_CheekRtJt
fn CheekRtJt = (
    loc_CheekRtJt = AddPoint "Loc_CheekRtJt" 0.5 green
    loc_CheekRtJt.pos = [-4.189,-3.766,163.495] 
)

--Create_CheekLfJt
fn CheekLfJt = (
    loc_CheekLfJt = AddPoint "Loc_CheekLfJt" 0.5 green
    loc_CheekLfJt.pos = [4.189,-3.766,163.495] 
)

--Create_MouthLipUpJt
fn MouthLipUpJt = (
    loc_MouthLipUpJtIN = AddPoint "Loc_LipRtUpJt001" 0.5 green
    loc_MouthLipUpJtIN.pos = [-1.309,-6.079,162.477]
    loc_MouthLipUpJtMid = AddPoint "Loc_LipMidUpJt" 0.5 green
    loc_MouthLipUpJtMid.pos = [-0.003,-6.886,162.549]
    loc_MouthLipUpJtOut= AddPoint "Loc_LipLfUpJt002" 0.5 green
    loc_MouthLipUpJtOut.pos = [1.309,-6.079,162.477]
) 

--Create_MouthLipDnJt
fn MouthLipDnJt = (
    loc_MouthLipDnJtIN = AddPoint "Loc_LipRtDnJt001" 0.5 green
    loc_MouthLipDnJtIN.pos = [-1.268,-5.872,161.951]
    loc_MouthLipDnJtMid = AddPoint "Loc_LipMidDnJt" 0.5 green
    loc_MouthLipDnJtMid.pos = [0,-6.442,161.755]
    loc_MouthLipDnJtOut= AddPoint "Loc_LipLfDnJt002" 0.5 green
    loc_MouthLipDnJtOut.pos = [1.268,-5.872,161.951]
)

--Create_JawRootJt
fn JawRootJt = (
    loc_JawRootJt = AddPoint "Loc_JawRootJt" 0.5 green
    loc_JawRootJt.pos = [-0.003,0.525,164.911]
    loc_JawJtDn = AddPoint "Loc_JawJt001 " 0.5 green
    loc_JawJtDn.pos = [-0.003,-5.15,159.053]
)

--Create_TeethJt
fn TeethJt = (
    loc_TeethUpJt = AddPoint "Loc_teethUpJt" 0.5 green
    loc_TeethUpJt.pos = [-0.003,-3.77,162.995]
    loc_TeethDnJt = AddPoint "Loc_teethDnJt" 0.5 green
    loc_TeethDnJt.pos = [-0.003,-3.77,161.206]

)

--Create_TongueJt
fn TongueJt = (
    loc_TongueJt = AddPoint "Loc_tongueRootJt" 0.5 green
    loc_TongueJt.pos = [-0.003,-0.63,160.895]
    loc_TongueJt001 = AddPoint "Loc_tongueJt001" 0.5 green
    loc_TongueJt001.pos = [-0.003,-1.015,161.816]
    loc_TongueJt002 = AddPoint "Loc_tongueJt002" 0.5 green
    loc_TongueJt002.pos = [-0.003,-2.281,161.816]
    loc_TongueJt003 = AddPoint "Loc_tongueJt003" 0.5 green
    loc_TongueJt003.pos = [-0.003,-3.674,161.816]
    loc_TongueJt004 = AddPoint "Loc_tongueJt004" 0.5 green
    loc_TongueJt004.pos = [-0.003,-4.937,161.631]

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
--FaceSystemLocJtAll()

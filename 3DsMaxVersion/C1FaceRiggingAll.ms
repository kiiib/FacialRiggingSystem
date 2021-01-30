fn RotatePivot obj x y z absolute:true =
(
	-- store the object's position for later
	p = obj.pos
	
	if absolute do
	(   --https://forums.cgsociety.org/t/affect-pivot-only-rotation/767199
		-- store the object's rotation as an offset from the
		-- identity matrix (aka zero world transform)
		offsetrot = inverse (obj.rotation * inverse (matrix3 1))
		
		-- use the stored offset to zero the pivot rotation
		-- in world coords. after this step, the supplied x y z 
		-- will be an absolute offset from world coords:)
		obj.rotation *= offsetrot
		obj.objectoffsetrot *= offsetrot
	)
	
	-- get the supplied x y z degrees as a quaternion offset.
	-- the inversion changes the rotation from a right-handed 
	-- coordinate system to the expected left-handed system.
	-- Rotation in Maxscript sure is tricky!
	rot = inverse ((eulerangles x y z) as quat)
	
	-- finally, apply the final offset to the object's pivot.
	-- Basically, we're transforming the whole object, and then
	-- using .objectoffsetrot to backtransform just the object's 
	-- geometry.  Pretty neat, huh?
	obj.rotation *= rot
	obj.objectoffsetrot *= rot
	
	-- set the object to it's original position
	obj.pos = p
	
	return ok
)

-- Freeze Position
fn FreezePosition node = 
(
	if classof node.Position.controller != Position_layer do
	(
		-- freeze position
		node.position.controller = Bezier_Position()
		node.position.controller = position_list()
		node.position.controller.available.controller = Position_XYZ()

		node.position.controller.setname 1 "Frozen Position"
		node.position.controller.setname 2 "Zero Pos XYZ"
		node.position.controller.SetActive 2
		
		-- position to zero
		node.position.controller[2].x_Position = 0
		node.position.controller[2].y_Position = 0
		node.position.controller[2].z_Position = 0

	)
)

-- Freeze Rotation
fn FreezeRotation node = 
(
	if classof node.rotation.controller != Rotation_Layer do
	(
		-- freeze rotation
		node.rotation.controller = Euler_XYZ()
		node.rotation.controller = Rotation_list()
		node.rotation.controller.available.controller = Euler_XYZ()

		node.rotation.controller.setname 1 "Inital Pose"
		node.rotation.controller.setname 2 "Keyframe XYZ"

		node.rotation.controller.SetActive 2
	)
)

-- FreezeTransform Object
fn FreezeTransform node = 
(
	FreezeRotation node
	FreezePosition node	
)

-- Set Position to Zero
fn TransformToZero node =
(
	if classof node.Position.controller != Position_Layer then
	(
		local active = node.position.controller.active
		node.Position.controller[active].value = (Point3 0 0 0)
	)
	else
	(
		node.Position.controller[2].x_Position = 0
		node.Position.controller[2].y_Position = 0
		node.Position.controller[2].z_Position = 0
	)
)

-- Set Rotation to Zero
fn RotationToZero node = 
(
	if classof node.rotation.controller != Rotation_Layer then
	(
		local active = node.position.controller.active
		node.rotation.controller[active].value = (quat 0 0 0 1)
	)
	else
	(
		node.rotation.controller[2].x_rotation = 0
		node.rotation.controller[2].y_rotation = 0
		node.rotation.controller[2].z_rotation = 0
	)
)

-- Align two Object, align obj1 to the obj2's position and rotation
fn AlignTwoObject obj1 obj2 = 
(
	-- obj1.rotation = obj2.rotation
	obj1.pos = obj2.pos
)

fn AddCricle Locator cirRadius cirColor = (  
	cirName = GetCtrlName Locator.name
    cir = circle radius:cirRadius name:cirName wireColor:cirColor
    cir.rotation.x_rotation = 90
    return cir
)

fn AddPoint pointName pointSize pointsColor = (  
    pit = point name:pointName size: pointSize wireColor:pointsColor
    return pit
)

fn AddDummy dummyName dummySize = (  
    dum = Dummy name:dummyName boxsize: dummySize 
    return dum
)

fn AddRectangle Locator RectangleLenght RectangleWidth RectangleColor = (  
	RectangleName = GetCtrlName Locator.name
    rec = Rectangle name:RectangleName wireColor:RectangleColor
    rec.width = RectangleWidth
    rec.length = RectangleLenght
    rec.rotation.x_rotation = 90
    return rec 
)
-- Use Name to find locator
fn FindLocator name =
(
    locator = getNodeByName name
    
    if(superClassOf locator == helper) then(
        return locator
    )

    return false  
)

-- Position and Orientation Constraint With obj1 and obj2
fn TwoObjControllerRelation obj1 obj2 = (

    --- Constraint relation ---
    -- Position Constraint
    posCtrl = Position_Constraint()
    posCtrl.relative = false    --Not Keep Initial Offset
    posCtrl.appendTarget obj2 100 --weight:100
    obj1.position.controller = posCtrl

    -- Orientation Constraint
    oriCtrl = Orientation_Constraint()
    oriCtrl.relative = false    --Not Keep Initial Offset
    oriCtrl.appendTarget obj2 100
    obj1.rotation.controller = oriCtrl

)

-- LookAt Constraint With obj1 and obj2
fn LookAtConstrantRelation obj1 obj2 = (
	lookAtCtrl = LookAt_Constraint()
	lookAtCtrl.relative = false --Not Keep Initial Offset
	lookAtCtrl.appendTarget obj2 100
	obj1.rotation.controller = lookAtCtrl

	-- invisible viewline
	obj1.rotation.controller.lookat_vector_length = 0
)

-- replace string function
-- http://www.360doc.com/content/18/1120/10/110467_796042795.shtml
fn ReplaceStr str1 str2 str3 = (
    while ((i = findstring str1 str2) != undefined) do
    (
        str1 = replace str1 i str2.count str3
    )
    return str1
)

-- Get ctrl name from locator function
fn GetCtrlName locName = (
	str = locName
	str = ReplaceStr str "Ctrl" ""
	str = ReplaceStr str "Loc" "Ctrl"
	-- print str
)

-- Get bone name from locator function
fn GetBoneName locName = (
	str = locName
	str = ReplaceStr str "Jt" ""
	str = ReplaceStr str "Loc" "Jt"
	-- print str
)

fn RotateXYZ obj X Y Z = (
    obj.rotation.x_rotation = X
    obj.rotation.y_rotation = Y
    obj.rotation.z_rotation = Z
)

fn AddBone locator startPos endPos width:0.2 height:0.2 BoneEnd:false= (

    -- About creating bone end refercence: https://forums.cgsociety.org/t/maxscript-need-help-creating-bones-on-selection/1587708/3
    bx1 = Dummy pos:startPos
    bx2 = Dummy pos:endPos

    dir = normalize(bx2.pos - bx1.pos)

    bn1 = boneSys.createBone bx1.pos bx2.pos (cross dir bx1.dir)
    BoneName = GetBoneName locator.name
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
    loc_EyeBallRtRootJt = AddPoint "Loc_EyeBallRtRootJt" 0.5 green
    loc_EyeBallRtRootJt.pos = [-2.884,-4.531,168.157]
    
)

--Create_EyeBallLfJt
fn CreateEyeBallLfJt = (
    loc_EyeBallLfRootJt = AddPoint "Loc_EyeBallLfRootJt" 0.5 green
    loc_EyeBallLfRootJt.pos = [2.884,-4.531,168.157]
    
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
fn GetAxisArrayNumber axisString = 
(
    axisNumber = 0
    if(axisString == "X") then
        axisNumber = 1
    if(axisString == "Y") then
        axisNumber = 2
    if(axisString == "Z") then
        axisNumber = 3

    return axisNumber
)

-- Assign One Axis Float Script Rotation function
fn AssignOneAxisFloatScriptRotationController bone ctrlVar axis scriptContent =
(
    axisNumber = GetAxisArrayNumber axis

    -- [2] means rotation->Keyframe XYZ : Euler XYZ = (quat 0 0 0 1)
    bone.rotation.controller[2][axisNumber].controller = float_script()

    assignControllerAxis =  bone.rotation.controller[2][axisNumber].controller

    -- print ctrlVar.count
    for i in ctrlVar do(   
        -- Add Variables
        assignControllerAxis.addNode i.name i
    )
    
    -- Assign Script Content
    assignControllerAxis.script = scriptContent
)

-- Assign One Axis Float Script Position function
fn AssignOneAxisFloatScriptPositionController bone ctrlVar axis scriptContent =
(
    axisNumber = GetAxisArrayNumber axis

    -- [2] means position->Zero Pos XYZ : Position XYZ = (0 0 0)
    bone.position.controller[2][axisNumber].controller = float_script()

    assignControllerAxis =  bone.position.controller[2][axisNumber].controller

    -- print ctrlVar.count
    for i in ctrlVar do(   
        -- Add Variables
        assignControllerAxis.addNode i.name i
    )
    
    -- Assign Script Content
    assignControllerAxis.script = scriptContent
)

-- Assign Position Script function
fn AssignPositionScriptController bone ctrlVar scriptContent =
(
    -- [2] means position->Zero Pos XYZ : Position XYZ = (0 0 0)
    bone.position.controller[2].controller = position_script()
    assignController = bone.position.controller[2].controller
    
    for i in ctrlVar do(   
        -- Add Variables
        assignController.addNode i.name i
    )

     -- Assign Script Content
     assignController.script = scriptContent
)

fn FaceEyeBrowPart jt_head mainCtrl = (
    ------- EyeBrowRt Part -------

 -- Get JtLocator -------
 loc_eyeBrowRtInner = FindLocator "Loc_EyeBrowRtJt001"
 loc_eyeBrowRtMid = FindLocator "Loc_EyeBrowRtJt002"
 loc_eyeBrowRtOut = FindLocator "Loc_EyeBrowRtJt003"

 -- Get CtrlLocator -------
 loc_eyeBrowRtUpCtrl = FindLocator "Loc_EyeBrowUpRtCtrl001"

 -- Create Controller
 ctrl_eyeRt = AddCricle loc_eyeBrowRtUpCtrl 0.5 blue

 -- Create Bones
 bone_eyeBrowRtInner = AddBone loc_eyeBrowRtInner [0, 0, 0] [0, 2, 0]
 bone_eyeBrowRtMid  = AddBone loc_eyeBrowRtMid [0, 0, 0] [0, 2, 0]
 bone_eyeBrowRtOut = AddBone loc_eyeBrowRtOut [0, 0, 0] [0, 2, 0]

 -- Align the objects to the locator
 AlignTwoObject ctrl_eyeRt loc_eyeBrowRtUpCtrl
 AlignTwoObject bone_eyeBrowRtInner loc_eyeBrowRtInner
 AlignTwoObject bone_eyeBrowRtMid loc_eyeBrowRtMid
 AlignTwoObject bone_eyeBrowRtOut loc_eyeBrowRtOut

 -- Parent and Constraint Relevance
 ctrl_eyeRt.parent = mainCtrl
 bone_eyeBrowRtInner.parent = jt_head
 bone_eyeBrowRtMid.parent = jt_head
 bone_eyeBrowRtOut.parent = jt_head

 -- Init Controllers and bones
 FreezeTransform ctrl_eyeRt
 FreezeTransform bone_eyeBrowRtInner
 FreezeTransform bone_eyeBrowRtMid
 FreezeTransform bone_eyeBrowRtOut

 -- Script Variables
 ctrlVar = #()
 append ctrlVar ctrl_eyeRt

 -- Assign script
 scriptContent = "[(" + ctrlVar[1].name + ".controller[1][2].value)[3],(" + ctrlVar[1].name + ".controller[1][2].value)[2],(" + ctrlVar[1].name + ".controller[1][2].value)[1]]"

 -- Assign Script to Controller
 AssignPositionScriptController bone_eyeBrowRtInner ctrlVar scriptContent
 AssignPositionScriptController bone_eyeBrowRtMid ctrlVar scriptContent
 AssignPositionScriptController bone_eyeBrowRtOut ctrlVar scriptContent

 ------- End EyeBrowRt Part --------

 -------  EyeBrowLf Part -------
 -- Get JtLocator -------
 loc_eyeBrowLfInner = FindLocator "Loc_EyeBrowLfJt001"
 loc_eyeBrowLfMid= FindLocator "Loc_EyeBrowLfJt002"
 loc_eyeBrowLfOut = FindLocator "Loc_EyeBrowLfJt003"
 -- Get CtrlLocator -------
 loc_eyeBrowLfUpCtrl = FindLocator "Loc_EyeBrowUpLfCtrl001"

 -- Create Controller
 ctrl_eyeLf = AddCricle loc_eyeBrowLfUpCtrl 0.5 blue

 -- Create Bones
 bone_eyeBrowLfInner = AddBone loc_eyeBrowLfInner [0, 0, 0] [0, 2, 0]
 bone_eyeBrowLfMid  = AddBone loc_eyeBrowLfMid [0, 0, 0] [0, 2, 0]
 bone_eyeBrowLfOut = AddBone loc_eyeBrowLfOut [0, 0, 0] [0, 2, 0]

 -- Align the objects to the locator
 AlignTwoObject ctrl_eyeLf loc_eyeBrowLfUpCtrl
 AlignTwoObject bone_eyeBrowLfInner loc_eyeBrowLfInner
 AlignTwoObject bone_eyeBrowLfMid loc_eyeBrowLfMid
 AlignTwoObject bone_eyeBrowLfOut loc_eyeBrowLfOut

 -- Parent and Constraint Relevance
 ctrl_eyeLf.parent = mainCtrl
 bone_eyeBrowLfInner.parent = jt_head
 bone_eyeBrowLfMid.parent = jt_head
 bone_eyeBrowLfOut.parent = jt_head

 -- TwoObjControllerRelation eyeRtCtrl jt_head


 -- Init Controllers and bones
 FreezeTransform ctrl_eyeLf
 FreezeTransform bone_eyeBrowLfInner
 FreezeTransform bone_eyeBrowLfMid
 FreezeTransform bone_eyeBrowLfOut

 -- Script Variables
 ctrlVarEyeBrowLf = #()
 append ctrlVarEyeBrowLf ctrl_eyeLf

 -- Assign script
 scriptContent = "[(" + ctrlVarEyeBrowLf[1].name + ".controller[1][2].value)[3],(" + ctrlVarEyeBrowLf[1].name + ".controller[1][2].value)[2],(" + ctrlVarEyeBrowLf[1].name + ".controller[1][2].value)[1]]"

 -- Assign Script to Controller
 AssignPositionScriptController bone_eyeBrowLfInner ctrlVarEyeBrowLf scriptContent
 AssignPositionScriptController bone_eyeBrowLfMid ctrlVarEyeBrowLf scriptContent
 AssignPositionScriptController bone_eyeBrowLfOut ctrlVarEyeBrowLf scriptContent


 ------- End EyeBrowLf Part --------

 ------- EyeBrowMid Part -------
 ------- End EyeBrowMid Part -------
)

fn FaceEyeLipPart jt_head mainCtrl = (
    ------- EyeLipRt Part -------
    -- Get JtLocator -------
    loc_eyeLidRtUpInner = FindLocator "Loc_EyeLidUpRtJt001"
    loc_eyeLidRtUpOuter = FindLocator "Loc_EyeLidUpRtJt002"
    loc_eyeLidRtDnInner = FindLocator "Loc_EyeLidDnRtJt001"
    loc_eyeLidRtDnOuter = FindLocator "Loc_EyeLidDnRtJt002"

    -- Get CtrlLocator -------
    loc_eyeLidRtInCtrl = FindLocator "Loc_EyeLidUpRtInCtrl001"
    loc_eyeLidRtOutCtrl = FindLocator "Loc_EyeLidUpRtOutCtrl001"


    -- Create Controller
    ctrl_eyeLipRtIn = AddCricle loc_eyeLidRtInCtrl 0.4 blue
    ctrl_eyeLipRtOut= AddCricle loc_eyeLidRtOutCtrl 0.4 blue

    -- Create Bones
    bone_eyeLidRtUpInner = AddBone loc_eyeLidRtUpInner [0, 0, 0] [0, 2, 0] 
    bone_eyeLidRtUpOuter = AddBone loc_eyeLidRtUpOuter [0, 0, 0] [0, 2, 0]

    bone_eyeLidRtDnInner = AddBone loc_eyeLidRtDnInner [0, 0, 0] [0, 2, 0] 
    bone_eyeLidRtDnOuter = AddBone loc_eyeLidRtDnOuter [0, 0, 0] [0, 2, 0] 

    -- Align the objects to the locator
    AlignTwoObject ctrl_eyeLipRtIn loc_eyeLidRtInCtrl
    AlignTwoObject ctrl_eyeLipRtOut loc_eyeLidRtOutCtrl
    AlignTwoObject bone_eyeLidRtUpInner loc_eyeLidRtUpInner
    AlignTwoObject bone_eyeLidRtUpOuter loc_eyeLidRtUpOuter
    AlignTwoObject bone_eyeLidRtDnInner loc_eyeLidRtDnInner
    AlignTwoObject bone_eyeLidRtDnOuter loc_eyeLidRtDnOuter



    -- Parent and Constraint Relevance
    ctrl_eyeLipRtIn.parent = mainCtrl
    ctrl_eyeLipRtOut.parent = mainCtrl
    bone_eyeLidRtUpInner.parent = jt_head
    bone_eyeLidRtUpOuter.parent = jt_head
    bone_eyeLidRtDnInner.parent = jt_head
    bone_eyeLidRtDnOuter.parent = jt_head

    -- Init Controllers and bones
    FreezeTransform ctrl_eyeLipRtIn
    FreezeTransform ctrl_eyeLipRtOut
    FreezeTransform bone_eyeLidRtUpInner
    FreezeTransform bone_eyeLidRtUpOuter
    FreezeTransform bone_eyeLidRtDnInner
    FreezeTransform bone_eyeLidRtDnOuter
    
    -- Script Variables
    ctrlVarEyeLipUpInRt = #()
    ctrlVarEyeLipUpOutRt = #()
    append ctrlVarEyeLipUpInRt ctrl_eyeLipRtIn
    append ctrlVarEyeLipUpOutRt ctrl_eyeLipRtOut

    -- Assign script
    PosXScriptInContent ="(" + ctrlVarEyeLipUpInRt[1].name + ".controller[1][2].value)[3] * 0.3"
    PosZScriptInContent ="(" + ctrlVarEyeLipUpInRt[1].name + ".controller[1][2].value)[1] * 0.3"

    PosXScriptOutContent ="(" + ctrlVarEyeLipUpOutRt[1].name + ".controller[1][2].value)[3] * 0.3"
    PosZScriptOutContent ="(" + ctrlVarEyeLipUpOutRt[1].name + ".controller[1][2].value)[1] * 0.3"

    PosXScriptDnInContent ="(" + ctrlVarEyeLipUpInRt[1].name + ".controller[1][2].value)[3] * 0.3"
    PosZScriptDnInContent ="(" + ctrlVarEyeLipUpInRt[1].name + ".controller[1][2].value)[1] * 0.3"

    PosXScriptDnOutContent ="(" + ctrlVarEyeLipUpOutRt[1].name + ".controller[1][2].value)[3] * 0.3"
    PosZScriptDnOutContent ="(" + ctrlVarEyeLipUpOutRt[1].name + ".controller[1][2].value)[1] * 0.3"

    -- Assign Script to Controller
    AssignOneAxisFloatScriptPositionController  bone_eyeLidRtUpInner ctrlVarEyeLipUpInRt "X" PosXScriptInContent
    AssignOneAxisFloatScriptPositionController bone_eyeLidRtUpInner ctrlVarEyeLipUpInRt "Z" PosZScriptInContent

    AssignOneAxisFloatScriptPositionController  bone_eyeLidRtUpOuter ctrlVarEyeLipUpOutRt "X"  PosXScriptOutContent
    AssignOneAxisFloatScriptPositionController bone_eyeLidRtUpOuter ctrlVarEyeLipUpOutRt "Z" PosZScriptOutContent

    AssignOneAxisFloatScriptPositionController  bone_eyeLidRtDnInner ctrlVarEyeLipUpInRt "X" PosXScriptDnInContent
    AssignOneAxisFloatScriptPositionController bone_eyeLidRtDnInner ctrlVarEyeLipUpInRt "Z" PosZScriptDnInContent

    AssignOneAxisFloatScriptPositionController  bone_eyeLidRtDnOuter ctrlVarEyeLipUpOutRt "X" PosXScriptDnOutContent
    AssignOneAxisFloatScriptPositionController bone_eyeLidRtDnOuter ctrlVarEyeLipUpOutRt "Z" PosZScriptDnOutContent
    ------- End EyeLipUpRt Part --------

    ------- EyeLipLf Part -------
    -- Get JtLocator -------
    loc_eyeLidLfUpInner = FindLocator "Loc_EyeLidUpLfJt001"
    loc_eyeLidLfUpOuter = FindLocator "Loc_EyeLidUpLfJt002"
    loc_eyeLidLfDnInner = FindLocator "Loc_EyeLidDnLfJt001"
    loc_eyeLidLfDnOuter = FindLocator "Loc_EyeLidDnLfJt002"

    -- Get CtrlLocator -------
    loc_eyeLidLfInCtrl = FindLocator "Loc_EyeLidUpLfInCtrl001"
    loc_eyeLidLfOutCtrl = FindLocator "Loc_EyeLidUpLfOutCtrl001"

    -- Create Controller-------
    ctrl_eyeLidLfIn = AddCricle loc_eyeLidLfInCtrl 0.4 blue
    ctrl_eyeLidLfOut = AddCricle loc_eyeLidLfOutCtrl 0.4 blue

    -- Create Bones-------
    bone_eyeLidLfUpInner = AddBone loc_eyeLidLfUpInner [0, 0, 0] [0, 2, 0] 
    bone_eyeLidLfUpOuter = AddBone loc_eyeLidLfUpOuter [0, 0, 0] [0, 2, 0]

    bone_eyeLidLfDnInner = AddBone loc_eyeLidLfDnInner [0, 0, 0] [0, 2, 0] 
    bone_eyeLidLfDnOuter = AddBone loc_eyeLidLfDnOuter [0, 0, 0] [0, 2, 0] 

    -- Align the objects to the locator-------
    AlignTwoObject ctrl_eyeLidLfIn loc_eyeLidLfInCtrl
    AlignTwoObject ctrl_eyeLidLfOut loc_eyeLidLfOutCtrl
    AlignTwoObject bone_eyeLidLfUpInner loc_eyeLidLfUpInner
    AlignTwoObject bone_eyeLidLfUpOuter loc_eyeLidLfUpOuter
    AlignTwoObject bone_eyeLidLfDnInner loc_eyeLidLfDnInner
    AlignTwoObject bone_eyeLidLfDnOuter loc_eyeLidLfDnOuter

    -- Parent and Constraint Relevance-------
    ctrl_eyeLidLfIn.parent = mainCtrl
    ctrl_eyeLidLfOut.parent = mainCtrl
    bone_eyeLidLfUpInner.parent = jt_head
    bone_eyeLidLfUpOuter.parent = jt_head
    bone_eyeLidLfDnInner.parent = jt_head
    bone_eyeLidLfDnOuter.parent = jt_head

    -- Init Controllers and bones-------
    FreezeTransform ctrl_eyeLidLfIn
    FreezeTransform ctrl_eyeLidLfOut
    FreezeTransform bone_eyeLidLfUpInner
    FreezeTransform bone_eyeLidLfUpOuter
    FreezeTransform bone_eyeLidLfDnInner
    FreezeTransform bone_eyeLidLfDnOuter
    
    -- Script Variables-------
    ctrlVarEyeLipUpInLf = #()
    ctrlVarEyeLipUpOutLf = #()
    append ctrlVarEyeLipUpInLf ctrl_eyeLidLfIn
    append ctrlVarEyeLipUpOutLf ctrl_eyeLidLfOut

    -- Assign script-------
    PosXScriptInLfContent ="(" + ctrlVarEyeLipUpInLf[1].name + ".controller[1][2].value)[3] * 0.3"
    PosZScriptInLfContent ="(" + ctrlVarEyeLipUpInLf[1].name + ".controller[1][2].value)[1] * 0.3"

    PosXScriptOutLfContent ="(" + ctrlVarEyeLipUpOutLf[1].name + ".controller[1][2].value)[3] * 0.3"
    PosZScriptOutLfContent ="(" + ctrlVarEyeLipUpOutLf[1].name + ".controller[1][2].value)[1] * 0.3"

    PosXScriptDnLfInContent ="(" + ctrlVarEyeLipUpInLf[1].name + ".controller[1][2].value)[3] * 0.3"
    PosZScriptDnLfInContent ="(" + ctrlVarEyeLipUpInLf[1].name + ".controller[1][2].value)[1] * 0.3"

    PosXScriptDnLfOutContent ="(" + ctrlVarEyeLipUpOutLf[1].name + ".controller[1][2].value)[3] * 0.3"
    PosZScriptDnLfOutContent ="(" + ctrlVarEyeLipUpOutLf[1].name + ".controller[1][2].value)[1] * 0.3"

    -- Assign Script to Controller-------
    AssignOneAxisFloatScriptPositionController  bone_eyeLidLfUpInner ctrlVarEyeLipUpInLf "X" PosXScriptInLfContent
    AssignOneAxisFloatScriptPositionController bone_eyeLidLfUpInner ctrlVarEyeLipUpInLf "Z" PosZScriptInLfContent

    AssignOneAxisFloatScriptPositionController  bone_eyeLidLfUpOuter ctrlVarEyeLipUpOutLf "X"  PosXScriptOutLfContent
    AssignOneAxisFloatScriptPositionController bone_eyeLidLfUpOuter ctrlVarEyeLipUpOutLf "Z" PosZScriptOutLfContent

    AssignOneAxisFloatScriptPositionController  bone_eyeLidLfDnInner ctrlVarEyeLipUpInLf "X" PosXScriptDnLfInContent
    AssignOneAxisFloatScriptPositionController bone_eyeLidLfDnInner ctrlVarEyeLipUpInLf "Z" PosZScriptDnLfInContent

    AssignOneAxisFloatScriptPositionController  bone_eyeLidLfDnOuter ctrlVarEyeLipUpOutLf "X" PosXScriptDnLfOutContent
    AssignOneAxisFloatScriptPositionController bone_eyeLidLfDnOuter ctrlVarEyeLipUpOutLf "Z" PosZScriptDnLfOutContent
)

fn FaceEyeBallPart jt_head mainCtrl = (
    ------- EyeBall Part -------

    -- Get EyeBall Rectangle Controller-------
    loc_eyeBallMidCtrl = FindLocator "Loc_eyeBallMidCtrl"
    
    -- Create Controller-------
    ctrl_eyeBallMidCtrl = AddRectangle loc_eyeBallMidCtrl 5 12 yellow

     -- Align the objects to the locator-------
    AlignTwoObject ctrl_eyeBallMidCtrl loc_eyeBallMidCtrl
   
     -- Parent and Constraint Relevance-------
    ctrl_eyeBallMidCtrl.parent = mainCtrl

     -- Init Controllers and bones-------
    FreezeTransform ctrl_eyeBallMidCtrl
    -- End EyeBall Rectangle Controller-------
    
    
    -- Get EyeBall Controller-------
    loc_eyeBallRtCtrl = FindLocator "Loc_eyeBallRtCtrl"
    loc_eyeBallRtRootJt = FindLocator "Loc_EyeBallRtRootJt"

    loc_eyeBallLfCtrl = FindLocator "Loc_eyeBallLfCtrl"
    loc_eyeBallLfRootJt = FindLocator "Loc_EyeBallLfRootJt"

    -- Create Controller-------
    ctrl_eyeBallRtCtrl = AddCricle loc_eyeBallRtCtrl 0.5 blue
    ctrl_eyeBallLfCtrl = AddCricle loc_eyeBallLfCtrl 0.5 blue

    -- Create Bones-------
    bone_eyeBallRtUP = AddBone loc_eyeBallRtRootJt [0, 2, 0] [0, 0, 1]
    bone_eyeBallRtUP.name = "Jt_EyeBallRtUP"
    bone_eyeBallRtMid = AddBone loc_eyeBallRtRootJt [0, 2, 0] [0, 0, 0]
    bone_eyeBallRtMid.name = "Jt_EyeBallRtMid"
    bone_eyeBallRtDn = AddBone loc_eyeBallRtRootJt [0, 2, 0] [0, 0, -1]
    bone_eyeBallRtDn.name = "Jt_EyeBallRtDn"
    
    bone_eyeBallLfUP = AddBone loc_eyeBallLfRootJt [0, 2, 0] [0, 0, 1]
    bone_eyeBallLfUP.name = "Jt_EyeBallLfUP"
    bone_eyeBallLfMid = AddBone loc_eyeBallLfRootJt [0, 2, 0] [0, 0, 0]
    bone_eyeBallLfMid.name = "Jt_EyeBallLfMid"
    bone_eyeBallLfDn = AddBone loc_eyeBallLfRootJt [0, 2, 0] [0, 0, -1]
    bone_eyeBallLfDn.name = "Jt_EyeBallLfDn"
    
     -- Align the objects to the locator-------
    AlignTwoObject ctrl_eyeBallRtCtrl loc_eyeBallRtCtrl

    AlignTwoObject bone_eyeBallRtUP loc_eyeBallRtRootJt
    AlignTwoObject bone_eyeBallRtMid loc_eyeBallRtRootJt
    AlignTwoObject bone_eyeBallRtDn loc_eyeBallRtRootJt

    AlignTwoObject ctrl_eyeBallLfCtrl loc_eyeBallLfCtrl

    AlignTwoObject bone_eyeBallLfUP loc_eyeBallLfRootJt
    AlignTwoObject bone_eyeBallLfMid loc_eyeBallLfRootJt
    AlignTwoObject bone_eyeBallLfDn loc_eyeBallLfRootJt

     -- Parent and Constraint Relevance-------
    ctrl_eyeBallRtCtrl.parent = ctrl_eyeBallMidCtrl
    ctrl_eyeBallLfCtrl.parent = ctrl_eyeBallMidCtrl

    bone_eyeBallRtUP.parent = jt_head
    bone_eyeBallRtMid.parent = jt_head
    bone_eyeBallRtDn.parent = jt_head

    bone_eyeBallLfUP.parent = jt_head
    bone_eyeBallLfMid.parent = jt_head
    bone_eyeBallLfDn.parent = jt_head
   
     -- Init Controllers and bones-------
    FreezeTransform ctrl_eyeBallRtCtrl
    FreezeTransform bone_eyeBallRtUP
    FreezeTransform bone_eyeBallRtMid
    FreezeTransform bone_eyeBallRtDn
    FreezeTransform ctrl_eyeBallLfCtrl
    FreezeTransform bone_eyeBallLfUP
    FreezeTransform bone_eyeBallLfMid
    FreezeTransform bone_eyeBallLfDn

    -- Script Variables
    ctrlVarEyeballRt = #()
    append ctrlVarEyeballRt ctrl_eyeBallRtCtrl
    append ctrlVarEyeballRt ctrl_eyeBallMidCtrl

    -- Assign script-------
    ScriptContent ="(degToRad((" + ctrlVarEyeballRt[1].name + ".controller[1][2].value)[2] +(" + ctrlVarEyeballRt[2].name + ".controller[1][2].value)[3]))"

    -- Assign Script to Controller
    AssignOneAxisFloatScriptRotationController bone_eyeBallRtUP ctrlVarEyeballRt "Z" ScriptContent
    AssignOneAxisFloatScriptRotationController bone_eyeBallRtMid ctrlVarEyeballRt "Z" ScriptContent
    AssignOneAxisFloatScriptRotationController bone_eyeBallRtDn ctrlVarEyeballRt "Z" ScriptContent

    -- Assign script-------
    ScriptContent ="(degToRad((" + ctrlVarEyeballRt[1].name + ".controller[1][2].value)[1] +(" + ctrlVarEyeballRt[2].name + ".controller[1][2].value)[1]))"

    -- Assign Script to Controller
    AssignOneAxisFloatScriptRotationController bone_eyeBallRtUP ctrlVarEyeballRt "Y" ScriptContent
    AssignOneAxisFloatScriptRotationController bone_eyeBallRtMid ctrlVarEyeballRt "Y" ScriptContent
    AssignOneAxisFloatScriptRotationController bone_eyeBallRtDn ctrlVarEyeballRt "Y" ScriptContent

    -- Script Variables
    ctrlVarEyeballLf = #()
    append ctrlVarEyeballLf ctrl_eyeBallLfCtrl
    append ctrlVarEyeballLf ctrl_eyeBallMidCtrl

    -- Assign script-------
    ScriptContent ="(degToRad((" + ctrlVarEyeballLf[1].name + ".controller[1][2].value)[2] +(" + ctrlVarEyeballLf[2].name + ".controller[1][2].value)[3]))"

    -- Assign Script to Controller
    AssignOneAxisFloatScriptRotationController bone_eyeBallLfUP ctrlVarEyeballLf "Z" ScriptContent
    AssignOneAxisFloatScriptRotationController bone_eyeBallLfMid ctrlVarEyeballLf "Z" ScriptContent
    AssignOneAxisFloatScriptRotationController bone_eyeBallLfDn ctrlVarEyeballLf "Z" ScriptContent

    -- Assign script-------
    ScriptContent ="(degToRad((" + ctrlVarEyeballLf[1].name + ".controller[1][2].value)[1] +(" + ctrlVarEyeballLf[2].name + ".controller[1][2].value)[1]))"

    -- Assign Script to Controller
    AssignOneAxisFloatScriptRotationController bone_eyeBallLfUP ctrlVarEyeballLf "Y" ScriptContent
    AssignOneAxisFloatScriptRotationController bone_eyeBallLfMid ctrlVarEyeballLf "Y" ScriptContent
    AssignOneAxisFloatScriptRotationController bone_eyeBallLfDn ctrlVarEyeballLf "Y" ScriptContent

    -------  Part -------
)

fn FaceMouthPart jt_head mainCtrl = (
    ------- MouthLip Part -------

    -- Get Jt Locator -------
    loc_MouthLipUpJtIN = FindLocator "Loc_LipRtUpJt001"
    loc_MouthLipUpJtMid = FindLocator "Loc_LipMidUpJt"
    loc_MouthLipUpJtOut = FindLocator "Loc_LipLfUpJt002"

    loc_MouthLipDnJtIN = FindLocator "Loc_LipRtDnJt001"
    loc_MouthLipDnJtMid = FindLocator "Loc_LipMidDnJt"
    loc_MouthLipDnJtOut = FindLocator "Loc_LipLfDnJt002"

    -- Get Ctrl Locator -------
    loc_LipRegionUpCtrl = FindLocator "Loc_LipRegionCtrl001"
    loc_LipRegionDnCtrl = FindLocator "Loc_LipRegionCtrl002"
    loc_SmLipRtCtrl = FindLocator "Loc_SmLipRtCtrl"
    loc_SmLipLfCtrl = FindLocator "Loc_SmLipLfCtrl"
    
    -- Create Controller
    ctrl_LipRegionUp = AddCricle loc_LipRegionUpCtrl 0.5 blue
    ctrl_LipRegionDn = AddCricle loc_LipRegionDnCtrl 0.5 blue
    ctrl_SmLipRt = AddCricle loc_SmLipRtCtrl 0.5 blue
    ctrl_SmLipLf = AddCricle loc_SmLipLfCtrl 0.5 blue

    -- Create Bones
    bone_MouthLipUpJtIN = AddBone loc_MouthLipUpJtIN [0, 0, 0] [0, 2, 0]
    bone_MouthLipUpJtMid = AddBone loc_MouthLipUpJtMid [0, 0, 0] [0, 2, 0]
    bone_MouthLipUpJtOut = AddBone loc_MouthLipUpJtOut [0, 0, 0] [0, 2, 0]

    bone_MouthLipDnJtIN = AddBone loc_MouthLipDnJtIN [0, 0, 0] [0, 2, 0]
    bone_MouthLipDnJtMid = AddBone loc_MouthLipDnJtMid [0, 0, 0] [0, 2, 0]
    bone_MouthLipDnJtOut = AddBone loc_MouthLipDnJtOut [0, 0, 0] [0, 2, 0]

    -- Align the objects to the locator
    AlignTwoObject ctrl_LipRegionUp loc_LipRegionUpCtrl
    AlignTwoObject ctrl_LipRegionDn loc_LipRegionDnCtrl
    AlignTwoObject ctrl_SmLipRt loc_SmLipRtCtrl
    AlignTwoObject ctrl_SmLipLf loc_SmLipLfCtrl

    AlignTwoObject bone_MouthLipUpJtIN loc_MouthLipUpJtIN
    AlignTwoObject bone_MouthLipUpJtMid loc_MouthLipUpJtMid
    AlignTwoObject bone_MouthLipUpJtOut loc_MouthLipUpJtOut

    AlignTwoObject bone_MouthLipDnJtIN loc_MouthLipDnJtIN
    AlignTwoObject bone_MouthLipDnJtMid loc_MouthLipDnJtMid
    AlignTwoObject bone_MouthLipDnJtOut loc_MouthLipDnJtOut

    -- Parent and Constraint Relevance
    ctrl_LipRegionUp.parent = mainCtrl
    ctrl_LipRegionDn.parent = mainCtrl
    ctrl_SmLipRt.parent = mainCtrl
    ctrl_SmLipLf.parent = mainCtrl

    bone_MouthLipUpJtIN.parent = jt_head
    bone_MouthLipUpJtMid.parent = jt_head
    bone_MouthLipUpJtOut.parent = jt_head

    bone_MouthLipDnJtIN.parent = jt_head
    bone_MouthLipDnJtMid.parent = jt_head
    bone_MouthLipDnJtOut.parent = jt_head

    -- Init Controllers and bones
    FreezeTransform ctrl_LipRegionUp
    FreezeTransform ctrl_LipRegionDn
    FreezeTransform ctrl_SmLipRt
    FreezeTransform ctrl_SmLipLf

    FreezeTransform bone_MouthLipUpJtIN
    FreezeTransform bone_MouthLipUpJtMid
    FreezeTransform bone_MouthLipUpJtOut

    FreezeTransform bone_MouthLipDnJtIN
    FreezeTransform bone_MouthLipDnJtMid
    FreezeTransform bone_MouthLipDnJtOut

    -- Script Variables
    ctrlVarMouthLip = #()
    append ctrlVarMouthLip ctrl_LipRegionUp
    append ctrlVarMouthLip ctrl_LipRegionDn
    append ctrlVarMouthLip ctrl_SmLipRt
    append ctrlVarMouthLip ctrl_SmLipLf

    -- bone_MouthLipDnJtIN.parent = jt_head
    -- bone_MouthLipDnJtMid.parent = jt_head
    -- bone_MouthLipDnJtOut.parent = jt_head

    -- 右上嘴角左右
    scriptContent = "(" + ctrlVarMouthLip[3].name + ".controller[1][2].value)[1] * 0.4"
    -- Assign Script to Controller
    AssignOneAxisFloatScriptPositionController bone_MouthLipUpJtIN ctrlVarMouthLip "Z" scriptContent

    -- 右下嘴角左右
    scriptContent = "(" + ctrlVarMouthLip[3].name + ".controller[1][2].value)[1] * 0.4"
    -- Assign Script to Controller
    AssignOneAxisFloatScriptPositionController bone_MouthLipDnJtIN ctrlVarMouthLip "Z" scriptContent

    -- 右上嘴角前后
    scriptContent = "(" + ctrlVarMouthLip[2].name + ".controller[1][2].value)[3] * 0.08"
    -- Assign Script to Controller
    AssignOneAxisFloatScriptPositionController bone_MouthLipUpJtIN ctrlVarMouthLip "Y" scriptContent

    -- 右下嘴角前后
    scriptContent = "(" + ctrlVarMouthLip[2].name + ".controller[1][2].value)[3] * 0.08"
    -- Assign Script to Controller
    AssignOneAxisFloatScriptPositionController bone_MouthLipDnJtIN ctrlVarMouthLip "Y" scriptContent

    -- 右上嘴角上下
    scriptContent = "if((" + ctrlVarMouthLip[1].name + ".controller[1][2].value)[3] > 0) then (("+ ctrlVarMouthLip[2].name + ".controller[1][2].value)[3] * 0.1 + (" + ctrlVarMouthLip[1].name + ".controller[1][2].value)[3] * 0.2) else (0)"
    -- Assign Script to Controller
    AssignOneAxisFloatScriptPositionController bone_MouthLipUpJtIN ctrlVarMouthLip "X" scriptContent

    -- 右下嘴角上下
    scriptContent = "if((" + ctrlVarMouthLip[1].name + ".controller[1][2].value)[3] > 0) then (("+ ctrlVarMouthLip[2].name + ".controller[1][2].value)[3] * 0.1 + (" + ctrlVarMouthLip[1].name + ".controller[1][2].value)[3] * 0.2) else (0)"
    -- Assign Script to Controller
    AssignOneAxisFloatScriptPositionController bone_MouthLipDnJtIN ctrlVarMouthLip "X" scriptContent



    -- 左上嘴角左右
    scriptContent = "(" + ctrlVarMouthLip[4].name + ".controller[1][2].value)[1] * 0.4"
    -- Assign Script to Controller
    AssignOneAxisFloatScriptPositionController bone_MouthLipUpJtOut ctrlVarMouthLip "Z" scriptContent

    -- 左下嘴角左右
    scriptContent = "(" + ctrlVarMouthLip[4].name + ".controller[1][2].value)[1] * 0.4"
    -- Assign Script to Controller
    AssignOneAxisFloatScriptPositionController bone_MouthLipDnJtOut ctrlVarMouthLip "Z" scriptContent


    -- 左上嘴角前后
    scriptContent = "(" + ctrlVarMouthLip[2].name + ".controller[1][2].value)[3] * 0.08"
    -- Assign Script to Controller
    AssignOneAxisFloatScriptPositionController bone_MouthLipUpJtOut ctrlVarMouthLip "Y" scriptContent

    -- 左下嘴角前后
    scriptContent = "(" + ctrlVarMouthLip[2].name + ".controller[1][2].value)[3] * 0.08"
    -- Assign Script to Controller
    AssignOneAxisFloatScriptPositionController bone_MouthLipDnJtOut ctrlVarMouthLip "Y" scriptContent

    -- 左上嘴角上下
    scriptContent = "if((" + ctrlVarMouthLip[1].name + ".controller[1][2].value)[3] > 0) then (("+ ctrlVarMouthLip[2].name + ".controller[1][2].value)[3] * 0.1 + (" + ctrlVarMouthLip[1].name + ".controller[1][2].value)[3] * 0.2) else (0)"
    -- Assign Script to Controller
    AssignOneAxisFloatScriptPositionController bone_MouthLipUpJtOut ctrlVarMouthLip "X" scriptContent

    -- 左下嘴角上下
    scriptContent = "if((" + ctrlVarMouthLip[1].name + ".controller[1][2].value)[3] > 0) then (("+ ctrlVarMouthLip[2].name + ".controller[1][2].value)[3] * 0.1 + (" + ctrlVarMouthLip[1].name + ".controller[1][2].value)[3] * 0.2) else (0)"
    -- Assign Script to Controller
    AssignOneAxisFloatScriptPositionController bone_MouthLipDnJtOut ctrlVarMouthLip "X" scriptContent



    -- 中上嘴角前后
    scriptContent = "(" + ctrlVarMouthLip[2].name + ".controller[1][2].value)[3] * 0.08"
    -- Assign Script to Controller
    AssignOneAxisFloatScriptPositionController bone_MouthLipUpJtMid ctrlVarMouthLip "Y" scriptContent

    -- 中下嘴角前后
    scriptContent = "(" + ctrlVarMouthLip[2].name + ".controller[1][2].value)[3] * 0.08"
    -- Assign Script to Controller
    AssignOneAxisFloatScriptPositionController bone_MouthLipDnJtMid ctrlVarMouthLip "Y" scriptContent

    -- 中上嘴角上下
    scriptContent = "if((" + ctrlVarMouthLip[1].name + ".controller[1][2].value)[3] > 0) then (("+ ctrlVarMouthLip[2].name + ".controller[1][2].value)[3] * 0.1 + (" + ctrlVarMouthLip[1].name + ".controller[1][2].value)[3] * 0.2) else (0)"
    -- Assign Script to Controller
    AssignOneAxisFloatScriptPositionController bone_MouthLipUpJtMid ctrlVarMouthLip "X" scriptContent

    -- 中下嘴角上下
    scriptContent = "if((" + ctrlVarMouthLip[1].name + ".controller[1][2].value)[3] > 0) then (("+ ctrlVarMouthLip[2].name + ".controller[1][2].value)[3] * 0.1 + (" + ctrlVarMouthLip[1].name + ".controller[1][2].value)[3] * 0.2) else (0)"
    -- Assign Script to Controller
    AssignOneAxisFloatScriptPositionController bone_MouthLipDnJtMid ctrlVarMouthLip "X" scriptContent


    ------- End MouthLip Part --------



)

fn FaceCheekPart jt_head mainCtrl = (
    ------- FceCheek Part -------
    -- Get JtLocator -------
    loc_CheekRtJt = FindLocator "Loc_CheekRtJt"
    loc_CheekLfJt = FindLocator "Loc_CheekLfJt"

    loc_NosetrilRtJt = FindLocator "Loc_NosetrilRtJt"
    loc_NosetrilLfJt = FindLocator "Loc_NosetrilLfJt"

    loc_CheekRaiserRtJtIn = FindLocator "Loc_CheekRaiserRtJt001"
    loc_CheekRaiserRtJtOut = FindLocator "Loc_CheekRaiserRtJt002"

    loc_CheekRaiserLfJtIn = FindLocator "Loc_CheekRaiserLfJt001"
    loc_CheekRaiserLfJtOut = FindLocator "Loc_CheekRaiserLfJt002"

    -- Get CtrlLocator -------
    loc_SmLipRtCtrl = FindLocator "Loc_SmLipRtCtrl"
    loc_SmLipLfCtrl = FindLocator "Loc_SmLipLfCtrl"
    loc_NosetrilRtCtrl = FindLocator "Loc_NosetrilRtCtrl"
    loc_NosetrilLfCtrl = FindLocator "Loc_NosetrilLfCtrl"

    -- Create Controller
    -- ctrl_SmLipRtCtrl = AddCricle loc_SmLipRtCtrl 0.5 blue
    -- ctrl_SmLipLfCtrl =  AddCricle loc_SmLipLfCtrl 0.5 blue
    ctrl_SmLipRtCtrl = getNodeByName("Ctrl_SmLipRt")
    ctrl_SmLipLfCtrl = getNodeByName("Ctrl_SmLipLf")
    ctrl_NosetrilRtCtrl =  AddCricle loc_NosetrilRtCtrl 0.5 blue
    ctrl_NosetrilLfCtrl =  AddCricle loc_NosetrilLfCtrl 0.5 blue


    -- Create Bones
    bone_CheekRtJt = AddBone loc_CheekRtJt [0, 0, 0] [0, 2, 0]
    bone_CheekLfJt = AddBone loc_CheekLfJt [0, 0, 0] [0, 2, 0]

    bone_NosetrilRtJt = AddBone loc_NosetrilRtJt [0, 0, 0] [0, 2, 0]
    bone_NosetrilLfJt = AddBone loc_NosetrilLfJt [0, 0, 0] [0, 2, 0]

    bone_CheekRaiserRtJtIn = AddBone loc_CheekRaiserRtJtIn [0, 0, 0] [0, 2, 0]
    bone_CheekRaiserRtJtOut = AddBone loc_CheekRaiserRtJtOut [0, 0, 0] [0, 2, 0]

    bone_CheekRaiserLfJtIn =  AddBone loc_CheekRaiserLfJtIn [0, 0, 0] [0, 2, 0]
    bone_CheekRaiserLfJtOut = AddBone loc_CheekRaiserLfJtOut [0, 0, 0] [0, 2, 0]

    -- Align the objects to the locator
    AlignTwoObject ctrl_SmLipRtCtrl loc_SmLipRtCtrl
    AlignTwoObject ctrl_SmLipLfCtrl loc_SmLipLfCtrl
    AlignTwoObject ctrl_NosetrilRtCtrl loc_NosetrilRtCtrl
    AlignTwoObject ctrl_NosetrilLfCtrl loc_NosetrilLfCtrl

    AlignTwoObject bone_CheekRtJt loc_CheekRtJt
    AlignTwoObject bone_CheekLfJt loc_CheekLfJt
    AlignTwoObject bone_NosetrilRtJt loc_NosetrilRtJt
    AlignTwoObject bone_NosetrilLfJt loc_NosetrilLfJt

    AlignTwoObject bone_CheekRaiserRtJtIn loc_CheekRaiserRtJtIn
    AlignTwoObject bone_CheekRaiserRtJtOut loc_CheekRaiserRtJtOut
    AlignTwoObject bone_CheekRaiserLfJtIn loc_CheekRaiserLfJtIn
    AlignTwoObject bone_CheekRaiserLfJtOut loc_CheekRaiserLfJtOut

    -- Parent and Constraint Relevance
    ctrl_SmLipRtCtrl.parent = mainCtrl
    ctrl_SmLipLfCtrl.parent = mainCtrl
    ctrl_NosetrilRtCtrl.parent = mainCtrl
    ctrl_NosetrilLfCtrl.parent = mainCtrl

    bone_CheekRtJt.parent = jt_head
    bone_CheekLfJt.parent = jt_head
    bone_NosetrilRtJt.parent = jt_head
    bone_NosetrilLfJt.parent = jt_head
    bone_CheekRaiserRtJtIn.parent = jt_head
    bone_CheekRaiserRtJtOut.parent = jt_head
    bone_CheekRaiserLfJtIn.parent = jt_head
    bone_CheekRaiserLfJtOut.parent = jt_head

    -- Init Controllers and bones
    FreezeTransform ctrl_SmLipRtCtrl
    FreezeTransform ctrl_SmLipLfCtrl
    FreezeTransform ctrl_NosetrilRtCtrl
    FreezeTransform ctrl_NosetrilLfCtrl

    FreezeTransform bone_CheekRtJt
    FreezeTransform bone_CheekLfJt
    FreezeTransform bone_NosetrilRtJt
    FreezeTransform bone_NosetrilLfJt

    FreezeTransform bone_CheekRaiserRtJtIn
    FreezeTransform bone_CheekRaiserRtJtOut
    FreezeTransform bone_CheekRaiserLfJtIn
    FreezeTransform bone_CheekRaiserLfJtOut

    -- Script Variables
    ctrlVarCheek = #()
    append ctrlVarCheek ctrl_SmLipRtCtrl
    append ctrlVarCheek ctrl_NosetrilRtCtrl
    append ctrlVarCheek ctrl_SmLipLfCtrl
    append ctrlVarCheek ctrl_NosetrilLfCtrl

    -- Cheek --
    -- Assign script
    PosScriptContent = "[(" + ctrlVarCheek[1].name + ".controller[1][2].value)[3] * 0.3 + (" + ctrlVarCheek[2].name + ".controller[1][2].value)[3] * 0.3, -(" + ctrlVarCheek[1].name + ".controller[1][2].value)[2] * 0.3 - (" + ctrlVarCheek[2].name + ".controller[1][2].value)[2] * 0.3, (" + ctrlVarCheek[1].name + ".controller[1][2].value)[1] * 0.3 + (" + ctrlVarCheek[2].name + ".controller[1][2].value)[1] * 0.3]"
    -- Assign Script to Controller
    AssignPositionScriptController bone_CheekRtJt ctrlVarCheek PosScriptContent

    -- Assign script
    PosScriptContent = "[(" + ctrlVarCheek[3].name + ".controller[1][2].value)[3] * 0.3 + (" + ctrlVarCheek[4].name + ".controller[1][2].value)[3] * 0.3, -(" + ctrlVarCheek[3].name + ".controller[1][2].value)[2] * 0.3 - (" + ctrlVarCheek[4].name + ".controller[1][2].value)[2] * 0.3, (" + ctrlVarCheek[3].name + ".controller[1][2].value)[1] * 0.3 + (" + ctrlVarCheek[4].name + ".controller[1][2].value)[1] * 0.3]"
    -- Assign Script to Controller
    AssignPositionScriptController bone_CheekLfJt ctrlVarCheek PosScriptContent
    -- End Cheek --

    -- Nose --
    -- Assign script
    PosScriptContent = "[(" + ctrlVarCheek[1].name + ".controller[1][2].value)[3] * 0.3 + (" + ctrlVarCheek[2].name + ".controller[1][2].value)[3] * 0.3, -(" + ctrlVarCheek[1].name + ".controller[1][2].value)[2] * 0.3 - (" + ctrlVarCheek[2].name + ".controller[1][2].value)[2] * 0.3, (" + ctrlVarCheek[1].name + ".controller[1][2].value)[1] * 0.3 + (" + ctrlVarCheek[2].name + ".controller[1][2].value)[1] * 0.3]"
    -- Assign Script to Controller
    AssignPositionScriptController bone_NosetrilRtJt ctrlVarCheek PosScriptContent

    PosScriptContent = "[(" + ctrlVarCheek[3].name + ".controller[1][2].value)[3] * 0.3 + (" + ctrlVarCheek[4].name + ".controller[1][2].value)[3] * 0.3, -(" + ctrlVarCheek[3].name + ".controller[1][2].value)[2] * 0.3 - (" + ctrlVarCheek[4].name + ".controller[1][2].value)[2] * 0.3, (" + ctrlVarCheek[3].name + ".controller[1][2].value)[1] * 0.3 + (" + ctrlVarCheek[4].name + ".controller[1][2].value)[1] * 0.3]"
    -- Assign Script to Controller
    AssignPositionScriptController bone_NosetrilLfJt ctrlVarCheek PosScriptContent
    -- End Nose --

    -- Eyelid -- 
    -- Assign script
    PosScriptContent = "[(" + ctrlVarCheek[2].name + ".controller[1][2].value)[3] * 0.3, -(" + ctrlVarCheek[2].name + ".controller[1][2].value)[2] * 0.3, (" + ctrlVarCheek[2].name + ".controller[1][2].value)[1] * 0.3]"
    -- Assign Script to Controller
    AssignPositionScriptController bone_CheekRaiserRtJtIn ctrlVarCheek PosScriptContent

    -- Assign script
    PosScriptContent = "[(" + ctrlVarCheek[2].name + ".controller[1][2].value)[3] * 0.3, -(" + ctrlVarCheek[2].name + ".controller[1][2].value)[2] * 0.3, (" + ctrlVarCheek[2].name + ".controller[1][2].value)[1] * 0.3]"
    -- Assign Script to Controller
    AssignPositionScriptController bone_CheekRaiserRtJtOut ctrlVarCheek PosScriptContent

    -- Assign script
    PosScriptContent = "[(" + ctrlVarCheek[4].name + ".controller[1][2].value)[3] * 0.3, -(" + ctrlVarCheek[4].name + ".controller[1][2].value)[2] * 0.3, (" + ctrlVarCheek[4].name + ".controller[1][2].value)[1] * 0.3]"
    -- Assign Script to Controller
    AssignPositionScriptController bone_CheekRaiserLfJtIn ctrlVarCheek PosScriptContent

    -- Assign script
    PosScriptContent = "[(" + ctrlVarCheek[4].name + ".controller[1][2].value)[3] * 0.3, -(" + ctrlVarCheek[4].name + ".controller[1][2].value)[2] * 0.3, (" + ctrlVarCheek[4].name + ".controller[1][2].value)[1] * 0.3]"
    -- Assign Script to Controller
    AssignPositionScriptController bone_CheekRaiserLfJtOut ctrlVarCheek PosScriptContent






    ------- End FaceCheek Part --------


)

fn FaceJawPart jt_head mainCtrl = (
    ------- Jaw Part -------

    -- Get Jt Locator -------
    loc_JawRootJt = FindLocator "Loc_JawRootJt"

    -- Get Ctrl Locator -------
    loc_LipRegionDnCtrl = FindLocator "Loc_LipRegionCtrl002"

    -- Create Controller
    -- ctrl_LipRegionDn = AddCricle loc_LipRegionDnCtrl 0.5 blue
    ctrl_LipRegionDn = getNodeByName("Ctrl_LipRegion002")

    -- Create Bones
    bone_JawRoot = AddBone loc_JawRootJt [0, 5.5, 0] [0, 0, -6.5] BoneEnd:true

    -- Align the objects to the locator
    -- AlignTwoObject ctrl_LipRegionDn loc_LipRegionDnCtrl
    AlignTwoObject bone_JawRoot loc_JawRootJt

    -- Parent and Constraint Relevance
    -- ctrl_LipRegionDn.parent = mainCtrl
    bone_JawRoot.parent = jt_head

    -- Init Controllers and bones
    -- FreezeTransform ctrl_LipRegionDn
    FreezeTransform bone_JawRoot

    -- Script Variables
    ctrlVarJaw = #()
    append ctrlVarJaw ctrl_LipRegionDn

    scriptContent = "(" + ctrlVarJaw[1].name + ".controller[1][2].value)[3] * 0.08"
    -- Assign Script to Controller
    AssignOneAxisFloatScriptRotationController bone_JawRoot ctrlVarJaw "Y" scriptContent

    ------- End Jaw Part -------
)
fn FaceSystem = (
    -- Beginning About Bone Head and MainCtrl --

    jt_head = getNodeByName "b_Head"
    -- print jt_head.transform.pos
    dummy_jt_head = AddDummy "Dummy_BipHead" [3, 3, 3]
    -- AlignTwoObject dummy_jt_head jt_head
    dummy_jt_head.pos = jt_head.transform.pos
    dummy_jt_head.parent = jt_head
    mainCtrl = AddPoint "Ctrl_Main" 1.5 yellow
    mainCtrl.pos = [0, 0, 180]

    TwoObjControllerRelation mainCtrl dummy_jt_head

    FaceEyeBallPart jt_head mainCtrl
    FaceEyeLipPart jt_head mainCtrl
    FaceEyeBrowPart jt_head mainCtrl
    FaceMouthPart jt_head mainCtrl
    FaceCheekPart jt_head mainCtrl
    FaceJawPart jt_head mainCtrl

)
rollout allControls "C1 Facial Rigging System v1.0"(

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

fn Main = (
    ------Call UI--------
    MainGUI()
)

Main()
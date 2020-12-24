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
	obj1.rotation = obj2.rotation
	obj1.pos = obj2.pos
)


fn AddCricle cirName cirRadius cirColor = (  
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

fn AddRectangle RectangleName RectangleLenght RectangleWidth RectangleColor = (  
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
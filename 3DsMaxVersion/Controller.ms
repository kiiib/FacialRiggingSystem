
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
fn AddCricle cirName cirRadius cirColor = (  
    cir = circle radius:cirRadius name:cirName wireColor:cirColor
    return cir
)
fn CreateController = (

    -- Shape Part
    cir = AddCricle "Circleabc" 20 [0, 0, 150]
    -- cir.name = "Circleabc"
    
    -- Convert to Editable Spline
    
    -- Name

    -- Color

    -- Axis
    cir.rotation.x_rotation=90
    RotatePivot cir 90 0 -90
    
)

CreateController()
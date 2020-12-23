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


-- Assign Rotation Script function

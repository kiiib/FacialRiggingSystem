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

fn AssignOneAxisFloatScriptRotationController bone ctrl axis scriptContent=
(
    axisNumber = GetAxisArrayNumber axis
    bone.rotation.controller[axisNumber].controller = float_script()
    assignConrollerAxis =  bone.rotation.controller[axisNumber].controller
    -- Add Variable
    assignConrollerAxis.addNode ctrl.name ctrl
    -- Assign Script Content
    assignConrollerAxis.script = scriptContent
)
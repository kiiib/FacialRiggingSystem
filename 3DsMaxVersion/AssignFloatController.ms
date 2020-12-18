selection[1].rotation.controller[2].controller = float_script()
ctrl = selection[1].rotation.controller[2].controller
obj = getNodeByName "Rectangle003"
-- ctrl2 =  obj
ctrl.addNode "ABC" 
-- str = "degTorad((ABC.controller[1][2].value)[3])"
ctrl.script = str

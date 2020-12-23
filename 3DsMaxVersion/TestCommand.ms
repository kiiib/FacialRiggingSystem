
if classof selection[1].Position.controller != Position_layer do
(
    selection[1].position.controller = Bezier_Position()
    selection[1].position.controller = position_list()
    selection[1].position.controller.available.controller = Position_XYZ()

    selection[1].position.controller.setname 1 "Frozen Position"
    selection[1].position.controller.setname 2 "Zero Pos XYZ"
    selection[1].position.controller.SetActive 2

    selection[1].position.controller[2].x_Position = 0
    selection[1].position.controller[2].y_Position = 0
    selection[1].position.controller[2].z_Position = 0
)

if classof selection[1].rotation.controller != Rotation_Layer do
(
    selection[1].rotation.controller = Euler_XYZ()
    selection[1].rotation.controller = Rotation_list()
    selection[1].rotation.controller.available.controller = Euler_XYZ()

    selection[1].rotation.controller.setname 1 "Inital Pose"
    selection[1].rotation.controller.setname 2 "Keyframe XYZ"

    selection[1].rotation.controller.SetActive 2
)
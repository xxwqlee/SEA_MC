!
!-------------------------- Default Units for Model ---------------------------!
!
!
defaults units  &
   length = meter  &
   angle = rad  &
   force = newton  &
   mass = kg  &
   time = sec
!
defaults units  &
   coordinate_system_type = cartesian  &
   orientation_type = body313
!
!--------------------------- Model Specific Colors ----------------------------!
!
!
if condition = (! db_exists(".colors.COLOR_R202G209B237"))
!
color create  &
   color_name = .colors.COLOR_R202G209B237  &
   red_component = 0.7921568627  &
   blue_component = 0.9333333333  &
   green_component = 0.8196078431
!
else 
!
color modify  &
   color_name = .colors.COLOR_R202G209B237  &
   red_component = 0.7921568627  &
   blue_component = 0.9333333333  &
   green_component = 0.8196078431
!
end 
!
if condition = (! db_exists(".colors.COLOR_R255G238B034"))
!
color create  &
   color_name = .colors.COLOR_R255G238B034  &
   red_component = 1.0  &
   blue_component = 0.137254902  &
   green_component = 0.937254902
!
else 
!
color modify  &
   color_name = .colors.COLOR_R255G238B034  &
   red_component = 1.0  &
   blue_component = 0.137254902  &
   green_component = 0.937254902
!
end 
!
if condition = (! db_exists(".colors.COLOR_R168G167B255"))
!
color create  &
   color_name = .colors.COLOR_R168G167B255  &
   red_component = 0.6588235294  &
   blue_component = 1.0  &
   green_component = 0.6549019608
!
else 
!
color modify  &
   color_name = .colors.COLOR_R168G167B255  &
   red_component = 0.6588235294  &
   blue_component = 1.0  &
   green_component = 0.6549019608
!
end 
!
if condition = (! db_exists(".colors.COLOR_R072G169B084"))
!
color create  &
   color_name = .colors.COLOR_R072G169B084  &
   red_component = 0.2862745098  &
   blue_component = 0.3294117647  &
   green_component = 0.662745098
!
else 
!
color modify  &
   color_name = .colors.COLOR_R072G169B084  &
   red_component = 0.2862745098  &
   blue_component = 0.3294117647  &
   green_component = 0.662745098
!
end 
!
!------------------------ Default Attributes for Model ------------------------!
!
!
defaults attributes  &
   inheritance = bottom_up  &
   icon_visibility = on  &
   grid_visibility = off  &
   size_of_icons = 5.0E-002  &
   spacing_for_grid = 1.0
!
!--------------------------- Plugins used by Model ----------------------------!
!
!
plugin load  &
   plugin_name = .MDI.plugins.controls
!
!------------------------------ Adams/View Model ------------------------------!
!
!
model create  &
   model_name = MODEL_SEA20
!
view erase
!
!-------------------------------- Data storage --------------------------------!
!
!
data_element create variable  &
   variable_name = .MODEL_SEA20.Q1  &
   adams_id = 1  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_SEA20.q1_Q1  &
   adams_id = 2  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_SEA20.Q2  &
   adams_id = 3  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_SEA20.q2_Q2  &
   adams_id = 4  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_SEA20.T1  &
   adams_id = 5  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_SEA20.T2  &
   adams_id = 6  &
   function = ""
!
!-------------------------------- Rigid Parts ---------------------------------!
!
! Create parts and their dependent markers and graphics
!
!----------------------------------- ground -----------------------------------!
!
!
! ****** Ground Part ******
!
defaults model  &
   part_name = ground
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_SEA20.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_SEA20.ground.MARKER_1  &
   adams_id = 1  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_SEA20.ground.MARKER_26  &
   adams_id = 26  &
   location = 0.0, -2.5E-002, 0.255  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
!------------------------------------ base ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_SEA20.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_SEA20.base  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_SEA20.base
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_SEA20.base.PSMAR  &
   adams_id = 29  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_SEA20.base.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_SEA20.base.MARKER_2  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_SEA20.base.MARKER_3  &
   adams_id = 3  &
   location = 0.0, -2.5E-002, 0.255  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
marker create  &
   marker_name = .MODEL_SEA20.base.MARKER_15  &
   adams_id = 15  &
   location = 0.0, -2.5E-002, 0.255  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .MODEL_SEA20.base  &
   color = COLOR_R202G209B237
!
!----------------------------------- motor1 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_SEA20.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_SEA20.motor1  &
   adams_id = 3  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_SEA20.motor1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_SEA20.motor1.PSMAR  &
   adams_id = 30  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_SEA20.motor1.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_SEA20.motor1.MARKER_4  &
   adams_id = 4  &
   location = 0.0, -2.5E-002, 0.255  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
marker create  &
   marker_name = .MODEL_SEA20.motor1.MARKER_8  &
   adams_id = 8  &
   location = 0.0, 2.5E-002, 0.255  &
   orientation = 3.1415508284, 1.5707904131, 0.0
!
marker create  &
   marker_name = .MODEL_SEA20.motor1.MARKER_16  &
   adams_id = 16  &
   location = 0.0, -2.5E-002, 0.255  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
marker create  &
   marker_name = .MODEL_SEA20.motor1.MARKER_23  &
   adams_id = 23  &
   location = 0.0, 2.5E-002, 0.255  &
   orientation = 3.1415508284, 1.5707904131, 0.0
!
marker create  &
   marker_name = .MODEL_SEA20.motor1.MARKER_25  &
   adams_id = 25  &
   location = 0.0, -2.5E-002, 0.255  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
marker create  &
   marker_name = .MODEL_SEA20.motor1.MARKER_41  &
   adams_id = 41  &
   location = -2.6758297728E-006, 4.6000621299E-002, 0.2550038878  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
part create rigid_body mass_properties  &
   part_name = .MODEL_SEA20.motor1  &
   mass = 1.0  &
   center_of_mass_marker = .MODEL_SEA20.motor1.MARKER_4  &
   inertia_marker = .MODEL_SEA20.motor1.MARKER_4  &
   ixx = 0.1  &
   iyy = 0.1  &
   izz = 0.1377  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .MODEL_SEA20.motor1  &
   color = RED
!
!-------------------------------- SEA_Spring_1 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_SEA20.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_SEA20.SEA_Spring_1  &
   adams_id = 4  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_SEA20.SEA_Spring_1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_SEA20.SEA_Spring_1.PSMAR  &
   adams_id = 31  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_SEA20.SEA_Spring_1.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_SEA20.SEA_Spring_1.cm  &
   adams_id = 32  &
   location = -2.6758297728E-006, 4.6000621299E-002, 0.2550038878  &
   orientation = 1.5708076442, 3.0307689215, 5.3470655663E-005
!
marker create  &
   marker_name = .MODEL_SEA20.SEA_Spring_1.MARKER_5  &
   adams_id = 5  &
   location = 0.0, 5.45E-002, 0.255  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_SEA20.SEA_Spring_1.MARKER_7  &
   adams_id = 7  &
   location = 0.0, 2.5E-002, 0.255  &
   orientation = 3.1415508284, 1.5707904131, 0.0
!
marker create  &
   marker_name = .MODEL_SEA20.SEA_Spring_1.MARKER_42  &
   adams_id = 42  &
   location = -2.6758297728E-006, 4.6000621299E-002, 0.2550038878  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
part create rigid_body mass_properties  &
   part_name = .MODEL_SEA20.SEA_Spring_1  &
   density = 1000.0
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .MODEL_SEA20.SEA_Spring_1  &
   color = COLOR_R168G167B255
!
!----------------------------------- link1 ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_SEA20.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_SEA20.link1  &
   adams_id = 5  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_SEA20.link1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_SEA20.link1.PSMAR  &
   adams_id = 33  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_SEA20.link1.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_SEA20.link1.cm  &
   adams_id = 34  &
   location = -0.1109424639, 7.1640571643E-002, 0.2549999748  &
   orientation = 1.4955974769, 1.5708118472, 1.0160073892E-004
!
marker create  &
   marker_name = .MODEL_SEA20.link1.MARKER_6  &
   adams_id = 6  &
   location = 0.0, 5.45E-002, 0.255  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_SEA20.link1.MARKER_9  &
   adams_id = 9  &
   location = -0.2, 9.212620665E-002, 0.255  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
marker create  &
   marker_name = .MODEL_SEA20.link1.MARKER_19  &
   adams_id = 19  &
   location = -0.2, 7.2E-002, 0.255  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
marker create  &
   marker_name = .MODEL_SEA20.link1.MARKER_27  &
   adams_id = 27  &
   location = -0.2, 7.1E-002, 0.255  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
part create rigid_body mass_properties  &
   part_name = .MODEL_SEA20.link1  &
   density = 7850.0
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .MODEL_SEA20.link1  &
   color = COLOR_R072G169B084
!
!-------------------------------- SEA_Spring_2 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_SEA20.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_SEA20.SEA_Spring_2  &
   adams_id = 6  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_SEA20.SEA_Spring_2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_SEA20.SEA_Spring_2.PSMAR  &
   adams_id = 35  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_SEA20.SEA_Spring_2.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_SEA20.SEA_Spring_2.cm  &
   adams_id = 36  &
   location = -0.2, 0.1159998458, 0.255  &
   orientation = 1.5707963268, 2.9144216531, 0.0
!
marker create  &
   marker_name = .MODEL_SEA20.SEA_Spring_2.MARKER_12  &
   adams_id = 12  &
   location = -0.2, 9.212620665E-002, 0.255  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
marker create  &
   marker_name = .MODEL_SEA20.SEA_Spring_2.MARKER_13  &
   adams_id = 13  &
   location = -0.2, 0.1159998458, 0.255  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_SEA20.SEA_Spring_2.MARKER_22  &
   adams_id = 22  &
   location = -0.2, 0.106, 0.255  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
part create rigid_body mass_properties  &
   part_name = .MODEL_SEA20.SEA_Spring_2  &
   density = 1000.0
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .MODEL_SEA20.SEA_Spring_2  &
   color = COLOR_R168G167B255
!
!----------------------------------- motor2 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_SEA20.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_SEA20.motor2  &
   adams_id = 7  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_SEA20.motor2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_SEA20.motor2.PSMAR  &
   adams_id = 37  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_SEA20.motor2.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_SEA20.motor2.cm  &
   adams_id = 38  &
   location = -0.2, 9.212620665E-002, 0.255  &
   orientation = 0.0, 1.5707963268, 0.0
!
marker create  &
   marker_name = .MODEL_SEA20.motor2.MARKER_10  &
   adams_id = 10  &
   location = -0.2, 9.212620665E-002, 0.255  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
marker create  &
   marker_name = .MODEL_SEA20.motor2.MARKER_11  &
   adams_id = 11  &
   location = -0.2, 9.212620665E-002, 0.255  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
marker create  &
   marker_name = .MODEL_SEA20.motor2.MARKER_20  &
   adams_id = 20  &
   location = -0.2, 7.2E-002, 0.255  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
marker create  &
   marker_name = .MODEL_SEA20.motor2.MARKER_21  &
   adams_id = 21  &
   location = -0.2, 0.106, 0.255  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
marker create  &
   marker_name = .MODEL_SEA20.motor2.MARKER_28  &
   adams_id = 28  &
   location = -0.2, 0.101, 0.255  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
part create rigid_body mass_properties  &
   part_name = .MODEL_SEA20.motor2  &
   mass = 2.0  &
   center_of_mass_marker = .MODEL_SEA20.motor2.MARKER_10  &
   inertia_marker = .MODEL_SEA20.motor2.MARKER_10  &
   ixx = 0.5  &
   iyy = 0.5  &
   izz = 0.765  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .MODEL_SEA20.motor2  &
   color = COLOR_R255G238B034
!
!----------------------------------- link2 ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_SEA20.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_SEA20.link2  &
   adams_id = 8  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_SEA20.link2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_SEA20.link2.PSMAR  &
   adams_id = 39  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_SEA20.link2.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_SEA20.link2.cm  &
   adams_id = 40  &
   location = -0.3703194383, 0.1425924971, 0.2550004009  &
   orientation = 1.4932198008, 1.5707962952, 6.2831852876
!
marker create  &
   marker_name = .MODEL_SEA20.link2.MARKER_14  &
   adams_id = 14  &
   location = -0.2, 0.1159998458, 0.255  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .MODEL_SEA20.link2  &
   density = 7850.0
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .MODEL_SEA20.link2  &
   color = COLOR_R072G169B084
!
! ****** Graphics from Parasolid file ******
!
file parasolid read  &
   file_name = "Controls_Plant_FJR1.xmt_txt"  &
   model_name = .MODEL_SEA20
!
geometry attributes  &
   geometry_name = .MODEL_SEA20.base.SOLID1  &
   color = WHITE
!
geometry attributes  &
   geometry_name = .MODEL_SEA20.motor1.SOLID2  &
   color = RED
!
geometry attributes  &
   geometry_name = .MODEL_SEA20.SEA_Spring_1.SOLID3  &
   color = YELLOW
!
geometry attributes  &
   geometry_name = .MODEL_SEA20.link1.SOLID4  &
   color = GREEN
!
geometry attributes  &
   geometry_name = .MODEL_SEA20.SEA_Spring_2.SOLID5  &
   color = YELLOW
!
geometry attributes  &
   geometry_name = .MODEL_SEA20.motor2.SOLID6  &
   color = RED
!
geometry attributes  &
   geometry_name = .MODEL_SEA20.link2.SOLID7  &
   color = GREEN
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint fixed  &
   joint_name = .MODEL_SEA20.JOINT_1  &
   adams_id = 1  &
   i_marker_name = .MODEL_SEA20.ground.MARKER_1  &
   j_marker_name = .MODEL_SEA20.base.MARKER_2
!
constraint attributes  &
   constraint_name = .MODEL_SEA20.JOINT_1  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_SEA20.JOINT_2  &
   adams_id = 2  &
   i_marker_name = .MODEL_SEA20.base.MARKER_3  &
   j_marker_name = .MODEL_SEA20.motor1.MARKER_4
!
constraint attributes  &
   constraint_name = .MODEL_SEA20.JOINT_2  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_SEA20.JOINT_3  &
   adams_id = 3  &
   i_marker_name = .MODEL_SEA20.SEA_Spring_1.MARKER_5  &
   j_marker_name = .MODEL_SEA20.link1.MARKER_6
!
constraint attributes  &
   constraint_name = .MODEL_SEA20.JOINT_3  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_SEA20.JOINT_4  &
   adams_id = 4  &
   i_marker_name = .MODEL_SEA20.SEA_Spring_1.MARKER_7  &
   j_marker_name = .MODEL_SEA20.motor1.MARKER_8
!
constraint attributes  &
   constraint_name = .MODEL_SEA20.JOINT_4  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_SEA20.JOINT_5  &
   adams_id = 5  &
   i_marker_name = .MODEL_SEA20.link1.MARKER_9  &
   j_marker_name = .MODEL_SEA20.motor2.MARKER_10
!
constraint attributes  &
   constraint_name = .MODEL_SEA20.JOINT_5  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_SEA20.JOINT_6  &
   adams_id = 6  &
   i_marker_name = .MODEL_SEA20.motor2.MARKER_11  &
   j_marker_name = .MODEL_SEA20.SEA_Spring_2.MARKER_12
!
constraint attributes  &
   constraint_name = .MODEL_SEA20.JOINT_6  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_SEA20.JOINT_7  &
   adams_id = 7  &
   i_marker_name = .MODEL_SEA20.SEA_Spring_2.MARKER_13  &
   j_marker_name = .MODEL_SEA20.link2.MARKER_14
!
constraint attributes  &
   constraint_name = .MODEL_SEA20.JOINT_7  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
force create direct single_component_force  &
   single_component_force_name = .MODEL_SEA20.F1  &
   adams_id = 1  &
   type_of_freedom = rotational  &
   i_marker_name = .MODEL_SEA20.motor1.MARKER_25  &
   j_marker_name = .MODEL_SEA20.ground.MARKER_26  &
   action_only = on  &
   function = ""
!
force create direct single_component_force  &
   single_component_force_name = .MODEL_SEA20.F2  &
   adams_id = 6  &
   type_of_freedom = rotational  &
   i_marker_name = .MODEL_SEA20.link1.MARKER_27  &
   j_marker_name = .MODEL_SEA20.motor2.MARKER_28  &
   action_only = off  &
   function = ""
!
!-------------------------- Adams/View UDE Instances --------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_SEA20.ground
!
undo begin_block suppress = yes
!
ude create instance  &
   instance_name = .MODEL_SEA20.fc1  &
   definition_name = .MDI.Forces.torsion_spring  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_SEA20.Controls_Plant_FJR1  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_SEA20.fc2  &
   definition_name = .MDI.Forces.torsion_spring  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_SEA20.Tk2  &
   definition_name = .MDI.Forces.torsion_spring  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_SEA20.SEA200  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_SEA20.Controls_Plant_SEA201  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_SEA20.Controls_Plant_SEA202  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_SEA20.Controls_Plant_1  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_SEA20.Controls_Plant_SEA2001  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_SEA20.Controls_Plant_SEA1  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_SEA20.SEA001  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_SEA20.SEA1  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_SEA20.Controls_Plant_SEA0001  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_SEA20.Tk1  &
   definition_name = .MDI.Forces.torsion_spring  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_SEA20.fc1.i_marker  &
   object_value = (.MODEL_SEA20.base.MARKER_15)
!
variable modify  &
   variable_name = .MODEL_SEA20.fc1.j_marker  &
   object_value = (.MODEL_SEA20.motor1.MARKER_16)
!
variable modify  &
   variable_name = .MODEL_SEA20.fc1.stiffness_mode  &
   string_value = "none"
!
variable modify  &
   variable_name = .MODEL_SEA20.fc1.stiffness_coefficient  &
   real_value = (6.981317008E-002(newton-meter/deg))
!
variable modify  &
   variable_name = .MODEL_SEA20.fc1.stiffness_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .MODEL_SEA20.fc1.damping_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = .MODEL_SEA20.fc1.damping_coefficient  &
   real_value = (1.2(newton-meter-sec/rad))
!
variable modify  &
   variable_name = .MODEL_SEA20.fc1.damping_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .MODEL_SEA20.fc1.free_angle_mode  &
   string_value = "Design_Angle"
!
variable modify  &
   variable_name = .MODEL_SEA20.fc1.free_angle  &
   real_value = 1.0
!
variable modify  &
   variable_name = .MODEL_SEA20.fc1.preload  &
   real_value = 0.0
!
variable modify  &
   variable_name = .MODEL_SEA20.fc1.i_dynamic_visibility  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_SEA20.fc1.j_dynamic_visibility  &
   string_value = "off"
!
ude modify instance  &
   instance_name = .MODEL_SEA20.fc1
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_FJR1.input_channels  &
   object_value =   &
      .MODEL_SEA20.T1,  &
      .MODEL_SEA20.T2
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_FJR1.output_channels  &
   object_value =   &
      .MODEL_SEA20.Q1,  &
      .MODEL_SEA20.q1_Q1,  &
      .MODEL_SEA20.Q2,  &
      .MODEL_SEA20.q2_Q2
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_FJR1.file_name  &
   string_value = "Controls_Plant_FJR1"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_FJR1.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_FJR1.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_FJR1.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_FJR1.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_FJR1.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_FJR1.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_FJR1.host  &
   string_value = "Ghost_Lee.lan"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_FJR1.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_FJR1.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_FJR1.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_SEA20.Controls_Plant_FJR1
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_SEA20.fc2.i_marker  &
   object_value = (.MODEL_SEA20.link1.MARKER_19)
!
variable modify  &
   variable_name = .MODEL_SEA20.fc2.j_marker  &
   object_value = (.MODEL_SEA20.motor2.MARKER_20)
!
variable modify  &
   variable_name = .MODEL_SEA20.fc2.stiffness_mode  &
   string_value = "none"
!
variable modify  &
   variable_name = .MODEL_SEA20.fc2.stiffness_coefficient  &
   real_value = (2.2689280276E-004(newton-meter/deg))
!
variable modify  &
   variable_name = .MODEL_SEA20.fc2.stiffness_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .MODEL_SEA20.fc2.damping_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = .MODEL_SEA20.fc2.damping_coefficient  &
   real_value = (0.8(newton-meter-sec/rad))
!
variable modify  &
   variable_name = .MODEL_SEA20.fc2.damping_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .MODEL_SEA20.fc2.free_angle_mode  &
   string_value = "Design_Angle"
!
variable modify  &
   variable_name = .MODEL_SEA20.fc2.free_angle  &
   real_value = 1.0
!
variable modify  &
   variable_name = .MODEL_SEA20.fc2.preload  &
   real_value = 0.0
!
variable modify  &
   variable_name = .MODEL_SEA20.fc2.i_dynamic_visibility  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_SEA20.fc2.j_dynamic_visibility  &
   string_value = "off"
!
ude modify instance  &
   instance_name = .MODEL_SEA20.fc2
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk2.i_marker  &
   object_value = (.MODEL_SEA20.motor2.MARKER_21)
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk2.j_marker  &
   object_value = (.MODEL_SEA20.SEA_Spring_2.MARKER_22)
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk2.stiffness_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk2.stiffness_coefficient  &
   real_value = (176.11(newton-meter/rad))
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk2.stiffness_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk2.damping_mode  &
   string_value = "none"
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk2.damping_coefficient  &
   real_value = (1.6057029118E-007(newton-meter-sec/deg))
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk2.damping_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk2.free_angle_mode  &
   string_value = "Design_Angle"
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk2.free_angle  &
   real_value = 1.0
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk2.preload  &
   real_value = 0.0
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk2.i_dynamic_visibility  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk2.j_dynamic_visibility  &
   string_value = "off"
!
ude modify instance  &
   instance_name = .MODEL_SEA20.Tk2
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA200.input_channels  &
   object_value =   &
      .MODEL_SEA20.T1,  &
      .MODEL_SEA20.T2
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA200.output_channels  &
   object_value =   &
      .MODEL_SEA20.Q1,  &
      .MODEL_SEA20.q1_Q1,  &
      .MODEL_SEA20.Q2,  &
      .MODEL_SEA20.q2_Q2
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA200.file_name  &
   string_value = "Controls_Plant_SEA200"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA200.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA200.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA200.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA200.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA200.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA200.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA200.host  &
   string_value = "Ghost_Lee"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA200.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA200.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA200.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_SEA20.SEA200
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA201.input_channels  &
   object_value =   &
      .MODEL_SEA20.T1,  &
      .MODEL_SEA20.T2
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA201.output_channels  &
   object_value =   &
      .MODEL_SEA20.Q1,  &
      .MODEL_SEA20.q1_Q1,  &
      .MODEL_SEA20.Q2,  &
      .MODEL_SEA20.q2_Q2
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA201.file_name  &
   string_value = "Controls_Plant_SEA201"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA201.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA201.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA201.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA201.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA201.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA201.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA201.host  &
   string_value = "Ghost_Lee"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA201.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA201.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA201.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_SEA20.Controls_Plant_SEA201
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA202.input_channels  &
   object_value =   &
      .MODEL_SEA20.T1,  &
      .MODEL_SEA20.T2
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA202.output_channels  &
   object_value =   &
      .MODEL_SEA20.Q1,  &
      .MODEL_SEA20.q1_Q1,  &
      .MODEL_SEA20.Q2,  &
      .MODEL_SEA20.q2_Q2
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA202.file_name  &
   string_value = "Controls_Plant_SEA202"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA202.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA202.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA202.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA202.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA202.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA202.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA202.host  &
   string_value = "Ghost_Lee"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA202.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA202.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA202.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_SEA20.Controls_Plant_SEA202
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_1.input_channels  &
   object_value =   &
      .MODEL_SEA20.T1,  &
      .MODEL_SEA20.T2
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_1.output_channels  &
   object_value =   &
      .MODEL_SEA20.Q1,  &
      .MODEL_SEA20.q1_Q1,  &
      .MODEL_SEA20.Q2,  &
      .MODEL_SEA20.q2_Q2
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_1.file_name  &
   string_value = "Controls_Plant_SEA202"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_1.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_1.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_1.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_1.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_1.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_1.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_1.host  &
   string_value = "Ghost_Lee"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_1.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_1.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_1.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_SEA20.Controls_Plant_1
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA2001.input_channels  &
   object_value =   &
      .MODEL_SEA20.T1,  &
      .MODEL_SEA20.T2
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA2001.output_channels  &
   object_value =   &
      .MODEL_SEA20.Q1,  &
      .MODEL_SEA20.q1_Q1,  &
      .MODEL_SEA20.Q2,  &
      .MODEL_SEA20.q2_Q2
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA2001.file_name  &
   string_value = "Controls_Plant_SEA2001"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA2001.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA2001.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA2001.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA2001.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA2001.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA2001.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA2001.host  &
   string_value = "Ghost_Lee"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA2001.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA2001.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA2001.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_SEA20.Controls_Plant_SEA2001
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA1.input_channels  &
   object_value =   &
      .MODEL_SEA20.T1,  &
      .MODEL_SEA20.T2
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA1.output_channels  &
   object_value =   &
      .MODEL_SEA20.Q1,  &
      .MODEL_SEA20.q1_Q1,  &
      .MODEL_SEA20.Q2,  &
      .MODEL_SEA20.q2_Q2
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA1.file_name  &
   string_value = "Controls_Plant_SEA2001"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA1.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA1.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA1.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA1.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA1.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA1.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA1.host  &
   string_value = "Ghost_Lee"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA1.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA1.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA1.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_SEA20.Controls_Plant_SEA1
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA001.input_channels  &
   object_value =   &
      .MODEL_SEA20.T1,  &
      .MODEL_SEA20.T2
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA001.output_channels  &
   object_value =   &
      .MODEL_SEA20.Q1,  &
      .MODEL_SEA20.q1_Q1,  &
      .MODEL_SEA20.Q2,  &
      .MODEL_SEA20.q2_Q2
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA001.file_name  &
   string_value = "SEA001"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA001.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA001.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA001.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA001.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA001.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA001.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA001.host  &
   string_value = "Ghost_Lee"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA001.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA001.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA001.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_SEA20.SEA001
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA1.input_channels  &
   object_value =   &
      .MODEL_SEA20.T1,  &
      .MODEL_SEA20.T2
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA1.output_channels  &
   object_value =   &
      .MODEL_SEA20.Q1,  &
      .MODEL_SEA20.q1_Q1,  &
      .MODEL_SEA20.Q2,  &
      .MODEL_SEA20.q2_Q2
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA1.file_name  &
   string_value = "SEA001"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA1.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA1.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA1.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA1.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA1.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA1.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA1.host  &
   string_value = "Ghost_Lee"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA1.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA1.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_SEA20.SEA1.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_SEA20.SEA1
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA0001.input_channels  &
   object_value =   &
      .MODEL_SEA20.T1,  &
      .MODEL_SEA20.T2
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA0001.output_channels  &
   object_value =   &
      .MODEL_SEA20.Q1,  &
      .MODEL_SEA20.q1_Q1,  &
      .MODEL_SEA20.Q2,  &
      .MODEL_SEA20.q2_Q2
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA0001.file_name  &
   string_value = "Controls_Plant_1"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA0001.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA0001.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA0001.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA0001.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA0001.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA0001.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA0001.host  &
   string_value = "Ghost_Lee"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA0001.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA0001.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_SEA20.Controls_Plant_SEA0001.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_SEA20.Controls_Plant_SEA0001
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk1.i_marker  &
   object_value = (.MODEL_SEA20.motor1.MARKER_41)
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk1.j_marker  &
   object_value = (.MODEL_SEA20.SEA_Spring_1.MARKER_42)
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk1.stiffness_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk1.stiffness_coefficient  &
   real_value = (185.8446(newton-meter/rad))
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk1.stiffness_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk1.damping_mode  &
   string_value = "none"
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk1.damping_coefficient  &
   real_value = (0.14(newton-meter-sec/rad))
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk1.damping_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk1.free_angle_mode  &
   string_value = "Design_Angle"
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk1.free_angle  &
   real_value = 1.0
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk1.preload  &
   real_value = 0.0
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk1.i_dynamic_visibility  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_SEA20.Tk1.j_dynamic_visibility  &
   string_value = "off"
!
ude modify instance  &
   instance_name = .MODEL_SEA20.Tk1
!
undo end_block
!
!------------------------------ Dynamic Graphics ------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_SEA20.ground
!
geometry create shape force  &
   force_name = .MODEL_SEA20.SFORCE_1_force_graphic_1  &
   adams_id = 16  &
   force_element_name = .MODEL_SEA20.F1  &
   applied_at_marker_name = .MODEL_SEA20.motor1.MARKER_25
!
geometry create shape force  &
   force_name = .MODEL_SEA20.SFORCE_2_force_graphic_1  &
   adams_id = 17  &
   force_element_name = .MODEL_SEA20.F2  &
   applied_at_marker_name = .MODEL_SEA20.link1.MARKER_27
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = G  &
   x_component_gravity = 0.0  &
   y_component_gravity = 0.0  &
   z_component_gravity = -9.80665
!
!----------------------------- Analysis settings ------------------------------!
!
!
!---------------------------- Adams/View Variables ----------------------------!
!
!
variable create  &
   variable_name = .MODEL_SEA20._model  &
   string_value = ".MODEL_SEA20"
!
!---------------------------- Function definitions ----------------------------!
!
!
data_element modify variable  &
   variable_name = .MODEL_SEA20.Q1  &
   function = "AZ(.MODEL_SEA20.motor1.MARKER_4, .MODEL_SEA20.base.MARKER_3)"
!
data_element modify variable  &
   variable_name = .MODEL_SEA20.q1_Q1  &
   function = "AZ(.MODEL_SEA20.SEA_Spring_1.MARKER_7, .MODEL_SEA20.motor1.MARKER_23)"
!
data_element modify variable  &
   variable_name = .MODEL_SEA20.Q2  &
   function = "AZ(.MODEL_SEA20.motor2.MARKER_20, .MODEL_SEA20.link1.MARKER_19)"
!
data_element modify variable  &
   variable_name = .MODEL_SEA20.q2_Q2  &
   function = "AZ(.MODEL_SEA20.SEA_Spring_2.MARKER_22, .MODEL_SEA20.motor2.MARKER_21)"
!
data_element modify variable  &
   variable_name = .MODEL_SEA20.T1  &
   function = "0"
!
data_element modify variable  &
   variable_name = .MODEL_SEA20.T2  &
   function = "0"
!
force modify direct single_component_force  &
   single_component_force_name = .MODEL_SEA20.F1  &
   function = "varval(.MODEL_SEA20.T1)"
!
force modify direct single_component_force  &
   single_component_force_name = .MODEL_SEA20.F2  &
   function = "varval(.MODEL_SEA20.T2)"
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_SEA20.fc1
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_SEA20.Controls_Plant_FJR1
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_SEA20.fc2
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_SEA20.Tk2
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_SEA20.SEA200
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_SEA20.Controls_Plant_SEA201
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_SEA20.Controls_Plant_SEA202
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_SEA20.Controls_Plant_1
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_SEA20.Controls_Plant_SEA2001
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_SEA20.Controls_Plant_SEA1
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_SEA20.SEA001
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_SEA20.SEA1
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_SEA20.Controls_Plant_SEA0001
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_SEA20.Tk1
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
geometry modify shape force  &
   force_name = .MODEL_SEA20.SFORCE_1_force_graphic_1  &
   applied_at_marker_name = (.MODEL_SEA20.F1.i)
!
geometry modify shape force  &
   force_name = .MODEL_SEA20.SFORCE_2_force_graphic_1  &
   applied_at_marker_name = (.MODEL_SEA20.F2.i)
!
model display  &
   model_name = MODEL_SEA20

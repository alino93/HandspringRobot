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
   model_name = MODEL_f
!
view erase
!
!-------------------------------- Data storage --------------------------------!
!
!
data_element create variable  &
   variable_name = .MODEL_f.Force_input  &
   adams_id = 7  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_f.Torque_input  &
   adams_id = 8  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_f.rubber_1_sensor_output  &
   adams_id = 10  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_f.rubber_2_sensor_output  &
   adams_id = 11  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_f.velocity_x_output  &
   adams_id = 17  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_f.angle_output  &
   adams_id = 18  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_f.thp_output  &
   adams_id = 21  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_f.angular_velocity_output  &
   adams_id = 22  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_f.disk_angular_velocity_otp  &
   adams_id = 29  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_f.f_prime_opt  &
   adams_id = 30  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_f.N_opt  &
   adams_id = 31  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_f.Xrel_output  &
   adams_id = 35  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_f.Vrel_output  &
   adams_id = 36  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_f.Arel_output  &
   adams_id = 37  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_f.angular_acc_output  &
   adams_id = 38  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_f.velocity_y_output  &
   adams_id = 40  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_f.V_output  &
   adams_id = 43  &
   initial_condition = 0.0  &
   function = ""
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .MODEL_f.steel  &
   adams_id = 1  &
   density = 7801.0  &
   youngs_modulus = 2.07E+011  &
   poissons_ratio = 0.29
!
material create  &
   material_name = .MODEL_f.aluminum  &
   adams_id = 4  &
   density = 2740.0  &
   youngs_modulus = 7.1705E+010  &
   poissons_ratio = 0.33
!
material create  &
   material_name = .MODEL_f.cast_iron  &
   adams_id = 2  &
   density = 7080.0  &
   youngs_modulus = 1.0E+011  &
   poissons_ratio = 0.211  &
   comments = "ASTM 35 Cast Iron"
!
material create  &
   material_name = .MODEL_f.rubber_belt  &
   adams_id = 3  &
   density = 1.1  &
   orthotropic_constants = 1.0E+010, 1.0E+005, 1.0E+005
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
   default_coordinate_system = .MODEL_f.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_f.ground.MARKER_196  &
   adams_id = 196  &
   location = -0.75, 0.0, -0.3  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_f.ground.MARKER_206  &
   adams_id = 206  &
   location = 0.0, 1.05, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_f.ground.MARKER_208  &
   adams_id = 208  &
   location = -5.0E-002, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_f.ground.MARKER_210  &
   adams_id = 210  &
   location = -5.0E-002, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_f.ground.MARKER_222  &
   adams_id = 222  &
   location = 0.0, 0.4, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .MODEL_f.ground  &
   material_type = .MODEL_f.steel
!
! ****** Graphics for current part ******
!
geometry create shape block  &
   block_name = .MODEL_f.ground.BOX_58  &
   adams_id = 58  &
   corner_marker = .MODEL_f.ground.MARKER_196  &
   diag_corner_coords = 8.0, -5.0E-002, 0.6
!
part attributes  &
   part_name = .MODEL_f.ground  &
   name_visibility = off
!
!-------------------------------- linearMotor ---------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_f.linearMotor  &
   adams_id = 2  &
   location = 0.0, 0.2393, 0.0  &
   orientation = 0.0, 1.5707963268, 1.5707963268
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.linearMotor
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_f.linearMotor.MARKER_81  &
   adams_id = 81  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.linearMotor.MARKER_81  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.linearMotor.MARKER_88  &
   adams_id = 88  &
   location = 0.0, 0.0, 5.042E-002  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.linearMotor.MARKER_88  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.linearMotor.MARKER_89  &
   adams_id = 89  &
   location = 0.0, 0.0, -7.367E-002  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.linearMotor.MARKER_89  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.linearMotor.MARKER_96  &
   adams_id = 96  &
   location = -1.4E-002, -1.75E-002, -5.1E-002  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.linearMotor.MARKER_96  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.linearMotor.MARKER_97  &
   adams_id = 97  &
   location = -1.4E-002, -1.75E-002, -5.1E-002  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
marker attributes  &
   marker_name = .MODEL_f.linearMotor.MARKER_97  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.linearMotor.MAR52  &
   adams_id = 52  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.linearMotor.MAR52  &
   visibility = on
!
marker create  &
   marker_name = .MODEL_f.linearMotor.MARKER_185  &
   adams_id = 185  &
   location = 0.0, 0.0, 0.0  &
   orientation = 4.7123889804, 3.1415926536, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.linearMotor.MARKER_185  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.linearMotor.MARKER_197  &
   adams_id = 197  &
   location = 0.0, 0.0, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 3.1415926536
!
marker attributes  &
   marker_name = .MODEL_f.linearMotor.MARKER_197  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.linearMotor.MARKER_202  &
   adams_id = 202  &
   location = 0.0, 0.0, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 3.1415926536
!
part create rigid_body mass_properties  &
   part_name = .MODEL_f.linearMotor  &
   mass = 5.0E-004  &
   center_of_mass_marker = .MODEL_f.linearMotor.MAR52  &
   ixx = 5.0010543E-006  &
   iyy = 5.0010543E-006  &
   izz = 2.010543E-006  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_f.linearMotor.SHL26  &
   reference_marker = .MODEL_f.linearMotor.MAR52  &
   file_name = "SHL26.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_f.linearMotor  &
   color = SILVER
!
!------------------------------------ bar -------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_f.bar  &
   adams_id = 3  &
   location = 0.0, 0.1885, 0.0  &
   orientation = 0.0, 1.5707963268, 3.1415926536
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.bar
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_f.bar.MARKER_80  &
   adams_id = 80  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.bar.MARKER_80  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.bar.MARKER_82  &
   adams_id = 82  &
   location = 0.0, 0.0, 6.5E-002  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.bar.MARKER_82  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.bar.MARKER_83  &
   adams_id = 83  &
   location = 0.0, 0.0, -0.4885  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.bar.MARKER_83  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.bar.MARKER_91  &
   adams_id = 91  &
   location = 0.0, 0.0, -0.4885  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.bar.MARKER_91  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.bar.MARKER_93  &
   adams_id = 93  &
   location = 0.0, 0.0, 6.5E-002  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.bar.MARKER_93  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.bar.MARKER_94  &
   adams_id = 94  &
   location = 0.0, 0.0, -0.2115  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.bar.MARKER_94  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.bar.MAR54  &
   adams_id = 54  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.bar.MAR54  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.bar.cm  &
   adams_id = 187  &
   location = 0.0, 1.3130100063E-009, -0.2115  &
   orientation = 1.5707963268, 3.1415926536, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.bar.cm  &
   visibility = on
!
marker create  &
   marker_name = .MODEL_f.bar.MARKER_186  &
   adams_id = 186  &
   location = 0.0, 0.0, -5.08E-002  &
   orientation = 3.1415926536, 3.1415926536, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.bar.MARKER_186  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.bar.MARKER_192  &
   adams_id = 192  &
   location = 0.0, 0.0, -0.4885  &
   orientation = 0.0, 1.5707963268, 3.1415926536
!
marker attributes  &
   marker_name = .MODEL_f.bar.MARKER_192  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.bar.MARKER_194  &
   adams_id = 194  &
   location = 0.0, 0.0, 6.5E-002  &
   orientation = 0.0, 1.5707963268, 3.1415926536
!
marker attributes  &
   marker_name = .MODEL_f.bar.MARKER_194  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.bar.MARKER_198  &
   adams_id = 198  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 1.5707963268, 3.1415926536
!
marker attributes  &
   marker_name = .MODEL_f.bar.MARKER_198  &
   visibility = off
!
part create rigid_body mass_properties  &
   part_name = .MODEL_f.bar  &
   mass = 5.0E-003  &
   center_of_mass_marker = .MODEL_f.bar.cm  &
   ixx = 5.9705530841E-004  &
   iyy = 5.9655384573E-004  &
   izz = 7.0899702637E-006  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_f.bar.SHL28  &
   reference_marker = .MODEL_f.bar.MAR54  &
   file_name = "SHL28.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_f.bar  &
   visibility = on
!
!---------------------------------- rubber_1 ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_f.rubber_1  &
   adams_id = 4  &
   location = 0.0, 0.1235, -3.0157376716E-003  &
   orientation = 3.1415926536, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.rubber_1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_f.rubber_1.MARKER_92  &
   adams_id = 92  &
   location = 0.0, 0.0, 3.0157376716E-003  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
marker attributes  &
   marker_name = .MODEL_f.rubber_1.MARKER_92  &
   visibility = on
!
marker create  &
   marker_name = .MODEL_f.rubber_1.MAR56  &
   adams_id = 56  &
   location = 0.0, 0.0, 3.0157376716E-003  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.rubber_1.MAR56  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.rubber_1.cm  &
   adams_id = 188  &
   location = 1.5154825567E-010, 1.1248723318E-002, 3.0157376751E-003  &
   orientation = 1.5707963268, 3.1415926536, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.rubber_1.cm  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.rubber_1.MARKER_207  &
   adams_id = 207  &
   location = 0.0, 0.0, 3.0157376716E-003  &
   orientation = 3.1415926536, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .MODEL_f.rubber_1  &
   mass = 6.216989423E-005  &
   center_of_mass_marker = .MODEL_f.rubber_1.MARKER_92  &
   ixx = 1.4507274882E-008  &
   iyy = 1.4507274885E-008  &
   izz = 2.2371544503E-008  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_f.rubber_1.SHL30  &
   reference_marker = .MODEL_f.rubber_1.MAR56  &
   file_name = "SHL30.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_f.rubber_1  &
   color = BLACK
!
!---------------------------------- rubber_2 ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_f.rubber_2  &
   adams_id = 5  &
   location = 0.0, 0.677, 0.0  &
   orientation = 3.1415926536, 3.1415926536, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.rubber_2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_f.rubber_2.MAR56  &
   adams_id = 57  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.rubber_2.MAR56  &
   visibility = on
!
marker create  &
   marker_name = .MODEL_f.rubber_2.MARKER_90  &
   adams_id = 90  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 1.5707963268, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.rubber_2.MARKER_90  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.rubber_2.cm  &
   adams_id = 189  &
   location = 1.5154825567E-010, 1.1248723318E-002, 0.0  &
   orientation = 1.5707963268, 3.1415926536, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.rubber_2.cm  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.rubber_2.MARKER_205  &
   adams_id = 205  &
   location = 0.0, 0.0, 0.0  &
   orientation = 3.1415926536, 3.1415926536, 0.0
!
part create rigid_body mass_properties  &
   part_name = .MODEL_f.rubber_2  &
   mass = 6.216989423E-005  &
   center_of_mass_marker = .MODEL_f.rubber_2.MAR56  &
   ixx = 1.4507274885E-008  &
   iyy = 2.2371544503E-008  &
   izz = 1.4507274882E-008  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_f.rubber_2.SHL30  &
   reference_marker = .MODEL_f.rubber_2.MAR56  &
   file_name = "SHL30.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_f.rubber_2  &
   color = BLACK
!
!----------------------------------- disk_1 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_f.disk_1  &
   adams_id = 6  &
   location = 0.0, 0.4, 5.0E-002  &
   orientation = 4.7123889804, 1.5707963268, 1.5707963268
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.disk_1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_f.disk_1.MARKER_182  &
   adams_id = 182  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.disk_1.MARKER_182  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.disk_1.MAR59  &
   adams_id = 59  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.disk_1.MAR59  &
   visibility = on
!
part create rigid_body mass_properties  &
   part_name = .MODEL_f.disk_1  &
   mass = 0.25  &
   center_of_mass_marker = .MODEL_f.disk_1.MAR59  &
   ixx = 9.5010543E-003  &
   iyy = 1.252543E-003  &
   izz = 1.251543E-003  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_f.disk_1.SHL33  &
   reference_marker = .MODEL_f.disk_1.MAR59  &
   file_name = "SHL33.shl"  &
   wireframe_only = no
!
!----------------------------------- disk_2 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_f.disk_2  &
   adams_id = 7  &
   location = 0.0, 0.4, -5.0E-002  &
   orientation = 4.7123889804, 1.5707963268, 1.5707963268
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.disk_2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_f.disk_2.MAR59  &
   adams_id = 60  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.disk_2.MAR59  &
   visibility = on
!
marker create  &
   marker_name = .MODEL_f.disk_2.MARKER_180  &
   adams_id = 180  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.disk_2.MARKER_180  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.disk_2.MARKER_223  &
   adams_id = 223  &
   location = 5.0E-002, 0.0, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 4.7123889804
!
part create rigid_body mass_properties  &
   part_name = .MODEL_f.disk_2  &
   mass = 0.25  &
   center_of_mass_marker = .MODEL_f.disk_2.MAR59  &
   ixx = 9.5010543E-003  &
   iyy = 1.252543E-003  &
   izz = 1.25210543E-003  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_f.disk_2.SHL33  &
   reference_marker = .MODEL_f.disk_2.MAR59  &
   file_name = "SHL33.shl"  &
   wireframe_only = no
!
!------------------------------------ body ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_f.body  &
   adams_id = 8  &
   location = 0.0, 0.4, 0.0  &
   orientation = 4.7123889804, 1.5707963268, 1.5707963268
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.body
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_f.body.MARKER_84  &
   adams_id = 84  &
   location = 0.0, 0.215, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.body.MARKER_84  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.body.MARKER_85  &
   adams_id = 85  &
   location = 0.0, -0.215, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.body.MARKER_85  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.body.MARKER_86  &
   adams_id = 86  &
   location = 3.1E-002, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.body.MARKER_86  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.body.MARKER_87  &
   adams_id = 87  &
   location = -3.1E-002, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.body.MARKER_87  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.body.MARKER_95  &
   adams_id = 95  &
   location = -1.4E-002, -0.1097, -1.75E-002  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.body.MARKER_95  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.body.MARKER_98  &
   adams_id = 98  &
   location = -1.4E-002, -0.1097, -1.75E-002  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.body.MARKER_98  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.body.MARKER_178  &
   adams_id = 178  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.body.MARKER_178  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.body.MAR79  &
   adams_id = 79  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.body.MAR79  &
   visibility = on
!
marker create  &
   marker_name = .MODEL_f.body.c3333  &
   adams_id = 190  &
   location = -1.4499999984E-002, -0.1187000008, 7.061754063E-010  &
   orientation = 2.6759326029E-010, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.body.c3333  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.body.MARKER_193  &
   adams_id = 193  &
   location = 0.0, 0.215, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 4.7123889804
!
marker attributes  &
   marker_name = .MODEL_f.body.MARKER_193  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.body.MARKER_195  &
   adams_id = 195  &
   location = 0.0, -0.215, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 4.7123889804
!
marker attributes  &
   marker_name = .MODEL_f.body.MARKER_195  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.body.MARKER_203  &
   adams_id = 203  &
   location = 0.0, 0.0, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 4.7123889804
!
marker create  &
   marker_name = .MODEL_f.body.MARKER_220  &
   adams_id = 220  &
   location = 0.0, 0.1293, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 4.7123889804
!
part create rigid_body mass_properties  &
   part_name = .MODEL_f.body  &
   mass = 1.3617245505  &
   center_of_mass_marker = .MODEL_f.body.MAR79  &
   ixx = 1.773720459E-002  &
   iyy = 8.9774713382E-004  &
   izz = 1.7735243147E-002  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_f.body.SHL38  &
   reference_marker = .MODEL_f.body.MAR79  &
   file_name = "SHL38.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_f.body  &
   visibility = on
!
!-------------------------------- angularMotor --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_f.angularMotor  &
   adams_id = 9  &
   location = 0.0, 0.4, 5.8E-002  &
   orientation = 4.7123889804, 1.5707963268, 1.5707963268
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.angularMotor
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_f.angularMotor.MARKER_177  &
   adams_id = 177  &
   location = -5.8E-002, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.angularMotor.MARKER_177  &
   visibility = on
!
marker create  &
   marker_name = .MODEL_f.angularMotor.MARKER_183  &
   adams_id = 183  &
   location = -5.8E-002, 0.0, 0.0  &
   orientation = 4.7123889804, 1.5707963268, 3.1415926536
!
marker attributes  &
   marker_name = .MODEL_f.angularMotor.MARKER_183  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.angularMotor.MAR175  &
   adams_id = 175  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.angularMotor.MAR175  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.angularMotor.MARKER_199  &
   adams_id = 199  &
   location = -5.8E-002, 0.0, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 4.7123889804
!
marker attributes  &
   marker_name = .MODEL_f.angularMotor.MARKER_199  &
   visibility = off
!
part create rigid_body mass_properties  &
   part_name = .MODEL_f.angularMotor  &
   mass = 0.5  &
   center_of_mass_marker = .MODEL_f.angularMotor.MARKER_177  &
   ixx = 1.251024E-003  &
   iyy = 6.3965589431E-003  &
   izz = 6.3965589431E-003  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_f.angularMotor.SHL47  &
   reference_marker = .MODEL_f.angularMotor.MAR175  &
   file_name = "SHL47.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_f.angularMotor  &
   color = Brown
!
!------------------------------------ mil -------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_f.mil  &
   adams_id = 10  &
   location = 0.0, 0.4, -5.8E-002  &
   orientation = 4.7123889804, 1.5707963268, 1.5707963268
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.mil
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_f.mil.MARKER_179  &
   adams_id = 179  &
   location = 8.0E-003, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.mil.MARKER_179  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.mil.MARKER_181  &
   adams_id = 181  &
   location = 0.108, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.mil.MARKER_181  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.mil.MARKER_184  &
   adams_id = 184  &
   location = 5.8E-002, 0.0, 0.0  &
   orientation = 4.7123889804, 1.5707963268, 3.1415926536
!
marker attributes  &
   marker_name = .MODEL_f.mil.MARKER_184  &
   visibility = on
!
marker create  &
   marker_name = .MODEL_f.mil.cm  &
   adams_id = 191  &
   location = 5.7999985916E-002, 3.5768520448E-008, -2.5316247098E-008  &
   orientation = 1.5707964191, 1.5707965734, 6.2132892805
!
marker attributes  &
   marker_name = .MODEL_f.mil.cm  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.mil.MAR176  &
   adams_id = 176  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.mil.MAR176  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.mil.MARKER_200  &
   adams_id = 200  &
   location = 0.0, 0.0, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 4.7123889804
!
marker attributes  &
   marker_name = .MODEL_f.mil.MARKER_200  &
   visibility = off
!
part create rigid_body mass_properties  &
   part_name = .MODEL_f.mil  &
   mass = 3.5740932667E-002  &
   center_of_mass_marker = .MODEL_f.mil.MARKER_184  &
   ixx = 4.0396875393E-003  &
   iyy = 4.0396718134E-003  &
   izz = 6.3965589431E-005  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_f.mil.SHL49  &
   reference_marker = .MODEL_f.mil.MAR176  &
   file_name = "SHL49.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_f.mil  &
   color = CYAN
!
!------------------------------- linearMotor_2 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_f.linearMotor_2  &
   adams_id = 11  &
   location = 0.0, 0.5293, 0.0  &
   orientation = 0.0, 1.5707963268, 1.5707963268
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.linearMotor_2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_f.linearMotor_2.MAR52  &
   adams_id = 211  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.linearMotor_2.MAR52  &
   visibility = on
!
marker create  &
   marker_name = .MODEL_f.linearMotor_2.MARKER_81  &
   adams_id = 212  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.linearMotor_2.MARKER_81  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.linearMotor_2.MARKER_88  &
   adams_id = 213  &
   location = 0.0, 0.0, 5.042E-002  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.linearMotor_2.MARKER_88  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.linearMotor_2.MARKER_89  &
   adams_id = 214  &
   location = 0.0, 0.0, -7.367E-002  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.linearMotor_2.MARKER_89  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.linearMotor_2.MARKER_96  &
   adams_id = 215  &
   location = -1.4E-002, -1.75E-002, -5.1E-002  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.linearMotor_2.MARKER_96  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.linearMotor_2.MARKER_97  &
   adams_id = 216  &
   location = -1.4E-002, -1.75E-002, -5.1E-002  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
marker attributes  &
   marker_name = .MODEL_f.linearMotor_2.MARKER_97  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.linearMotor_2.MARKER_185  &
   adams_id = 217  &
   location = 0.0, 0.0, 0.0  &
   orientation = 4.7123889804, 3.1415926536, 0.0
!
marker attributes  &
   marker_name = .MODEL_f.linearMotor_2.MARKER_185  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.linearMotor_2.MARKER_197  &
   adams_id = 218  &
   location = 0.0, 0.0, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 3.1415926536
!
marker attributes  &
   marker_name = .MODEL_f.linearMotor_2.MARKER_197  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_f.linearMotor_2.MARKER_202  &
   adams_id = 219  &
   location = 0.0, 0.0, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 3.1415926536
!
marker create  &
   marker_name = .MODEL_f.linearMotor_2.MARKER_221  &
   adams_id = 221  &
   location = 0.0, 0.0, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 3.1415926536
!
part create rigid_body mass_properties  &
   part_name = .MODEL_f.linearMotor_2  &
   mass = 5.0E-004  &
   center_of_mass_marker = .MODEL_f.linearMotor_2.MAR52  &
   ixx = 5.0010543E-006  &
   iyy = 5.0010543E-006  &
   izz = 2.010543E-006  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_f.linearMotor_2.SHL26  &
   reference_marker = .MODEL_f.linearMotor_2.MAR52  &
   file_name = "SHL26.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_f.linearMotor_2  &
   color = SILVER
!
!---------------------------------- Contacts ----------------------------------!
!
!
contact create  &
   contact_name = .MODEL_f.CONTACT_1  &
   adams_id = 1  &
   i_geometry_name = .MODEL_f.ground.BOX_58  &
   j_geometry_name = .MODEL_f.rubber_1.SHL30  &
   stiffness = 1.0E+006  &
   damping = 1.0E+004  &
   exponent = 2.2  &
   dmax = 1.0E-004  &
   coulomb_friction = on  &
   mu_static = 5.0  &
   mu_dynamic = 1.0  &
   stiction_transition_velocity = 0.8  &
   friction_transition_velocity = 1.0
!
contact create  &
   contact_name = .MODEL_f.CONTACT_2  &
   adams_id = 2  &
   i_geometry_name = .MODEL_f.ground.BOX_58  &
   j_geometry_name = .MODEL_f.rubber_2.SHL30  &
   stiffness = 1.0E+006  &
   damping = 1.0E+004  &
   exponent = 2.2  &
   dmax = 1.0E-004  &
   coulomb_friction = on  &
   mu_static = 5.0  &
   mu_dynamic = 1.0  &
   stiction_transition_velocity = 0.8  &
   friction_transition_velocity = 1.0
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint translational  &
   joint_name = .MODEL_f.JOINT_1  &
   adams_id = 1  &
   i_marker_name = .MODEL_f.bar.MARKER_80  &
   j_marker_name = .MODEL_f.linearMotor.MARKER_81
!
constraint attributes  &
   constraint_name = .MODEL_f.JOINT_1  &
   active = off  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_f.JOINT_2  &
   adams_id = 2  &
   i_marker_name = .MODEL_f.rubber_2.MARKER_90  &
   j_marker_name = .MODEL_f.bar.MARKER_91
!
constraint attributes  &
   constraint_name = .MODEL_f.JOINT_2  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_f.JOINT_3  &
   adams_id = 3  &
   i_marker_name = .MODEL_f.rubber_1.MARKER_92  &
   j_marker_name = .MODEL_f.bar.MARKER_93
!
constraint attributes  &
   constraint_name = .MODEL_f.JOINT_3  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_f.JOINT_4  &
   adams_id = 4  &
   i_marker_name = .MODEL_f.linearMotor.MARKER_97  &
   j_marker_name = .MODEL_f.body.MARKER_98
!
constraint attributes  &
   constraint_name = .MODEL_f.JOINT_4  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_f.JOINT_5  &
   adams_id = 5  &
   i_marker_name = .MODEL_f.angularMotor.MARKER_177  &
   j_marker_name = .MODEL_f.body.MARKER_178
!
constraint attributes  &
   constraint_name = .MODEL_f.JOINT_5  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_f.JOINT_6  &
   adams_id = 6  &
   i_marker_name = .MODEL_f.mil.MARKER_179  &
   j_marker_name = .MODEL_f.disk_2.MARKER_180
!
constraint attributes  &
   constraint_name = .MODEL_f.JOINT_6  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_f.JOINT_7  &
   adams_id = 7  &
   i_marker_name = .MODEL_f.mil.MARKER_181  &
   j_marker_name = .MODEL_f.disk_1.MARKER_182
!
constraint attributes  &
   constraint_name = .MODEL_f.JOINT_7  &
   visibility = off  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_f.JOINT_8  &
   adams_id = 8  &
   i_marker_name = .MODEL_f.angularMotor.MARKER_183  &
   j_marker_name = .MODEL_f.mil.MARKER_184
!
constraint attributes  &
   constraint_name = .MODEL_f.JOINT_8  &
   visibility = on  &
   name_visibility = off
!
constraint create joint translational  &
   joint_name = .MODEL_f.JOINT_9  &
   adams_id = 9  &
   i_marker_name = .MODEL_f.linearMotor.MARKER_185  &
   j_marker_name = .MODEL_f.bar.MARKER_186
!
constraint attributes  &
   constraint_name = .MODEL_f.JOINT_9  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_f.JOINT_10  &
   adams_id = 10  &
   i_marker_name = .MODEL_f.body.MARKER_220  &
   j_marker_name = .MODEL_f.linearMotor_2.MARKER_221
!
constraint attributes  &
   constraint_name = .MODEL_f.JOINT_10  &
   visibility = off  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
force create direct single_component_force  &
   single_component_force_name = .MODEL_f.Force  &
   adams_id = 3  &
   type_of_freedom = translational  &
   i_marker_name = .MODEL_f.linearMotor.MARKER_197  &
   j_marker_name = .MODEL_f.bar.MARKER_198  &
   action_only = off  &
   function = ""
!
force attributes  &
   force_name = .MODEL_f.Force  &
   visibility = on
!
force create direct single_component_force  &
   single_component_force_name = .MODEL_f.Torque  &
   adams_id = 4  &
   type_of_freedom = rotational  &
   i_marker_name = .MODEL_f.angularMotor.MARKER_199  &
   j_marker_name = .MODEL_f.mil.MARKER_200  &
   action_only = off  &
   function = ""
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .MODEL_f.Last_Sim  &
   commands =   &
              "simulation single_run transient type=dynamic initial_static=no end_time=0.5 number_of_steps=50 model_name=.MODEL_f"
!
!-------------------------- Adams/View UDE Instances --------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.ground
!
undo begin_block suppress = yes
!
ude create instance  &
   instance_name = .MODEL_f.SPRING_1  &
   definition_name = .MDI.Forces.spring  &
   location = 0.0, 0.4, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude attributes  &
   instance_name = .MODEL_f.SPRING_1  &
   color = RED
!
ude create instance  &
   instance_name = .MODEL_f.SPRING_2  &
   definition_name = .MDI.Forces.spring  &
   location = 0.0, 0.4, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude attributes  &
   instance_name = .MODEL_f.SPRING_2  &
   color = RED
!
ude create instance  &
   instance_name = .MODEL_f.Controls_Plant  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_f.Controls_Plant_1  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_f.Controls_Plant_3  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_f.Controls_Plant_4  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_f.Controls_Plant_5  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_f.Controls_Plant_8  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_f.Controls_Plant_9  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_f.Controls_Plant_2  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_f.Controls_Plant_6  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_f.Controls_Plant_7  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_f.Controls_Plant_10  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_f.Controls_Plant_11  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .MODEL_f.TORSION_SPRING_1  &
   definition_name = .MDI.Forces.torsion_spring  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude attributes  &
   instance_name = .MODEL_f.TORSION_SPRING_1  &
   visibility = off
!
ude create instance  &
   instance_name = .MODEL_f.Controls_Plant_12  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_f.SPRING_1.i_marker  &
   object_value = (.MODEL_f.bar.MARKER_192)
!
variable modify  &
   variable_name = .MODEL_f.SPRING_1.j_marker  &
   object_value = (.MODEL_f.body.MARKER_193)
!
variable modify  &
   variable_name = .MODEL_f.SPRING_1.stiffness_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = .MODEL_f.SPRING_1.stiffness_coefficient  &
   real_value = 200.0
!
variable modify  &
   variable_name = .MODEL_f.SPRING_1.stiffness_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .MODEL_f.SPRING_1.damping_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = .MODEL_f.SPRING_1.damping_coefficient  &
   real_value = 20.0
!
variable modify  &
   variable_name = .MODEL_f.SPRING_1.damping_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .MODEL_f.SPRING_1.free_length_mode  &
   string_value = "Design_Length"
!
variable modify  &
   variable_name = .MODEL_f.SPRING_1.free_length  &
   real_value = 1.0
!
variable modify  &
   variable_name = .MODEL_f.SPRING_1.preload  &
   real_value = 0.0
!
variable modify  &
   variable_name = .MODEL_f.SPRING_1.i_dynamic_visibility  &
   string_value = "On"
!
variable modify  &
   variable_name = .MODEL_f.SPRING_1.j_dynamic_visibility  &
   string_value = "Off"
!
variable modify  &
   variable_name = .MODEL_f.SPRING_1.spring_visibility  &
   string_value = "depends"
!
variable modify  &
   variable_name = .MODEL_f.SPRING_1.damper_visibility  &
   string_value = "depends"
!
ude modify instance  &
   instance_name = .MODEL_f.SPRING_1
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_f.SPRING_2.i_marker  &
   object_value = (.MODEL_f.bar.MARKER_194)
!
variable modify  &
   variable_name = .MODEL_f.SPRING_2.j_marker  &
   object_value = (.MODEL_f.body.MARKER_195)
!
variable modify  &
   variable_name = .MODEL_f.SPRING_2.stiffness_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = .MODEL_f.SPRING_2.stiffness_coefficient  &
   real_value = 200.0
!
variable modify  &
   variable_name = .MODEL_f.SPRING_2.stiffness_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .MODEL_f.SPRING_2.damping_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = .MODEL_f.SPRING_2.damping_coefficient  &
   real_value = 20.0
!
variable modify  &
   variable_name = .MODEL_f.SPRING_2.damping_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .MODEL_f.SPRING_2.free_length_mode  &
   string_value = "Design_Length"
!
variable modify  &
   variable_name = .MODEL_f.SPRING_2.free_length  &
   real_value = 1.0
!
variable modify  &
   variable_name = .MODEL_f.SPRING_2.preload  &
   real_value = 0.0
!
variable modify  &
   variable_name = .MODEL_f.SPRING_2.i_dynamic_visibility  &
   string_value = "On"
!
variable modify  &
   variable_name = .MODEL_f.SPRING_2.j_dynamic_visibility  &
   string_value = "Off"
!
variable modify  &
   variable_name = .MODEL_f.SPRING_2.spring_visibility  &
   string_value = "depends"
!
variable modify  &
   variable_name = .MODEL_f.SPRING_2.damper_visibility  &
   string_value = "depends"
!
ude modify instance  &
   instance_name = .MODEL_f.SPRING_2
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant.input_channels  &
   object_value =   &
      .MODEL_f.Force_input,  &
      .MODEL_f.Torque_input
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant.output_channels  &
   object_value =   &
      .MODEL_f.angle_output,  &
      .MODEL_f.thp_output,  &
      .MODEL_f.angular_acc_output,  &
      .MODEL_f.angular_velocity_output,  &
      .MODEL_f.Xrel_output,  &
      .MODEL_f.Vrel_output,  &
      .MODEL_f.Arel_output,  &
      .MODEL_f.disk_angular_velocity_otp,  &
      .MODEL_f.N_opt,  &
      .MODEL_f.f_prime_opt,  &
      .MODEL_f.rubber_1_sensor_output,  &
      .MODEL_f.rubber_2_sensor_output,  &
      .MODEL_f.velocity_x_output,  &
      .MODEL_f.velocity_y_output,  &
      .MODEL_f.V_output
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant.file_name  &
   string_value = "Controls_Plant"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant.host  &
   string_value = "Ali"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_1.input_channels  &
   object_value =   &
      .MODEL_f.Force_input,  &
      .MODEL_f.Torque_input
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_1.output_channels  &
   object_value =   &
      .MODEL_f.rubber_1_sensor_output,  &
      .MODEL_f.rubber_2_sensor_output
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_1.file_name  &
   string_value = "Controls_Plant_1"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_1.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_1.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_1.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_1.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_1.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_1.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_1.host  &
   string_value = "Ali"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_1.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_1.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_1.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_1
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_3.input_channels  &
   object_value =   &
      .MODEL_f.Force_input,  &
      .MODEL_f.Torque_input
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_3.output_channels  &
   object_value =   &
      .MODEL_f.rubber_1_sensor_output,  &
      .MODEL_f.rubber_2_sensor_output
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_3.file_name  &
   string_value = "Controls_Plant_2"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_3.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_3.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_3.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_3.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_3.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_3.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_3.host  &
   string_value = "Ali"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_3.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_3.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_3.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_3
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_4.input_channels  &
   object_value =   &
      .MODEL_f.Force_input,  &
      .MODEL_f.Torque_input
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_4.output_channels  &
   object_value =   &
      .MODEL_f.rubber_1_sensor_output,  &
      .MODEL_f.rubber_2_sensor_output
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_4.file_name  &
   string_value = "Controls_Plant_4"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_4.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_4.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_4.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_4.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_4.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_4.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_4.host  &
   string_value = "Ali"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_4.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_4.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_4.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_4
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_5.input_channels  &
   object_value =   &
      .MODEL_f.Force_input,  &
      .MODEL_f.Torque_input
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_5.output_channels  &
   object_value =   &
      .MODEL_f.velocity_x_output,  &
      .MODEL_f.angle_output,  &
      .MODEL_f.rubber_1_sensor_output,  &
      .MODEL_f.rubber_2_sensor_output
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_5.file_name  &
   string_value = "Controls_Plant_5"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_5.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_5.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_5.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_5.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_5.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_5.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_5.host  &
   string_value = "Ali"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_5.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_5.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_5.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_5
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_8.input_channels  &
   object_value =   &
      .MODEL_f.Force_input,  &
      .MODEL_f.Torque_input
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_8.output_channels  &
   object_value =   &
      .MODEL_f.angle_output,  &
      .MODEL_f.thp_output,  &
      .MODEL_f.angular_velocity_output,  &
      .MODEL_f.velocity_x_output,  &
      .MODEL_f.rubber_1_sensor_output,  &
      .MODEL_f.rubber_2_sensor_output
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_8.file_name  &
   string_value = "Controls_Plant_8"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_8.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_8.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_8.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_8.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_8.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_8.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_8.host  &
   string_value = "Ali"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_8.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_8.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_8.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_8
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_9.input_channels  &
   object_value =   &
      .MODEL_f.Force_input,  &
      .MODEL_f.Torque_input
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_9.output_channels  &
   object_value =   &
      .MODEL_f.angle_output,  &
      .MODEL_f.thp_output,  &
      .MODEL_f.angular_acc_output,  &
      .MODEL_f.angular_velocity_output,  &
      .MODEL_f.Xrel_output,  &
      .MODEL_f.Vrel_output,  &
      .MODEL_f.Arel_output,  &
      .MODEL_f.disk_angular_velocity_otp,  &
      .MODEL_f.f_prime_opt,  &
      .MODEL_f.N_opt,  &
      .MODEL_f.rubber_1_sensor_output,  &
      .MODEL_f.rubber_2_sensor_output,  &
      .MODEL_f.velocity_x_output,  &
      .MODEL_f.velocity_y_output
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_9.file_name  &
   string_value = "Controls_Plant_9"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_9.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_9.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_9.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_9.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_9.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_9.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_9.host  &
   string_value = "Ali"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_9.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_9.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_9.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_9
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_2.input_channels  &
   object_value =   &
      .MODEL_f.Force_input,  &
      .MODEL_f.Torque_input
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_2.output_channels  &
   object_value =   &
      .MODEL_f.angle_output,  &
      .MODEL_f.thp_output,  &
      .MODEL_f.angular_acc_output,  &
      .MODEL_f.angular_velocity_output,  &
      .MODEL_f.Xrel_output,  &
      .MODEL_f.Vrel_output,  &
      .MODEL_f.Arel_output,  &
      .MODEL_f.disk_angular_velocity_otp,  &
      .MODEL_f.f_prime_opt,  &
      .MODEL_f.N_opt,  &
      .MODEL_f.rubber_1_sensor_output,  &
      .MODEL_f.rubber_2_sensor_output,  &
      .MODEL_f.velocity_x_output,  &
      .MODEL_f.velocity_y_output
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_2.file_name  &
   string_value = "Controls_Plant_2"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_2.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_2.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_2.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_2.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_2.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_2.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_2.host  &
   string_value = "Ali"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_2.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_2.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_2.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_2
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_6.input_channels  &
   object_value =   &
      .MODEL_f.Force_input,  &
      .MODEL_f.Torque_input
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_6.output_channels  &
   object_value =   &
      .MODEL_f.angle_output,  &
      .MODEL_f.thp_output,  &
      .MODEL_f.angular_acc_output,  &
      .MODEL_f.angular_velocity_output,  &
      .MODEL_f.Xrel_output,  &
      .MODEL_f.Vrel_output,  &
      .MODEL_f.Arel_output,  &
      .MODEL_f.disk_angular_velocity_otp,  &
      .MODEL_f.f_prime_opt,  &
      .MODEL_f.N_opt,  &
      .MODEL_f.rubber_1_sensor_output,  &
      .MODEL_f.rubber_2_sensor_output,  &
      .MODEL_f.velocity_x_output,  &
      .MODEL_f.velocity_y_output
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_6.file_name  &
   string_value = "Controls_Plant_6"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_6.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_6.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_6.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_6.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_6.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_6.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_6.host  &
   string_value = "Ali"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_6.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_6.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_6.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_6
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_7.input_channels  &
   object_value =   &
      .MODEL_f.Force_input,  &
      .MODEL_f.Torque_input
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_7.output_channels  &
   object_value =   &
      .MODEL_f.angle_output,  &
      .MODEL_f.thp_output,  &
      .MODEL_f.angular_acc_output,  &
      .MODEL_f.angular_velocity_output,  &
      .MODEL_f.Xrel_output,  &
      .MODEL_f.Vrel_output,  &
      .MODEL_f.Arel_output,  &
      .MODEL_f.disk_angular_velocity_otp,  &
      .MODEL_f.f_prime_opt,  &
      .MODEL_f.N_opt,  &
      .MODEL_f.rubber_1_sensor_output,  &
      .MODEL_f.rubber_2_sensor_output,  &
      .MODEL_f.velocity_x_output,  &
      .MODEL_f.velocity_y_output
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_7.file_name  &
   string_value = "Controls_Plant_7"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_7.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_7.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_7.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_7.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_7.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_7.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_7.host  &
   string_value = "Ali"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_7.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_7.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_7.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_7
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_10.input_channels  &
   object_value =   &
      .MODEL_f.Force_input,  &
      .MODEL_f.Torque_input
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_10.output_channels  &
   object_value =   &
      .MODEL_f.angle_output,  &
      .MODEL_f.thp_output,  &
      .MODEL_f.angular_acc_output,  &
      .MODEL_f.angular_velocity_output,  &
      .MODEL_f.Xrel_output,  &
      .MODEL_f.Vrel_output,  &
      .MODEL_f.Arel_output,  &
      .MODEL_f.disk_angular_velocity_otp,  &
      .MODEL_f.N_opt,  &
      .MODEL_f.f_prime_opt,  &
      .MODEL_f.rubber_1_sensor_output,  &
      .MODEL_f.rubber_2_sensor_output,  &
      .MODEL_f.velocity_x_output,  &
      .MODEL_f.velocity_y_output,  &
      .MODEL_f.V_output
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_10.file_name  &
   string_value = "Controls_Plant_10"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_10.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_10.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_10.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_10.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_10.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_10.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_10.host  &
   string_value = "Ali"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_10.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_10.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_10.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_10
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_11.input_channels  &
   object_value =   &
      .MODEL_f.Force_input,  &
      .MODEL_f.Torque_input
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_11.output_channels  &
   object_value =   &
      .MODEL_f.angle_output,  &
      .MODEL_f.thp_output,  &
      .MODEL_f.angular_acc_output,  &
      .MODEL_f.angular_velocity_output,  &
      .MODEL_f.Xrel_output,  &
      .MODEL_f.Vrel_output,  &
      .MODEL_f.Arel_output,  &
      .MODEL_f.disk_angular_velocity_otp,  &
      .MODEL_f.N_opt,  &
      .MODEL_f.f_prime_opt,  &
      .MODEL_f.rubber_1_sensor_output,  &
      .MODEL_f.rubber_2_sensor_output,  &
      .MODEL_f.velocity_x_output,  &
      .MODEL_f.velocity_y_output,  &
      .MODEL_f.V_output
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_11.file_name  &
   string_value = "Controls_Plant_11"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_11.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_11.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_11.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_11.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_11.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_11.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_11.host  &
   string_value = "Ali"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_11.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_11.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_11.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_11
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_f.TORSION_SPRING_1.i_marker  &
   object_value = (.MODEL_f.ground.MARKER_222)
!
variable modify  &
   variable_name = .MODEL_f.TORSION_SPRING_1.j_marker  &
   object_value = (.MODEL_f.disk_2.MARKER_223)
!
variable modify  &
   variable_name = .MODEL_f.TORSION_SPRING_1.stiffness_mode  &
   string_value = "none"
!
variable modify  &
   variable_name = .MODEL_f.TORSION_SPRING_1.stiffness_coefficient  &
   real_value = (1.0E-002(newton-meter/rad))
!
variable modify  &
   variable_name = .MODEL_f.TORSION_SPRING_1.stiffness_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .MODEL_f.TORSION_SPRING_1.damping_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = .MODEL_f.TORSION_SPRING_1.damping_coefficient  &
   real_value = (3.0E-004(newton-meter-sec/rad))
!
variable modify  &
   variable_name = .MODEL_f.TORSION_SPRING_1.damping_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .MODEL_f.TORSION_SPRING_1.free_angle_mode  &
   string_value = "Design_Angle"
!
variable modify  &
   variable_name = .MODEL_f.TORSION_SPRING_1.free_angle  &
   real_value = 1.0
!
variable modify  &
   variable_name = .MODEL_f.TORSION_SPRING_1.preload  &
   real_value = 0.0
!
variable modify  &
   variable_name = .MODEL_f.TORSION_SPRING_1.i_dynamic_visibility  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_f.TORSION_SPRING_1.j_dynamic_visibility  &
   string_value = "off"
!
ude modify instance  &
   instance_name = .MODEL_f.TORSION_SPRING_1
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_12.input_channels  &
   object_value =   &
      .MODEL_f.Force_input,  &
      .MODEL_f.Torque_input
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_12.output_channels  &
   object_value =   &
      .MODEL_f.angle_output,  &
      .MODEL_f.thp_output,  &
      .MODEL_f.angular_acc_output,  &
      .MODEL_f.angular_velocity_output,  &
      .MODEL_f.Xrel_output,  &
      .MODEL_f.Vrel_output,  &
      .MODEL_f.Arel_output,  &
      .MODEL_f.disk_angular_velocity_otp,  &
      .MODEL_f.N_opt,  &
      .MODEL_f.f_prime_opt,  &
      .MODEL_f.rubber_1_sensor_output,  &
      .MODEL_f.rubber_2_sensor_output,  &
      .MODEL_f.velocity_x_output,  &
      .MODEL_f.velocity_y_output,  &
      .MODEL_f.V_output
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_12.file_name  &
   string_value = "Controls_Plant_12"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_12.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_12.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_12.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_12.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_12.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_12.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_12.host  &
   string_value = "Ali"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_12.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_12.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .MODEL_f.Controls_Plant_12.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_12
!
undo end_block
!
!------------------------------ Dynamic Graphics ------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_f.ground
!
geometry create shape force  &
   force_name = .MODEL_f.SFORCE_3_force_graphic_1  &
   adams_id = 81  &
   force_element_name = .MODEL_f.Force  &
   applied_at_marker_name = .MODEL_f.linearMotor.MARKER_197
!
geometry create shape force  &
   force_name = .MODEL_f.SFORCE_4_force_graphic_1  &
   adams_id = 82  &
   force_element_name = .MODEL_f.Torque  &
   applied_at_marker_name = .MODEL_f.angularMotor.MARKER_199
!
geometry create shape gcontact  &
   contact_force_name = .MODEL_f.GCONTACT_69  &
   adams_id = 69  &
   contact_element_name = .MODEL_f.CONTACT_1  &
   force_display = components
!
geometry attributes  &
   geometry_name = .MODEL_f.GCONTACT_69  &
   color = SKYBLUE
!
geometry create shape gcontact  &
   contact_force_name = .MODEL_f.GCONTACT_80  &
   adams_id = 80  &
   contact_element_name = .MODEL_f.CONTACT_2  &
   force_display = components
!
geometry attributes  &
   geometry_name = .MODEL_f.GCONTACT_80  &
   color = SKYBLUE
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = gravity  &
   x_component_gravity = 0.0  &
   y_component_gravity = -9.80665  &
   z_component_gravity = 0.0
!
force attributes  &
   force_name = .MODEL_f.gravity  &
   visibility = off
!
!----------------------------- Analysis settings ------------------------------!
!
!
!---------------------------------- Measures ----------------------------------!
!
!
measure create object  &
   measure_name = .MODEL_f.contact_sensor_1  &
   from_first = no  &
   object = .MODEL_f.rubber_1  &
   characteristic = cm_position  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_f.contact_sensor_1  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_f.contact_sensor_2  &
   from_first = no  &
   object = .MODEL_f.rubber_2  &
   characteristic = cm_position  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_f.contact_sensor_2  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_f.Velocity_x  &
   from_first = no  &
   object = .MODEL_f.body  &
   characteristic = cm_velocity  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_f.Velocity_x  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_f.body_Vx  &
   from_first = no  &
   object = .MODEL_f.body  &
   characteristic = cm_velocity  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_f.body_Vx  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_f.body_Vy  &
   from_first = no  &
   object = .MODEL_f.body  &
   characteristic = cm_velocity  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_f.body_Vy  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_f.angular_velocity  &
   from_first = no  &
   object = .MODEL_f.body  &
   characteristic = cm_angular_velocity  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_f.angular_velocity  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_f.CONTACT_1_force_x  &
   from_first = yes  &
   object = .MODEL_f.CONTACT_1  &
   coordinate_rframe = .MODEL_f.ground.MARKER_208  &
   characteristic = element_force  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_f.CONTACT_1_force_x  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_f.CONTACT_1_force_y  &
   from_first = yes  &
   object = .MODEL_f.CONTACT_1  &
   coordinate_rframe = .MODEL_f.ground.MARKER_208  &
   characteristic = element_force  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_f.CONTACT_1_force_y  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_f.CONTACT_1_torque  &
   from_first = yes  &
   object = .MODEL_f.CONTACT_1  &
   characteristic = element_torque  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_f.CONTACT_1_torque  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_f.angular_acceleration  &
   from_first = no  &
   object = .MODEL_f.body  &
   characteristic = cm_angular_acceleration  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_f.angular_acceleration  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_f.Velocity_y  &
   from_first = no  &
   object = .MODEL_f.body  &
   characteristic = cm_velocity  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_f.Velocity_y  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_f.V  &
   from_first = no  &
   object = .MODEL_f.body  &
   characteristic = cm_velocity  &
   component = mag_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_f.V  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_f.disk_angular_velocity  &
   from_first = no  &
   object = .MODEL_f.disk_1  &
   characteristic = cm_angular_velocity  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_f.disk_angular_velocity  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_f.MEA_PT2PT_2  &
   from_point = .MODEL_f.linearMotor.MARKER_202  &
   to_point = .MODEL_f.rubber_1.MARKER_92  &
   characteristic = translational_displacement  &
   component = mag_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_f.MEA_PT2PT_2  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_f.MEA_PT2PT  &
   from_point = .MODEL_f.linearMotor.MARKER_202  &
   to_point = .MODEL_f.body.MARKER_203  &
   characteristic = translational_displacement  &
   component = mag_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_f.MEA_PT2PT  &
   color = WHITE
!
measure create function  &
   measure_name = .MODEL_f.thp  &
   function = ""  &
   units = "no_units"  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_f.thp  &
   color = WHITE
!
measure create function  &
   measure_name = .MODEL_f.angle2  &
   function = ""  &
   units = "no_units"  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_f.angle2  &
   color = WHITE
!
measure create function  &
   measure_name = .MODEL_f.Xrel  &
   function = ""  &
   units = "no_units"  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_f.Xrel  &
   color = WHITE
!
measure create function  &
   measure_name = .MODEL_f.Vrel  &
   function = ""  &
   units = "no_units"  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_f.Vrel  &
   color = WHITE
!
measure create function  &
   measure_name = .MODEL_f.Arel  &
   function = ""  &
   units = "no_units"  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_f.Arel  &
   color = WHITE
!
!---------------------------- Adams/View Variables ----------------------------!
!
!
variable create  &
   variable_name = .MODEL_f._model  &
   string_value = ".MODEL_f"
!
!---------------------------- Function definitions ----------------------------!
!
!
data_element modify variable  &
   variable_name = .MODEL_f.Force_input  &
   function = "0"
!
data_element modify variable  &
   variable_name = .MODEL_f.Torque_input  &
   function = "0"
!
data_element modify variable  &
   variable_name = .MODEL_f.rubber_1_sensor_output  &
   function = ".MODEL_f.contact_sensor_1"
!
data_element modify variable  &
   variable_name = .MODEL_f.rubber_2_sensor_output  &
   function = ".MODEL_f.contact_sensor_2"
!
data_element modify variable  &
   variable_name = .MODEL_f.velocity_x_output  &
   function = ".MODEL_f.Velocity_x"
!
data_element modify variable  &
   variable_name = .MODEL_f.angle_output  &
   function = ".MODEL_f.angle2"
!
data_element modify variable  &
   variable_name = .MODEL_f.thp_output  &
   function = ".MODEL_f.thp"
!
data_element modify variable  &
   variable_name = .MODEL_f.angular_velocity_output  &
   function = "-.MODEL_f.angular_velocity"
!
data_element modify variable  &
   variable_name = .MODEL_f.disk_angular_velocity_otp  &
   function = "-.MODEL_f.disk_angular_velocity"
!
data_element modify variable  &
   variable_name = .MODEL_f.f_prime_opt  &
   function = "-(.MODEL_f.CONTACT_1_force_x*COS(.MODEL_f.angle2)-.MODEL_f.CONTACT_1_force_y*SIN(.MODEL_f.angle2))"
!
data_element modify variable  &
   variable_name = .MODEL_f.N_opt  &
   function = "-(.MODEL_f.CONTACT_1_force_y*COS(.MODEL_f.angle2)+.MODEL_f.CONTACT_1_force_x*SIN(.MODEL_f.angle2))"
!
data_element modify variable  &
   variable_name = .MODEL_f.Xrel_output  &
   function = ".MODEL_f.Xrel"
!
data_element modify variable  &
   variable_name = .MODEL_f.Vrel_output  &
   function = ".MODEL_f.Vrel"
!
data_element modify variable  &
   variable_name = .MODEL_f.Arel_output  &
   function = ".MODEL_f.Arel"
!
data_element modify variable  &
   variable_name = .MODEL_f.angular_acc_output  &
   function = "-.MODEL_f.angular_acceleration"
!
data_element modify variable  &
   variable_name = .MODEL_f.velocity_y_output  &
   function = ".MODEL_f.Velocity_y"
!
data_element modify variable  &
   variable_name = .MODEL_f.V_output  &
   function = ".MODEL_f.V"
!
measure modify function  &
   measure_name = .MODEL_f.thp  &
   function = "ATAN( ABS( .MODEL_f.body_Vx )/ABS( .MODEL_f.body_Vy ) )"
!
measure modify function  &
   measure_name = .MODEL_f.angle2  &
   function = "pi/180*(RTOD*AZ(.MODEL_f.ground.MARKER_206,.MODEL_f.body.MARKER_203)-(AINT(AINT(RTOD*AZ(.MODEL_f.ground.MARKER_206,.MODEL_f.body.MARKER_203)/90)/2)+MOD(AINT(RTOD*AZ(.MODEL_f.ground.MARKER_206,.MODEL_f.body.MARKER_203)/90),2))*180)"
!
measure modify function  &
   measure_name = .MODEL_f.Xrel  &
   function = "DY(.MODEL_f.body.MARKER_85,.MODEL_f.bar.MARKER_82,.MODEL_f.body.MARKER_85)-0.0015"
!
measure modify function  &
   measure_name = .MODEL_f.Vrel  &
   function = "VY(.MODEL_f.body.MARKER_85,.MODEL_f.bar.MARKER_82,.MODEL_f.body.MARKER_85)"
!
measure modify function  &
   measure_name = .MODEL_f.Arel  &
   function = "ACCY(.MODEL_f.body.MARKER_85,.MODEL_f.bar.MARKER_82,.MODEL_f.body.MARKER_85)"
!
force modify direct single_component_force  &
   single_component_force_name = .MODEL_f.Force  &
   function = "VARVAL(.MODEL_f.Force_input)"
!
force modify direct single_component_force  &
   single_component_force_name = .MODEL_f.Torque  &
   function = "-VARVAL(.MODEL_f.Torque_input)"
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_f.SPRING_1
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_f.SPRING_2
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_1
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_3
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_4
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_5
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_8
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_9
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_2
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_6
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_7
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_10
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_11
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_f.TORSION_SPRING_1
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_f.Controls_Plant_12
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
geometry modify shape block  &
   block_name = .MODEL_f.ground.BOX_58  &
   diag_corner_coords =   &
      (8meter),  &
      (-5.0E-002meter),  &
      (0.6meter)
!
material modify  &
   material_name = .MODEL_f.steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+011(Newton/meter**2))
!
material modify  &
   material_name = .MODEL_f.cast_iron  &
   density = (7080.0(kg/meter**3))  &
   youngs_modulus = (1.0E+011(Newton/meter**2))
!
material modify  &
   material_name = .MODEL_f.rubber_belt  &
   density = (1.1(kg/meter**3))
!
material modify  &
   material_name = .MODEL_f.aluminum  &
   density = (2740.0(kg/meter**3))  &
   youngs_modulus = (7.1705E+010(Newton/meter**2))
!
geometry modify shape force  &
   force_name = .MODEL_f.SFORCE_3_force_graphic_1  &
   applied_at_marker_name = (.MODEL_f.Force.i)
!
geometry modify shape force  &
   force_name = .MODEL_f.SFORCE_4_force_graphic_1  &
   applied_at_marker_name = (.MODEL_f.Torque.i)
!
model display  &
   model_name = MODEL_f

//POVRay-File creato da 3d41.ulp v1.05
//C:/Programmi/EAGLE-4.16r1/projects/CaricaBatterie/CaricabatterieLite.brd
//22/12/2007 18.08.30 

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 0;
#declare pin_short = on;

#declare environment = on;

#local cam_x = 0;
#local cam_y = 217;
#local cam_z = -116;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -5;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 23;
#local lgt1_pos_y = 34;
#local lgt1_pos_z = 26;
#local lgt1_intense = 0.743793;
#local lgt2_pos_x = -23;
#local lgt2_pos_y = 34;
#local lgt2_pos_z = 26;
#local lgt2_intense = 0.743793;
#local lgt3_pos_x = 23;
#local lgt3_pos_y = 34;
#local lgt3_pos_z = -18;
#local lgt3_intense = 0.743793;
#local lgt4_pos_x = -23;
#local lgt4_pos_y = 34;
#local lgt4_pos_z = -18;
#local lgt4_intense = 0.743793;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 60.630000;
#declare pcb_y_size = 50.561400;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(175);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "tools.inc"
#include "user.inc"

global_settings{charset utf8}

#declare col_brd = texture{pigment{White}}
#declare col_wrs = texture{T_Copper_1A}
#declare col_pds = texture{T_Copper_1A}
#declare col_hls = texture{pigment{Black}}
#declare col_bgr = Gray50;
#declare col_slk = texture{pigment{Blue}}
#declare col_thl = texture{pigment{White}}
#declare col_pol = texture{T_Copper_1A}

#if(environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Dati Animazione
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "Disponibilità di dati non sufficiente per Animazione (min. 3 points) (Percorso per Flight)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "Disponibilità di dati non sufficiente per Animazione (min. 3 points) (Percorso per visione)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//traduce la camera that <0,0,0> is over the Eagle <0,0>
	//translate<-30.315000,0,-25.280700>
}
#end

background{col_bgr}


//Axis uncomment to activate
//object{TOOLS_AXIS_XYZ(100,100,100 //texture{ pigment{rgb<1,0,0>} finish{diffuse 0.8 phong 1}}, //texture{ pigment{rgb<1,1,1>} finish{diffuse 0.8 phong 1}})}

light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro CARICABATTERIELITE(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
//Scheda
box{<61.430000,0,55.011400><0.800000,-1.500000,4.450000> texture{col_brd}}

//Fori(Real)/Componenti
cylinder{<-1.676400,1,43.688000><-1.676400,-5,43.688000>1.651000 texture{col_hls}}
//Fori(Real)/Scheda
//Fori(Real)/Via
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Componenti
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.1uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<39.370000,0.000000,46.990000>}#end		//ceramic disc capacitator C1 0.1uF C050-025X075
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.1uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<39.370000,0.000000,39.370000>}#end		//ceramic disc capacitator C2 0.1uF C050-025X075
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_DIS_DO41_102MM_H("1N4001",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<24.130000,0.000000,20.320000>}#end		//Diode DO35 10mm hor. D1 1N4001 DO41-10
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {TR_TO220_L2("317TB",)translate<0,0,-6.2> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<3.149600,0.000000,43.688000>}#end		//TO220 Horizontal IC1 317TB TO220H
#ifndef(pack_LED1) #declare global_pack_LED1=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<27.940000,0.000000,41.910000>}#end		//Diskrete 5MM LED LED1 RED LED5MM
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<40.640000,0.000000,35.560000>}#end		//Discrete Resistor 0,3W 10MM Grid R1 470 0207/10
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<39.370000,0.000000,43.180000>}#end		//Discrete Resistor 0,3W 10MM Grid R3 470 0207/10
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<31.750000,0.000000,34.290000>}#end		//Discrete Resistor 0,3W 10MM Grid R4 470 0207/10
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_DIS_TRIM_PT10_H_10("470",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<54.838600,0.000000,31.394400>}#end		//PT10 R5 470 PT-10
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<31.750000,0.000000,16.510000>}#end		//Discrete Resistor 0,3W 10MM Grid R6 47 0207/10
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<27.940000,0.000000,16.510000>}#end		//Discrete Resistor 0,3W 10MM Grid R7 47 0207/10
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<41.910000,0.000000,33.020000>}#end		//Discrete Resistor 0,3W 10MM Grid R8 47 0207/10
#ifndef(pack_R10) #declare global_pack_R10=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<41.910000,0.000000,28.270200>}#end		//Discrete Resistor 0,3W 10MM Grid R10 1K 0207/10
#ifndef(pack_R16) #declare global_pack_R16=yes; object {RES_DIS_0617_22MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Green*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<36.830000,0.000000,19.050000>}#end		//Discrete Resistor 1W 900mil R16 1 ohm 1W 0411/15
#ifndef(pack_T1) #declare global_pack_T1=yes; object {TR_TO18("2N2222A",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<26.670000,0.000000,34.290000>}#end		//TO18 T1 2N2222A TO18
#ifndef(pack_T2) #declare global_pack_T2=yes; object {TR_TO18("2N2222A",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<51.638200,0.000000,44.450000>}#end		//TO18 T2 2N2222A TO18
#ifndef(pack_X1) #declare global_pack_X1=yes; object {ARK_350MM_2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<52.070000,0.000000,16.510000>}#end		//connector X1  AK300/2
#ifndef(pack_X2) #declare global_pack_X2=yes; object {ARK_350MM_2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<13.970000,0.000000,16.510000>}#end		//connector X2  AK300/2
}//End union
#end
#if(pcb_pads_smds=on)
//Piazzole&SMD/Componenti
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<36.830000,0,46.990000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<41.910000,0,46.990000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<36.830000,0,39.370000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<41.910000,0,39.370000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<24.130000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<24.130000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<13.309600,0,41.148000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<13.309600,0,43.688000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<13.309600,0,46.228000> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<27.940000,0,43.180000> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<27.940000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<45.720000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<35.560000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<44.450000,0,43.180000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<34.290000,0,43.180000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<31.750000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<31.750000,0,39.370000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,1.016000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<52.298600,0,26.314400> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,1.016000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<57.378600,0,26.314400> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,1.016000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<54.838600,0,36.474400> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<31.750000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<31.750000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<27.940000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<27.940000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<46.990000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<36.830000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<36.830000,0,28.270200> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<46.990000,0,28.270200> texture{col_thl}}
#ifndef(global_pack_R16) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<36.830000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_R16) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<36.830000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<25.400000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<27.940000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<27.940000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<50.368200,0,43.180000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<52.908200,0,43.180000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<52.908200,0,45.720000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<49.555400,0,16.510000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<54.559200,0,16.510000> texture{col_thl}}
#ifndef(global_pack_X2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<11.455400,0,16.510000> texture{col_thl}}
#ifndef(global_pack_X2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<16.459200,0,16.510000> texture{col_thl}}
//Piazzole/Via
object{TOOLS_PCB_VIA(1.422400,0.500000,1,16,2,0) translate<13.335000,0,46.253400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<36.753800,0,39.370000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.422400,0.500000,1,16,2,0) translate<13.335000,0,43.713400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<25.400000,0,32.994600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,0,0) translate<47.345600,0,48.260000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,0,0) translate<47.345600,0,43.180000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,0,0) translate<47.421800,0,48.234600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,0,0) translate<47.548800,0,43.281600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.422400,0.500000,1,16,2,0) translate<13.360400,0,41.173400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<36.830000,0,26.720800> texture{col_thl}}
object{TOOLS_PCB_VIA(3.810000,0.500000,1,16,2,0) translate<11.023600,0,16.408400> texture{col_thl}}
object{TOOLS_PCB_VIA(3.810000,0.500000,1,16,2,0) translate<16.865600,0,16.408400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<36.804600,0,11.404600> texture{col_thl}}
object{TOOLS_PCB_VIA(3.810000,0.500000,1,16,2,0) translate<54.965600,0,16.357600> texture{col_thl}}
object{TOOLS_PCB_VIA(3.810000,0.500000,1,16,2,0) translate<49.225200,0,16.357600> texture{col_thl}}
object{TOOLS_PCB_VIA(2.184400,0.500000,1,16,2,0) translate<52.273200,0,26.339800> texture{col_thl}}
object{TOOLS_PCB_VIA(2.184400,0.500000,1,16,2,0) translate<57.277000,0,26.339800> texture{col_thl}}
object{TOOLS_PCB_VIA(2.184400,0.500000,1,16,2,0) translate<54.813200,0,36.449000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<50.215800,0,43.154600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<52.959000,0,43.180000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<52.933600,0,45.770800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<41.935400,0,39.395400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<41.910000,0,47.015400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<35.560000,0,35.534600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<45.720000,0,35.585400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<47.015400,0,33.070800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<36.906200,0,33.045400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<36.855400,0,28.295600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<47.040800,0,28.244800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<31.699200,0,29.210000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<31.699200,0,21.513800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<27.965400,0,21.513800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<31.750000,0,11.404600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<27.965400,0,11.353800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,1,0) translate<24.104600,0,15.240000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,1,0) translate<24.104600,0,25.298400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<27.914600,0,33.020000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<27.940000,0,35.534600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<31.750000,0,39.395400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<27.940000,0,40.665400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<27.914600,0,43.205400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<44.424600,0,43.154600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<36.830000,0,47.040800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<34.239200,0,43.154600> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Segnali
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.518400,-1.535000,42.595800>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.518400,-1.535000,50.952400>}
box{<0,0,-0.635000><8.356600,0.035000,0.635000> rotate<0,90.000000,0> translate<7.518400,-1.535000,50.952400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.518400,-1.535000,50.952400>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.585200,-1.535000,52.070000>}
box{<0,0,-0.635000><1.545022,0.035000,0.635000> rotate<0,-46.329162,0> translate<7.518400,-1.535000,50.952400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.518400,-1.535000,42.595800>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.940800,-1.535000,41.148000>}
box{<0,0,-0.635000><2.029617,0.035000,0.635000> rotate<0,45.504026,0> translate<7.518400,-1.535000,42.595800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,-1.535000,44.450000>}
box{<0,0,-0.635000><3.810000,0.035000,0.635000> rotate<0,-90.000000,0> translate<10.160000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.922000,-1.535000,43.688000>}
box{<0,0,-0.635000><1.077631,0.035000,0.635000> rotate<0,44.997030,0> translate<10.160000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.430000,-1.535000,49.530000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,-44.997030,0> translate<10.160000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.455400,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.455400,-1.535000,21.615400>}
box{<0,0,-0.635000><5.105400,0.035000,0.635000> rotate<0,90.000000,0> translate<11.455400,-1.535000,21.615400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.455400,-1.535000,21.615400>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<12.700000,-1.535000,22.860000>}
box{<0,0,-0.635000><1.760130,0.035000,0.635000> rotate<0,-44.997030,0> translate<11.455400,-1.535000,21.615400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.940800,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<13.309600,-1.535000,41.148000>}
box{<0,0,-0.635000><4.368800,0.035000,0.635000> rotate<0,0.000000,0> translate<8.940800,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.922000,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<13.309600,-1.535000,43.688000>}
box{<0,0,-0.635000><2.387600,0.035000,0.635000> rotate<0,0.000000,0> translate<10.922000,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.131800,-1.535000,46.253400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.309600,-1.535000,46.228000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,8.129566,0> translate<13.131800,-1.535000,46.253400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.131800,-1.535000,46.253400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.919200,-1.535000,46.228000>}
box{<0,0,-0.406400><0.787810,0.035000,0.406400> rotate<0,1.847488,0> translate<13.131800,-1.535000,46.253400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<12.700000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<17.780000,-1.535000,22.860000>}
box{<0,0,-0.635000><5.080000,0.035000,0.635000> rotate<0,0.000000,0> translate<12.700000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<13.919200,-1.535000,46.228000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<19.024600,-1.535000,46.228000>}
box{<0,0,-0.635000><5.105400,0.035000,0.635000> rotate<0,0.000000,0> translate<13.919200,-1.535000,46.228000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<17.780000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<19.050000,-1.535000,24.130000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,-44.997030,0> translate<17.780000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<19.024600,-1.535000,46.228000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<19.050000,-1.535000,24.130000>}
box{<0,0,-0.635000><22.098015,0.035000,0.635000> rotate<0,89.928208,0> translate<19.024600,-1.535000,46.228000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<16.459200,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.320000,-1.535000,16.510000>}
box{<0,0,-0.635000><3.860800,0.035000,0.635000> rotate<0,0.000000,0> translate<16.459200,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.320000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<21.590000,-1.535000,17.780000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,-44.997030,0> translate<20.320000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<21.590000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<21.590000,-1.535000,24.130000>}
box{<0,0,-0.635000><6.350000,0.035000,0.635000> rotate<0,90.000000,0> translate<21.590000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<21.590000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<22.860000,-1.535000,25.400000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,-44.997030,0> translate<21.590000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<22.860000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<24.130000,-1.535000,25.400000>}
box{<0,0,-0.635000><1.270000,0.035000,0.635000> rotate<0,0.000000,0> translate<22.860000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<24.130000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<25.400000,-1.535000,26.670000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,-44.997030,0> translate<24.130000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<25.400000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<25.400000,-1.535000,32.994600>}
box{<0,0,-0.635000><6.324600,0.035000,0.635000> rotate<0,90.000000,0> translate<25.400000,-1.535000,32.994600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,-1.535000,32.994600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,-1.535000,33.020000>}
box{<0,0,-0.203200><0.025400,0.035000,0.203200> rotate<0,90.000000,0> translate<25.400000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<19.024600,-1.535000,46.228000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<26.212800,-1.535000,46.228000>}
box{<0,0,-0.635000><7.188200,0.035000,0.635000> rotate<0,0.000000,0> translate<19.024600,-1.535000,46.228000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<24.130000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<26.670000,-1.535000,25.400000>}
box{<0,0,-0.635000><2.540000,0.035000,0.635000> rotate<0,0.000000,0> translate<24.130000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<24.130000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.940000,-1.535000,11.430000>}
box{<0,0,-0.635000><5.388154,0.035000,0.635000> rotate<0,44.997030,0> translate<24.130000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.940000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.940000,-1.535000,21.590000>}
box{<0,0,-0.635000><2.540000,0.035000,0.635000> rotate<0,-90.000000,0> translate<27.940000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<26.670000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.940000,-1.535000,24.130000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,44.997030,0> translate<26.670000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.940000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.940000,-1.535000,33.020000>}
box{<0,0,-0.635000><5.080000,0.035000,0.635000> rotate<0,90.000000,0> translate<27.940000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.940000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.940000,-1.535000,43.180000>}
box{<0,0,-0.635000><1.270000,0.035000,0.635000> rotate<0,-90.000000,0> translate<27.940000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<26.212800,-1.535000,46.228000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.940000,-1.535000,44.450000>}
box{<0,0,-0.635000><2.478811,0.035000,0.635000> rotate<0,45.827291,0> translate<26.212800,-1.535000,46.228000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.940000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<29.210000,-1.535000,26.670000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,44.997030,0> translate<27.940000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.940000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<29.210000,-1.535000,39.370000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,44.997030,0> translate<27.940000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<29.210000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<30.480000,-1.535000,26.670000>}
box{<0,0,-0.635000><1.270000,0.035000,0.635000> rotate<0,0.000000,0> translate<29.210000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.940000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<30.480000,-1.535000,35.560000>}
box{<0,0,-0.635000><2.540000,0.035000,0.635000> rotate<0,0.000000,0> translate<27.940000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.940000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.064200,-1.535000,43.180000>}
box{<0,0,-0.406400><3.124200,0.035000,0.406400> rotate<0,0.000000,0> translate<27.940000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.940000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<31.750000,-1.535000,11.430000>}
box{<0,0,-0.635000><3.810000,0.035000,0.635000> rotate<0,0.000000,0> translate<27.940000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<30.480000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<31.750000,-1.535000,25.400000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,44.997030,0> translate<30.480000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<31.750000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<31.750000,-1.535000,25.400000>}
box{<0,0,-0.635000><3.810000,0.035000,0.635000> rotate<0,90.000000,0> translate<31.750000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<30.480000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<31.750000,-1.535000,34.290000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,44.997030,0> translate<30.480000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<31.750000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<31.750000,-1.535000,34.290000>}
box{<0,0,-0.635000><5.080000,0.035000,0.635000> rotate<0,90.000000,0> translate<31.750000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<29.210000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<31.750000,-1.535000,39.370000>}
box{<0,0,-0.635000><2.540000,0.035000,0.635000> rotate<0,0.000000,0> translate<29.210000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.430000,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<33.020000,-1.535000,49.530000>}
box{<0,0,-0.635000><21.590000,0.035000,0.635000> rotate<0,0.000000,0> translate<11.430000,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<34.290000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<34.290000,-1.535000,34.290000>}
box{<0,0,-0.635000><17.780000,0.035000,0.635000> rotate<0,90.000000,0> translate<34.290000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<33.020000,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<34.290000,-1.535000,48.260000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,44.997030,0> translate<33.020000,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<34.290000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<34.290000,-1.535000,48.260000>}
box{<0,0,-0.635000><5.080000,0.035000,0.635000> rotate<0,90.000000,0> translate<34.290000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.064200,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.874200,-1.535000,39.370000>}
box{<0,0,-0.406400><5.388154,0.035000,0.406400> rotate<0,44.997030,0> translate<31.064200,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<34.290000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<35.534600,-1.535000,15.265400>}
box{<0,0,-0.635000><1.760130,0.035000,0.635000> rotate<0,44.997030,0> translate<34.290000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<34.290000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<35.560000,-1.535000,35.560000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,-44.997030,0> translate<34.290000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.585200,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<35.560000,-1.535000,52.070000>}
box{<0,0,-0.635000><26.974800,0.035000,0.635000> rotate<0,0.000000,0> translate<8.585200,-1.535000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.874200,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.753800,-1.535000,39.370000>}
box{<0,0,-0.406400><1.879600,0.035000,0.406400> rotate<0,0.000000,0> translate<34.874200,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<31.750000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,11.430000>}
box{<0,0,-0.635000><5.080000,0.035000,0.635000> rotate<0,0.000000,0> translate<31.750000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,26.670000>}
box{<0,0,-0.635000><3.810000,0.035000,0.635000> rotate<0,90.000000,0> translate<36.830000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,26.720800>}
box{<0,0,-0.635000><0.050800,0.035000,0.635000> rotate<0,90.000000,0> translate<36.830000,-1.535000,26.720800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,26.720800>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,28.270200>}
box{<0,0,-0.635000><1.549400,0.035000,0.635000> rotate<0,90.000000,0> translate<36.830000,-1.535000,28.270200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,28.270200>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,30.480000>}
box{<0,0,-0.635000><2.209800,0.035000,0.635000> rotate<0,90.000000,0> translate<36.830000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,33.020000>}
box{<0,0,-0.635000><2.540000,0.035000,0.635000> rotate<0,90.000000,0> translate<36.830000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.753800,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.830000,-1.535000,39.370000>}
box{<0,0,-0.406400><0.076200,0.035000,0.406400> rotate<0,0.000000,0> translate<36.753800,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,48.514000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,46.990000>}
box{<0,0,-0.635000><1.524000,0.035000,0.635000> rotate<0,-90.000000,0> translate<36.830000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,50.088800>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,48.514000>}
box{<0,0,-0.635000><1.574800,0.035000,0.635000> rotate<0,-90.000000,0> translate<36.830000,-1.535000,48.514000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,50.088800>}
box{<0,0,-0.635000><0.711200,0.035000,0.635000> rotate<0,-90.000000,0> translate<36.830000,-1.535000,50.088800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<35.560000,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,50.800000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,44.997030,0> translate<35.560000,-1.535000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<38.100000,-1.535000,21.590000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,44.997030,0> translate<36.830000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<35.560000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<38.100000,-1.535000,35.560000>}
box{<0,0,-0.635000><2.540000,0.035000,0.635000> rotate<0,0.000000,0> translate<35.560000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<34.290000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<38.100000,-1.535000,43.180000>}
box{<0,0,-0.635000><3.810000,0.035000,0.635000> rotate<0,0.000000,0> translate<34.290000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<38.100000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<39.370000,-1.535000,36.830000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,-44.997030,0> translate<38.100000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<38.100000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<39.370000,-1.535000,41.910000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,44.997030,0> translate<38.100000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<39.370000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<39.370000,-1.535000,41.910000>}
box{<0,0,-0.635000><5.080000,0.035000,0.635000> rotate<0,90.000000,0> translate<39.370000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<41.910000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<41.910000,-1.535000,39.370000>}
box{<0,0,-0.635000><5.080000,0.035000,0.635000> rotate<0,90.000000,0> translate<41.910000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<41.910000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<41.910000,-1.535000,46.990000>}
box{<0,0,-0.635000><7.620000,0.035000,0.635000> rotate<0,90.000000,0> translate<41.910000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<41.910000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<43.180000,-1.535000,33.020000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,44.997030,0> translate<41.910000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,50.088800>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<43.459400,-1.535000,50.088800>}
box{<0,0,-0.635000><6.629400,0.035000,0.635000> rotate<0,0.000000,0> translate<36.830000,-1.535000,50.088800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<44.450000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<44.450000,-1.535000,36.830000>}
box{<0,0,-0.635000><6.350000,0.035000,0.635000> rotate<0,-90.000000,0> translate<44.450000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<44.450000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<44.450000,-1.535000,43.180000>}
box{<0,0,-0.635000><2.540000,0.035000,0.635000> rotate<0,-90.000000,0> translate<44.450000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<44.450000,-1.535000,49.098200>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<44.450000,-1.535000,45.720000>}
box{<0,0,-0.635000><3.378200,0.035000,0.635000> rotate<0,-90.000000,0> translate<44.450000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<43.459400,-1.535000,50.088800>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<44.450000,-1.535000,49.098200>}
box{<0,0,-0.635000><1.400920,0.035000,0.635000> rotate<0,44.997030,0> translate<43.459400,-1.535000,50.088800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<44.450000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<45.720000,-1.535000,35.560000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,44.997030,0> translate<44.450000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<43.180000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<46.990000,-1.535000,33.020000>}
box{<0,0,-0.635000><3.810000,0.035000,0.635000> rotate<0,0.000000,0> translate<43.180000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.345600,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.345600,0.000000,43.180000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.345600,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<46.990000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<48.056800,-1.535000,33.020000>}
box{<0,0,-0.635000><1.066800,0.035000,0.635000> rotate<0,0.000000,0> translate<46.990000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<35.534600,-1.535000,15.265400>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<48.234600,-1.535000,15.265400>}
box{<0,0,-0.635000><12.700000,0.035000,0.635000> rotate<0,0.000000,0> translate<35.534600,-1.535000,15.265400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.234600,-1.535000,15.265400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,-1.535000,15.240000>}
box{<0,0,-0.203200><0.035921,0.035000,0.203200> rotate<0,44.997030,0> translate<48.234600,-1.535000,15.265400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<48.056800,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<48.844200,-1.535000,33.807400>}
box{<0,0,-0.635000><1.113552,0.035000,0.635000> rotate<0,-44.997030,0> translate<48.056800,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<48.844200,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<48.844200,-1.535000,33.807400>}
box{<0,0,-0.635000><9.372600,0.035000,0.635000> rotate<0,-90.000000,0> translate<48.844200,-1.535000,33.807400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<47.345600,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<48.920400,-1.535000,43.180000>}
box{<0,0,-0.635000><1.574800,0.035000,0.635000> rotate<0,0.000000,0> translate<47.345600,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.844200,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.920400,-1.535000,43.180000>}
box{<0,0,-0.203200><0.076200,0.035000,0.203200> rotate<0,0.000000,0> translate<48.844200,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<48.260000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<49.555400,-1.535000,16.510000>}
box{<0,0,-0.635000><1.814101,0.035000,0.635000> rotate<0,-44.429801,0> translate<48.260000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<48.920400,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<50.368200,-1.535000,43.180000>}
box{<0,0,-0.635000><1.447800,0.035000,0.635000> rotate<0,0.000000,0> translate<48.920400,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<46.990000,-1.535000,28.270200>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<50.520600,-1.535000,28.270200>}
box{<0,0,-0.635000><3.530600,0.035000,0.635000> rotate<0,0.000000,0> translate<46.990000,-1.535000,28.270200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<50.800000,-1.535000,30.480000>}
box{<0,0,-0.635000><13.970000,0.035000,0.635000> rotate<0,0.000000,0> translate<36.830000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<50.800000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.070000,-1.535000,31.750000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,-44.997030,0> translate<50.800000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.070000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.070000,-1.535000,40.208200>}
box{<0,0,-0.635000><8.458200,0.035000,0.635000> rotate<0,90.000000,0> translate<52.070000,-1.535000,40.208200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.298600,-1.535000,26.441400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.298600,-1.535000,26.314400>}
box{<0,0,-0.406400><0.127000,0.035000,0.406400> rotate<0,-90.000000,0> translate<52.298600,-1.535000,26.314400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<50.520600,-1.535000,28.270200>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.298600,-1.535000,26.441400>}
box{<0,0,-0.635000><2.550646,0.035000,0.635000> rotate<0,45.803906,0> translate<50.520600,-1.535000,28.270200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.070000,-1.535000,40.208200>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.908200,-1.535000,41.071800>}
box{<0,0,-0.635000><1.203488,0.035000,0.635000> rotate<0,-45.852071,0> translate<52.070000,-1.535000,40.208200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.908200,-1.535000,41.071800>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.908200,-1.535000,43.180000>}
box{<0,0,-0.635000><2.108200,0.035000,0.635000> rotate<0,90.000000,0> translate<52.908200,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<44.450000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.908200,-1.535000,45.720000>}
box{<0,0,-0.635000><8.458200,0.035000,0.635000> rotate<0,0.000000,0> translate<44.450000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<38.100000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<53.340000,-1.535000,21.590000>}
box{<0,0,-0.635000><15.240000,0.035000,0.635000> rotate<0,0.000000,0> translate<38.100000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<54.559200,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<54.559200,-1.535000,16.510000>}
box{<0,0,-0.635000><1.270000,0.035000,0.635000> rotate<0,-90.000000,0> translate<54.559200,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.559200,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.559200,-1.535000,17.830800>}
box{<0,0,-0.406400><0.050800,0.035000,0.406400> rotate<0,90.000000,0> translate<54.559200,-1.535000,17.830800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<54.559200,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<54.610000,-1.535000,17.780000>}
box{<0,0,-0.635000><0.050800,0.035000,0.635000> rotate<0,0.000000,0> translate<54.559200,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<54.610000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<54.610000,-1.535000,17.780000>}
box{<0,0,-0.635000><2.540000,0.035000,0.635000> rotate<0,-90.000000,0> translate<54.610000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<53.340000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<54.610000,-1.535000,20.320000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,44.997030,0> translate<53.340000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.908200,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<54.610000,-1.535000,45.720000>}
box{<0,0,-0.635000><1.701800,0.035000,0.635000> rotate<0,0.000000,0> translate<52.908200,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<54.838600,-1.535000,36.474400>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<55.524400,-1.535000,36.474400>}
box{<0,0,-0.635000><0.685800,0.035000,0.635000> rotate<0,0.000000,0> translate<54.838600,-1.535000,36.474400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<55.524400,-1.535000,36.474400>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<55.880000,-1.535000,36.830000>}
box{<0,0,-0.635000><0.502894,0.035000,0.635000> rotate<0,-44.997030,0> translate<55.524400,-1.535000,36.474400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<55.880000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<55.880000,-1.535000,36.830000>}
box{<0,0,-0.635000><7.620000,0.035000,0.635000> rotate<0,-90.000000,0> translate<55.880000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<54.610000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<55.880000,-1.535000,44.450000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,44.997030,0> translate<54.610000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<57.378600,-1.535000,35.331400>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<57.378600,-1.535000,26.314400>}
box{<0,0,-0.635000><9.017000,0.035000,0.635000> rotate<0,-90.000000,0> translate<57.378600,-1.535000,26.314400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<55.880000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<57.378600,-1.535000,35.331400>}
box{<0,0,-0.635000><2.119340,0.035000,0.635000> rotate<0,44.997030,0> translate<55.880000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.830000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<58.420000,-1.535000,11.430000>}
box{<0,0,-0.635000><21.590000,0.035000,0.635000> rotate<0,0.000000,0> translate<36.830000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<47.345600,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<58.420000,-1.535000,48.260000>}
box{<0,0,-0.635000><11.074400,0.035000,0.635000> rotate<0,0.000000,0> translate<47.345600,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<58.420000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<59.690000,-1.535000,12.700000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,-44.997030,0> translate<58.420000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<58.420000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<59.690000,-1.535000,46.990000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,44.997030,0> translate<58.420000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<59.690000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<59.690000,-1.535000,46.990000>}
box{<0,0,-0.635000><34.290000,0.035000,0.635000> rotate<0,90.000000,0> translate<59.690000,-1.535000,46.990000> }
//Text
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,18.674700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.154700,-1.535000,18.674700>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<6.527800,-1.535000,18.674700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.154700,-1.535000,18.674700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,19.217000>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,44.997030,0> translate<7.612400,-1.535000,19.217000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,19.217000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.154700,-1.535000,19.759300>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,-44.997030,0> translate<7.612400,-1.535000,19.217000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.154700,-1.535000,19.759300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,19.759300>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<6.527800,-1.535000,19.759300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,20.311800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,20.582900>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<7.612400,-1.535000,20.582900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,20.582900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,20.582900>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<6.527800,-1.535000,20.582900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,20.311800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,20.854100>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<6.527800,-1.535000,20.854100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.425900,-1.535000,20.582900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.154700,-1.535000,20.582900>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,0.000000,0> translate<8.154700,-1.535000,20.582900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,21.403200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,21.403200>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<6.527800,-1.535000,21.403200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,21.403200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,22.216600>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,90.000000,0> translate<7.612400,-1.535000,22.216600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,22.216600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.341200,-1.535000,22.487800>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<7.341200,-1.535000,22.487800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.341200,-1.535000,22.487800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,22.487800>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<6.527800,-1.535000,22.487800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,23.040300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,23.311400>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<7.612400,-1.535000,23.311400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,23.311400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,23.311400>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<6.527800,-1.535000,23.311400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,23.040300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,23.582600>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<6.527800,-1.535000,23.582600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.425900,-1.535000,23.311400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.154700,-1.535000,23.311400>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,0.000000,0> translate<8.154700,-1.535000,23.311400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,24.131700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,24.945100>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,90.000000,0> translate<6.527800,-1.535000,24.945100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,24.945100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.798900,-1.535000,25.216300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<6.527800,-1.535000,24.945100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.798900,-1.535000,25.216300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.070100,-1.535000,24.945100>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<6.798900,-1.535000,25.216300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.070100,-1.535000,24.945100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.070100,-1.535000,24.402800>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<7.070100,-1.535000,24.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.070100,-1.535000,24.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.341200,-1.535000,24.131700>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<7.070100,-1.535000,24.402800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.341200,-1.535000,24.131700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,24.402800>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<7.341200,-1.535000,24.131700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,24.402800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,25.216300>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,90.000000,0> translate<7.612400,-1.535000,25.216300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,25.768800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.798900,-1.535000,25.768800>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<6.798900,-1.535000,25.768800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.798900,-1.535000,25.768800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,26.039900>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<6.527800,-1.535000,26.039900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,26.039900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,26.853400>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,90.000000,0> translate<6.527800,-1.535000,26.853400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,26.853400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,26.853400>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<6.527800,-1.535000,26.853400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,27.405900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,27.405900>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<6.527800,-1.535000,27.405900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,27.405900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,27.677000>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<7.612400,-1.535000,27.677000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,27.677000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.341200,-1.535000,27.948200>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<7.341200,-1.535000,27.948200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.341200,-1.535000,27.948200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,27.948200>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<6.527800,-1.535000,27.948200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.341200,-1.535000,27.948200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,28.219300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<7.341200,-1.535000,27.948200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,28.219300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.341200,-1.535000,28.490500>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<7.341200,-1.535000,28.490500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.341200,-1.535000,28.490500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,28.490500>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<6.527800,-1.535000,28.490500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,29.314100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,29.856400>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<6.527800,-1.535000,29.856400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,29.856400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.798900,-1.535000,30.127600>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<6.527800,-1.535000,29.856400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.798900,-1.535000,30.127600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.341200,-1.535000,30.127600>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<6.798900,-1.535000,30.127600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.341200,-1.535000,30.127600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,29.856400>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<7.341200,-1.535000,30.127600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,29.856400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,29.314100>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<7.612400,-1.535000,29.314100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,29.314100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.341200,-1.535000,29.043000>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<7.341200,-1.535000,29.043000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.341200,-1.535000,29.043000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.798900,-1.535000,29.043000>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<6.798900,-1.535000,29.043000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.798900,-1.535000,29.043000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,29.314100>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<6.527800,-1.535000,29.314100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,30.680100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.798900,-1.535000,30.680100>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<6.527800,-1.535000,30.680100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.798900,-1.535000,30.680100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.798900,-1.535000,30.951200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<6.798900,-1.535000,30.951200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.798900,-1.535000,30.951200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,30.951200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<6.527800,-1.535000,30.951200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,30.951200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,30.680100>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<6.527800,-1.535000,30.680100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,31.498600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,31.498600>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<6.527800,-1.535000,31.498600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,31.498600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,32.312000>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,90.000000,0> translate<7.612400,-1.535000,32.312000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,32.312000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.341200,-1.535000,32.583200>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<7.341200,-1.535000,32.583200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.341200,-1.535000,32.583200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,32.583200>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<6.527800,-1.535000,32.583200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,33.949100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,33.406800>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<6.527800,-1.535000,33.406800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,33.406800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.798900,-1.535000,33.135700>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<6.527800,-1.535000,33.406800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.798900,-1.535000,33.135700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.341200,-1.535000,33.135700>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<6.798900,-1.535000,33.135700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.341200,-1.535000,33.135700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,33.406800>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<7.341200,-1.535000,33.135700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,33.406800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,33.949100>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<7.612400,-1.535000,33.949100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,33.949100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.341200,-1.535000,34.220300>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<7.341200,-1.535000,34.220300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.341200,-1.535000,34.220300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.070100,-1.535000,34.220300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<7.070100,-1.535000,34.220300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.070100,-1.535000,34.220300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.070100,-1.535000,33.135700>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,-90.000000,0> translate<7.070100,-1.535000,33.135700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.883600,-1.535000,35.043900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.798900,-1.535000,35.043900>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,0.000000,0> translate<6.798900,-1.535000,35.043900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.798900,-1.535000,35.043900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.527800,-1.535000,35.315100>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<6.527800,-1.535000,35.315100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,34.772800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.612400,-1.535000,35.315100>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<7.612400,-1.535000,35.315100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.268500,-1.535000,15.724000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,15.724000>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<2.641600,-1.535000,15.724000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,15.724000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,16.808600>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<2.641600,-1.535000,16.808600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,17.361100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,17.632200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<3.726200,-1.535000,17.632200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,17.632200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,17.632200>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<2.641600,-1.535000,17.632200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,17.361100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,17.903400>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<2.641600,-1.535000,17.903400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.539700,-1.535000,17.632200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.268500,-1.535000,17.632200>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,0.000000,0> translate<4.268500,-1.535000,17.632200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.455000,-1.535000,18.452500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.455000,-1.535000,19.537100>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<3.455000,-1.535000,19.537100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,20.089600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.268500,-1.535000,20.089600>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<2.641600,-1.535000,20.089600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.268500,-1.535000,20.089600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.268500,-1.535000,20.903000>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,90.000000,0> translate<4.268500,-1.535000,20.903000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.268500,-1.535000,20.903000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.997400,-1.535000,21.174200>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<3.997400,-1.535000,21.174200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.997400,-1.535000,21.174200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.455000,-1.535000,21.174200>}
box{<0,0,-0.076200><0.542400,0.035000,0.076200> rotate<0,0.000000,0> translate<3.455000,-1.535000,21.174200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.455000,-1.535000,21.174200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.183900,-1.535000,20.903000>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<3.183900,-1.535000,20.903000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.183900,-1.535000,20.903000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.183900,-1.535000,20.089600>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,-90.000000,0> translate<3.183900,-1.535000,20.089600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,21.997800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,22.540100>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<2.641600,-1.535000,22.540100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,22.540100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.912700,-1.535000,22.811300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<2.641600,-1.535000,22.540100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.912700,-1.535000,22.811300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.455000,-1.535000,22.811300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<2.912700,-1.535000,22.811300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.455000,-1.535000,22.811300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,22.540100>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<3.455000,-1.535000,22.811300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,22.540100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,21.997800>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<3.726200,-1.535000,21.997800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,21.997800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.455000,-1.535000,21.726700>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<3.455000,-1.535000,21.726700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.455000,-1.535000,21.726700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.912700,-1.535000,21.726700>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<2.912700,-1.535000,21.726700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.912700,-1.535000,21.726700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,21.997800>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<2.641600,-1.535000,21.997800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.997400,-1.535000,26.085500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.268500,-1.535000,25.814300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<3.997400,-1.535000,26.085500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.268500,-1.535000,25.814300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.268500,-1.535000,25.272000>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<4.268500,-1.535000,25.272000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.268500,-1.535000,25.272000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.997400,-1.535000,25.000900>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<3.997400,-1.535000,25.000900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.997400,-1.535000,25.000900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.912700,-1.535000,25.000900>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,0.000000,0> translate<2.912700,-1.535000,25.000900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.912700,-1.535000,25.000900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,25.272000>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<2.641600,-1.535000,25.272000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,25.272000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,25.814300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<2.641600,-1.535000,25.814300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,25.814300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.912700,-1.535000,26.085500>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<2.641600,-1.535000,25.814300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.268500,-1.535000,26.638000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,26.638000>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<2.641600,-1.535000,26.638000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.455000,-1.535000,26.638000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,26.909100>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<3.455000,-1.535000,26.638000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,26.909100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,27.451400>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<3.726200,-1.535000,27.451400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,27.451400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.455000,-1.535000,27.722600>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<3.455000,-1.535000,27.722600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.455000,-1.535000,27.722600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,27.722600>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<2.641600,-1.535000,27.722600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,28.546200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,29.088500>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<3.726200,-1.535000,29.088500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,29.088500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.455000,-1.535000,29.359700>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<3.455000,-1.535000,29.359700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.455000,-1.535000,29.359700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,29.359700>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<2.641600,-1.535000,29.359700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,29.359700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,28.546200>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,-90.000000,0> translate<2.641600,-1.535000,28.546200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,28.546200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.912700,-1.535000,28.275100>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<2.641600,-1.535000,28.546200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.912700,-1.535000,28.275100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.183900,-1.535000,28.546200>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<2.912700,-1.535000,28.275100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.183900,-1.535000,28.546200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.183900,-1.535000,29.359700>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,90.000000,0> translate<3.183900,-1.535000,29.359700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,29.912200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,29.912200>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<2.641600,-1.535000,29.912200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.183900,-1.535000,29.912200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,30.454500>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,-44.997030,0> translate<3.183900,-1.535000,29.912200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,30.454500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,30.725600>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<3.726200,-1.535000,30.725600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.099300,-1.535000,31.818700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.099300,-1.535000,32.089800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<2.099300,-1.535000,32.089800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.099300,-1.535000,32.089800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.370500,-1.535000,32.361000>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,-44.997030,0> translate<2.099300,-1.535000,32.089800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.370500,-1.535000,32.361000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,32.361000>}
box{<0,0,-0.076200><1.355700,0.035000,0.076200> rotate<0,0.000000,0> translate<2.370500,-1.535000,32.361000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,32.361000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,31.547500>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,-90.000000,0> translate<3.726200,-1.535000,31.547500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,31.547500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.455000,-1.535000,31.276400>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<3.455000,-1.535000,31.276400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.455000,-1.535000,31.276400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.912700,-1.535000,31.276400>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<2.912700,-1.535000,31.276400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.912700,-1.535000,31.276400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,31.547500>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<2.641600,-1.535000,31.547500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,31.547500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,32.361000>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,90.000000,0> translate<2.641600,-1.535000,32.361000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,33.726900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,33.184600>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<2.641600,-1.535000,33.184600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,33.184600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.912700,-1.535000,32.913500>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<2.641600,-1.535000,33.184600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.912700,-1.535000,32.913500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.455000,-1.535000,32.913500>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<2.912700,-1.535000,32.913500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.455000,-1.535000,32.913500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,33.184600>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<3.455000,-1.535000,32.913500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,33.184600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,33.726900>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<3.726200,-1.535000,33.726900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,33.726900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.455000,-1.535000,33.998100>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<3.455000,-1.535000,33.998100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.455000,-1.535000,33.998100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.183900,-1.535000,33.998100>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<3.183900,-1.535000,33.998100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.183900,-1.535000,33.998100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.183900,-1.535000,32.913500>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,-90.000000,0> translate<3.183900,-1.535000,32.913500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.641600,-1.535000,34.550600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,34.550600>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<2.641600,-1.535000,34.550600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.183900,-1.535000,34.550600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,35.092900>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,-44.997030,0> translate<3.183900,-1.535000,34.550600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,35.092900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.726200,-1.535000,35.364000>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<3.726200,-1.535000,35.364000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.163800,-1.535000,7.696200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.621500,-1.535000,7.696200>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<14.621500,-1.535000,7.696200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.892700,-1.535000,7.696200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.892700,-1.535000,9.323100>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,90.000000,0> translate<14.892700,-1.535000,9.323100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.163800,-1.535000,9.323100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.621500,-1.535000,9.323100>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<14.621500,-1.535000,9.323100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.072400,-1.535000,7.696200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.072400,-1.535000,9.323100>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,90.000000,0> translate<14.072400,-1.535000,9.323100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.072400,-1.535000,9.323100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.987800,-1.535000,7.696200>}
box{<0,0,-0.076200><1.955290,0.035000,0.076200> rotate<0,-56.306216,0> translate<12.987800,-1.535000,7.696200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.987800,-1.535000,7.696200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.987800,-1.535000,9.323100>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,90.000000,0> translate<12.987800,-1.535000,9.323100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<53.720400,-1.535000,9.323100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.262700,-1.535000,9.323100>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<53.720400,-1.535000,9.323100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.262700,-1.535000,9.323100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.533800,-1.535000,9.052000>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<54.262700,-1.535000,9.323100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.533800,-1.535000,9.052000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.533800,-1.535000,7.967300>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,-90.000000,0> translate<54.533800,-1.535000,7.967300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.533800,-1.535000,7.967300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.262700,-1.535000,7.696200>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<54.262700,-1.535000,7.696200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.262700,-1.535000,7.696200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<53.720400,-1.535000,7.696200>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<53.720400,-1.535000,7.696200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<53.720400,-1.535000,7.696200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<53.449200,-1.535000,7.967300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,44.986466,0> translate<53.449200,-1.535000,7.967300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<53.449200,-1.535000,7.967300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<53.449200,-1.535000,9.052000>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,90.000000,0> translate<53.449200,-1.535000,9.052000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<53.449200,-1.535000,9.052000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<53.720400,-1.535000,9.323100>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<53.449200,-1.535000,9.052000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<52.896700,-1.535000,9.323100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<52.896700,-1.535000,7.967300>}
box{<0,0,-0.076200><1.355800,0.035000,0.076200> rotate<0,-90.000000,0> translate<52.896700,-1.535000,7.967300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<52.896700,-1.535000,7.967300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<52.625600,-1.535000,7.696200>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<52.625600,-1.535000,7.696200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<52.625600,-1.535000,7.696200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<52.083300,-1.535000,7.696200>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<52.083300,-1.535000,7.696200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<52.083300,-1.535000,7.696200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<51.812100,-1.535000,7.967300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,44.986466,0> translate<51.812100,-1.535000,7.967300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<51.812100,-1.535000,7.967300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<51.812100,-1.535000,9.323100>}
box{<0,0,-0.076200><1.355800,0.035000,0.076200> rotate<0,90.000000,0> translate<51.812100,-1.535000,9.323100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<50.717300,-1.535000,7.696200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<50.717300,-1.535000,9.323100>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,90.000000,0> translate<50.717300,-1.535000,9.323100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<51.259600,-1.535000,9.323100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<50.175000,-1.535000,9.323100>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<50.175000,-1.535000,9.323100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<47.675800,-1.535000,18.415600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<46.591200,-1.535000,18.415600>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<46.591200,-1.535000,18.415600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<47.133500,-1.535000,18.958000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<47.133500,-1.535000,17.873300>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,-90.000000,0> translate<47.133500,-1.535000,17.873300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.404600,-1.535000,12.573600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.320000,-1.535000,12.573600>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<10.320000,-1.535000,12.573600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.862300,-1.535000,13.116000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.862300,-1.535000,12.031300>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,-90.000000,0> translate<10.862300,-1.535000,12.031300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.170400,-1.535000,12.200300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.085800,-1.535000,12.200300>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<16.085800,-1.535000,12.200300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<58.242200,-1.535000,18.067700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<57.157600,-1.535000,18.067700>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<57.157600,-1.535000,18.067700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.754800,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.754800,-1.535000,25.604500>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,90.000000,0> translate<44.754800,-1.535000,25.604500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.754800,-1.535000,25.604500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<43.941400,-1.535000,25.604500>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<43.941400,-1.535000,25.604500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<43.941400,-1.535000,25.604500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<43.670200,-1.535000,25.333400>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<43.670200,-1.535000,25.333400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<43.670200,-1.535000,25.333400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<43.670200,-1.535000,24.791000>}
box{<0,0,-0.076200><0.542400,0.035000,0.076200> rotate<0,-90.000000,0> translate<43.670200,-1.535000,24.791000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<43.670200,-1.535000,24.791000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<43.941400,-1.535000,24.519900>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,44.986466,0> translate<43.670200,-1.535000,24.791000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<43.941400,-1.535000,24.519900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.754800,-1.535000,24.519900>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<43.941400,-1.535000,24.519900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.212500,-1.535000,24.519900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<43.670200,-1.535000,23.977600>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,-44.997030,0> translate<43.670200,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<43.117700,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<43.117700,-1.535000,25.604500>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,90.000000,0> translate<43.117700,-1.535000,25.604500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<43.117700,-1.535000,25.604500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<42.304300,-1.535000,25.604500>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<42.304300,-1.535000,25.604500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<42.304300,-1.535000,25.604500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<42.033100,-1.535000,25.333400>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<42.033100,-1.535000,25.333400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<42.033100,-1.535000,25.333400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<42.033100,-1.535000,25.062200>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,-90.000000,0> translate<42.033100,-1.535000,25.062200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<42.033100,-1.535000,25.062200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<42.304300,-1.535000,24.791000>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<42.033100,-1.535000,25.062200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<42.304300,-1.535000,24.791000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<42.033100,-1.535000,24.519900>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<42.033100,-1.535000,24.519900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<42.033100,-1.535000,24.519900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<42.033100,-1.535000,24.248700>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,-90.000000,0> translate<42.033100,-1.535000,24.248700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<42.033100,-1.535000,24.248700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<42.304300,-1.535000,23.977600>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,44.986466,0> translate<42.033100,-1.535000,24.248700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<42.304300,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<43.117700,-1.535000,23.977600>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<42.304300,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<43.117700,-1.535000,24.791000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<42.304300,-1.535000,24.791000>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<42.304300,-1.535000,24.791000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.275100,-1.535000,25.099100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.648200,-1.535000,25.099100>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<4.648200,-1.535000,25.099100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.648200,-1.535000,25.099100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.648200,-1.535000,26.183700>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<4.648200,-1.535000,26.183700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.732800,-1.535000,26.736200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.732800,-1.535000,27.007300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<5.732800,-1.535000,27.007300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.732800,-1.535000,27.007300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.648200,-1.535000,27.007300>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<4.648200,-1.535000,27.007300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.648200,-1.535000,26.736200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.648200,-1.535000,27.278500>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<4.648200,-1.535000,27.278500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.546300,-1.535000,27.007300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.275100,-1.535000,27.007300>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,0.000000,0> translate<6.275100,-1.535000,27.007300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.004000,-1.535000,28.098700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.919300,-1.535000,28.098700>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,0.000000,0> translate<4.919300,-1.535000,28.098700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.919300,-1.535000,28.098700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.648200,-1.535000,28.369900>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<4.648200,-1.535000,28.369900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.732800,-1.535000,27.827600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.732800,-1.535000,28.369900>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<5.732800,-1.535000,28.369900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.648200,-1.535000,29.732400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.648200,-1.535000,29.190100>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<4.648200,-1.535000,29.190100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.648200,-1.535000,29.190100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.919300,-1.535000,28.919000>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<4.648200,-1.535000,29.190100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.919300,-1.535000,28.919000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.461600,-1.535000,28.919000>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<4.919300,-1.535000,28.919000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.461600,-1.535000,28.919000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.732800,-1.535000,29.190100>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<5.461600,-1.535000,28.919000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.732800,-1.535000,29.190100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.732800,-1.535000,29.732400>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<5.732800,-1.535000,29.732400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.732800,-1.535000,29.732400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.461600,-1.535000,30.003600>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<5.461600,-1.535000,30.003600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.461600,-1.535000,30.003600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.190500,-1.535000,30.003600>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<5.190500,-1.535000,30.003600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.190500,-1.535000,30.003600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.190500,-1.535000,28.919000>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,-90.000000,0> translate<5.190500,-1.535000,28.919000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<39.453800,-1.535000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<40.538400,-1.535000,6.883400>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<39.453800,-1.535000,6.883400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<40.538400,-1.535000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<39.453800,-1.535000,7.968000>}
box{<0,0,-0.076200><1.533856,0.035000,0.076200> rotate<0,44.997030,0> translate<39.453800,-1.535000,7.968000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<39.453800,-1.535000,7.968000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<39.453800,-1.535000,8.239200>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,90.000000,0> translate<39.453800,-1.535000,8.239200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<39.453800,-1.535000,8.239200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<39.725000,-1.535000,8.510300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<39.453800,-1.535000,8.239200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<39.725000,-1.535000,8.510300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<40.267300,-1.535000,8.510300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<39.725000,-1.535000,8.510300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<40.267300,-1.535000,8.510300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<40.538400,-1.535000,8.239200>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<40.267300,-1.535000,8.510300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<37.816700,-1.535000,8.510300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<38.901300,-1.535000,8.510300>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<37.816700,-1.535000,8.510300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<38.901300,-1.535000,8.510300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<38.901300,-1.535000,7.696800>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,-90.000000,0> translate<38.901300,-1.535000,7.696800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<38.901300,-1.535000,7.696800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<38.359000,-1.535000,7.968000>}
box{<0,0,-0.076200><0.606332,0.035000,0.076200> rotate<0,26.567524,0> translate<38.359000,-1.535000,7.968000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<38.359000,-1.535000,7.968000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<38.087900,-1.535000,7.968000>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<38.087900,-1.535000,7.968000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<38.087900,-1.535000,7.968000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<37.816700,-1.535000,7.696800>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,-44.997030,0> translate<37.816700,-1.535000,7.696800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<37.816700,-1.535000,7.696800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<37.816700,-1.535000,7.154500>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<37.816700,-1.535000,7.154500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<37.816700,-1.535000,7.154500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<38.087900,-1.535000,6.883400>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,44.986466,0> translate<37.816700,-1.535000,7.154500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<38.087900,-1.535000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<38.630200,-1.535000,6.883400>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<38.087900,-1.535000,6.883400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<38.630200,-1.535000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<38.901300,-1.535000,7.154500>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<38.630200,-1.535000,6.883400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<37.264200,-1.535000,7.154500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<37.264200,-1.535000,8.239200>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,90.000000,0> translate<37.264200,-1.535000,8.239200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<37.264200,-1.535000,8.239200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.993100,-1.535000,8.510300>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<36.993100,-1.535000,8.510300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.993100,-1.535000,8.510300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.450800,-1.535000,8.510300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<36.450800,-1.535000,8.510300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.450800,-1.535000,8.510300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.179600,-1.535000,8.239200>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<36.179600,-1.535000,8.239200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.179600,-1.535000,8.239200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.179600,-1.535000,7.154500>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,-90.000000,0> translate<36.179600,-1.535000,7.154500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.179600,-1.535000,7.154500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.450800,-1.535000,6.883400>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,44.986466,0> translate<36.179600,-1.535000,7.154500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.450800,-1.535000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.993100,-1.535000,6.883400>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<36.450800,-1.535000,6.883400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.993100,-1.535000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<37.264200,-1.535000,7.154500>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<36.993100,-1.535000,6.883400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<37.264200,-1.535000,7.154500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.179600,-1.535000,8.239200>}
box{<0,0,-0.076200><1.533927,0.035000,0.076200> rotate<0,44.999671,0> translate<36.179600,-1.535000,8.239200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<34.813700,-1.535000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<34.813700,-1.535000,8.510300>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,90.000000,0> translate<34.813700,-1.535000,8.510300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<34.813700,-1.535000,8.510300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.627100,-1.535000,7.696800>}
box{<0,0,-0.076200><1.150392,0.035000,0.076200> rotate<0,45.000552,0> translate<34.813700,-1.535000,8.510300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.627100,-1.535000,7.696800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<34.542500,-1.535000,7.696800>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<34.542500,-1.535000,7.696800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.905400,-1.535000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<33.990000,-1.535000,6.883400>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<32.905400,-1.535000,6.883400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<33.990000,-1.535000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.905400,-1.535000,7.968000>}
box{<0,0,-0.076200><1.533856,0.035000,0.076200> rotate<0,44.997030,0> translate<32.905400,-1.535000,7.968000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.905400,-1.535000,7.968000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.905400,-1.535000,8.239200>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,90.000000,0> translate<32.905400,-1.535000,8.239200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.905400,-1.535000,8.239200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<33.176600,-1.535000,8.510300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<32.905400,-1.535000,8.239200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<33.176600,-1.535000,8.510300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<33.718900,-1.535000,8.510300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<33.176600,-1.535000,8.510300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<33.718900,-1.535000,8.510300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<33.990000,-1.535000,8.239200>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<33.718900,-1.535000,8.510300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.352900,-1.535000,7.154500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.352900,-1.535000,8.239200>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,90.000000,0> translate<32.352900,-1.535000,8.239200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.352900,-1.535000,8.239200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.081800,-1.535000,8.510300>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<32.081800,-1.535000,8.510300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.081800,-1.535000,8.510300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.539500,-1.535000,8.510300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<31.539500,-1.535000,8.510300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.539500,-1.535000,8.510300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.268300,-1.535000,8.239200>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<31.268300,-1.535000,8.239200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.268300,-1.535000,8.239200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.268300,-1.535000,7.154500>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,-90.000000,0> translate<31.268300,-1.535000,7.154500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.268300,-1.535000,7.154500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.539500,-1.535000,6.883400>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,44.986466,0> translate<31.268300,-1.535000,7.154500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.539500,-1.535000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.081800,-1.535000,6.883400>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<31.539500,-1.535000,6.883400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.081800,-1.535000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.352900,-1.535000,7.154500>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<32.081800,-1.535000,6.883400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.352900,-1.535000,7.154500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.268300,-1.535000,8.239200>}
box{<0,0,-0.076200><1.533927,0.035000,0.076200> rotate<0,44.999671,0> translate<31.268300,-1.535000,8.239200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.715800,-1.535000,7.154500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.715800,-1.535000,8.239200>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,90.000000,0> translate<30.715800,-1.535000,8.239200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.715800,-1.535000,8.239200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.444700,-1.535000,8.510300>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<30.444700,-1.535000,8.510300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.444700,-1.535000,8.510300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.902400,-1.535000,8.510300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<29.902400,-1.535000,8.510300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.902400,-1.535000,8.510300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.631200,-1.535000,8.239200>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<29.631200,-1.535000,8.239200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.631200,-1.535000,8.239200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.631200,-1.535000,7.154500>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,-90.000000,0> translate<29.631200,-1.535000,7.154500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.631200,-1.535000,7.154500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.902400,-1.535000,6.883400>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,44.986466,0> translate<29.631200,-1.535000,7.154500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.902400,-1.535000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.444700,-1.535000,6.883400>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<29.902400,-1.535000,6.883400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.444700,-1.535000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.715800,-1.535000,7.154500>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<30.444700,-1.535000,6.883400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.715800,-1.535000,7.154500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.631200,-1.535000,8.239200>}
box{<0,0,-0.076200><1.533927,0.035000,0.076200> rotate<0,44.999671,0> translate<29.631200,-1.535000,8.239200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.994100,-1.535000,8.510300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.078700,-1.535000,8.510300>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<27.994100,-1.535000,8.510300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.078700,-1.535000,8.510300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.078700,-1.535000,7.696800>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,-90.000000,0> translate<29.078700,-1.535000,7.696800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.078700,-1.535000,7.696800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<28.536400,-1.535000,7.968000>}
box{<0,0,-0.076200><0.606332,0.035000,0.076200> rotate<0,26.567524,0> translate<28.536400,-1.535000,7.968000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<28.536400,-1.535000,7.968000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<28.265300,-1.535000,7.968000>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<28.265300,-1.535000,7.968000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<28.265300,-1.535000,7.968000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.994100,-1.535000,7.696800>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,-44.997030,0> translate<27.994100,-1.535000,7.696800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.994100,-1.535000,7.696800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.994100,-1.535000,7.154500>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<27.994100,-1.535000,7.154500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.994100,-1.535000,7.154500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<28.265300,-1.535000,6.883400>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,44.986466,0> translate<27.994100,-1.535000,7.154500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<28.265300,-1.535000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<28.807600,-1.535000,6.883400>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<28.265300,-1.535000,6.883400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<28.807600,-1.535000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.078700,-1.535000,7.154500>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<28.807600,-1.535000,6.883400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.804500,-1.535000,7.968000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.262200,-1.535000,6.883400>}
box{<0,0,-0.076200><1.212620,0.035000,0.076200> rotate<0,-63.430762,0> translate<25.262200,-1.535000,6.883400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.262200,-1.535000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.719900,-1.535000,7.968000>}
box{<0,0,-0.076200><1.212620,0.035000,0.076200> rotate<0,63.430762,0> translate<24.719900,-1.535000,7.968000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.167400,-1.535000,7.968000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.625100,-1.535000,8.510300>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,44.997030,0> translate<23.625100,-1.535000,8.510300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.625100,-1.535000,8.510300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.625100,-1.535000,6.883400>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,-90.000000,0> translate<23.625100,-1.535000,6.883400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.167400,-1.535000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.082800,-1.535000,6.883400>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<23.082800,-1.535000,6.883400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.530300,-1.535000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.530300,-1.535000,7.154500>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<22.530300,-1.535000,7.154500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.530300,-1.535000,7.154500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.259200,-1.535000,7.154500>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<22.259200,-1.535000,7.154500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.259200,-1.535000,7.154500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.259200,-1.535000,6.883400>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<22.259200,-1.535000,6.883400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.259200,-1.535000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.530300,-1.535000,6.883400>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<22.259200,-1.535000,6.883400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.627200,-1.535000,8.510300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.711800,-1.535000,8.510300>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<20.627200,-1.535000,8.510300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.711800,-1.535000,8.510300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.711800,-1.535000,7.696800>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,-90.000000,0> translate<21.711800,-1.535000,7.696800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.711800,-1.535000,7.696800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.169500,-1.535000,7.968000>}
box{<0,0,-0.076200><0.606332,0.035000,0.076200> rotate<0,26.567524,0> translate<21.169500,-1.535000,7.968000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.169500,-1.535000,7.968000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.898400,-1.535000,7.968000>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<20.898400,-1.535000,7.968000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.898400,-1.535000,7.968000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.627200,-1.535000,7.696800>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,-44.997030,0> translate<20.627200,-1.535000,7.696800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.627200,-1.535000,7.696800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.627200,-1.535000,7.154500>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.627200,-1.535000,7.154500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.627200,-1.535000,7.154500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.898400,-1.535000,6.883400>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,44.986466,0> translate<20.627200,-1.535000,7.154500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.898400,-1.535000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.440700,-1.535000,6.883400>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<20.898400,-1.535000,6.883400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.440700,-1.535000,6.883400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.711800,-1.535000,7.154500>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.440700,-1.535000,6.883400> }
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Poligoni
texture{col_pol}
}
#end
union{
cylinder{<36.830000,0.038000,46.990000><36.830000,-1.538000,46.990000>0.406400}
cylinder{<41.910000,0.038000,46.990000><41.910000,-1.538000,46.990000>0.406400}
cylinder{<36.830000,0.038000,39.370000><36.830000,-1.538000,39.370000>0.406400}
cylinder{<41.910000,0.038000,39.370000><41.910000,-1.538000,39.370000>0.406400}
cylinder{<24.130000,0.038000,15.240000><24.130000,-1.538000,15.240000>0.558800}
cylinder{<24.130000,0.038000,25.400000><24.130000,-1.538000,25.400000>0.558800}
cylinder{<13.309600,0.038000,41.148000><13.309600,-1.538000,41.148000>0.558800}
cylinder{<13.309600,0.038000,43.688000><13.309600,-1.538000,43.688000>0.558800}
cylinder{<13.309600,0.038000,46.228000><13.309600,-1.538000,46.228000>0.558800}
cylinder{<27.940000,0.038000,43.180000><27.940000,-1.538000,43.180000>0.406400}
cylinder{<27.940000,0.038000,40.640000><27.940000,-1.538000,40.640000>0.406400}
cylinder{<45.720000,0.038000,35.560000><45.720000,-1.538000,35.560000>0.406400}
cylinder{<35.560000,0.038000,35.560000><35.560000,-1.538000,35.560000>0.406400}
cylinder{<44.450000,0.038000,43.180000><44.450000,-1.538000,43.180000>0.406400}
cylinder{<34.290000,0.038000,43.180000><34.290000,-1.538000,43.180000>0.406400}
cylinder{<31.750000,0.038000,29.210000><31.750000,-1.538000,29.210000>0.406400}
cylinder{<31.750000,0.038000,39.370000><31.750000,-1.538000,39.370000>0.406400}
cylinder{<52.298600,0.038000,26.314400><52.298600,-1.538000,26.314400>0.508000}
cylinder{<57.378600,0.038000,26.314400><57.378600,-1.538000,26.314400>0.508000}
cylinder{<54.838600,0.038000,36.474400><54.838600,-1.538000,36.474400>0.508000}
cylinder{<31.750000,0.038000,21.590000><31.750000,-1.538000,21.590000>0.406400}
cylinder{<31.750000,0.038000,11.430000><31.750000,-1.538000,11.430000>0.406400}
cylinder{<27.940000,0.038000,21.590000><27.940000,-1.538000,21.590000>0.406400}
cylinder{<27.940000,0.038000,11.430000><27.940000,-1.538000,11.430000>0.406400}
cylinder{<46.990000,0.038000,33.020000><46.990000,-1.538000,33.020000>0.406400}
cylinder{<36.830000,0.038000,33.020000><36.830000,-1.538000,33.020000>0.406400}
cylinder{<36.830000,0.038000,28.270200><36.830000,-1.538000,28.270200>0.406400}
cylinder{<46.990000,0.038000,28.270200><46.990000,-1.538000,28.270200>0.406400}
cylinder{<36.830000,0.038000,11.430000><36.830000,-1.538000,11.430000>0.457200}
cylinder{<36.830000,0.038000,26.670000><36.830000,-1.538000,26.670000>0.457200}
cylinder{<25.400000,0.038000,33.020000><25.400000,-1.538000,33.020000>0.406400}
cylinder{<27.940000,0.038000,33.020000><27.940000,-1.538000,33.020000>0.406400}
cylinder{<27.940000,0.038000,35.560000><27.940000,-1.538000,35.560000>0.406400}
cylinder{<50.368200,0.038000,43.180000><50.368200,-1.538000,43.180000>0.406400}
cylinder{<52.908200,0.038000,43.180000><52.908200,-1.538000,43.180000>0.406400}
cylinder{<52.908200,0.038000,45.720000><52.908200,-1.538000,45.720000>0.406400}
cylinder{<49.555400,0.038000,16.510000><49.555400,-1.538000,16.510000>0.660400}
cylinder{<54.559200,0.038000,16.510000><54.559200,-1.538000,16.510000>0.660400}
cylinder{<11.455400,0.038000,16.510000><11.455400,-1.538000,16.510000>0.660400}
cylinder{<16.459200,0.038000,16.510000><16.459200,-1.538000,16.510000>0.660400}
//Fori(Fast)/Via
cylinder{<13.335000,0.038000,46.253400><13.335000,-1.538000,46.253400>0.250000 }
cylinder{<36.753800,0.038000,39.370000><36.753800,-1.538000,39.370000>0.250000 }
cylinder{<13.335000,0.038000,43.713400><13.335000,-1.538000,43.713400>0.250000 }
cylinder{<25.400000,0.038000,32.994600><25.400000,-1.538000,32.994600>0.250000 }
cylinder{<47.345600,0.038000,48.260000><47.345600,-1.538000,48.260000>0.300000 }
cylinder{<47.345600,0.038000,43.180000><47.345600,-1.538000,43.180000>0.300000 }
cylinder{<47.421800,0.038000,48.234600><47.421800,-1.538000,48.234600>0.250000 }
cylinder{<47.548800,0.038000,43.281600><47.548800,-1.538000,43.281600>0.250000 }
cylinder{<13.360400,0.038000,41.173400><13.360400,-1.538000,41.173400>0.250000 }
cylinder{<36.830000,0.038000,26.720800><36.830000,-1.538000,26.720800>0.250000 }
cylinder{<11.023600,0.038000,16.408400><11.023600,-1.538000,16.408400>0.250000 }
cylinder{<16.865600,0.038000,16.408400><16.865600,-1.538000,16.408400>0.250000 }
cylinder{<36.804600,0.038000,11.404600><36.804600,-1.538000,11.404600>0.250000 }
cylinder{<54.965600,0.038000,16.357600><54.965600,-1.538000,16.357600>0.250000 }
cylinder{<49.225200,0.038000,16.357600><49.225200,-1.538000,16.357600>0.250000 }
cylinder{<52.273200,0.038000,26.339800><52.273200,-1.538000,26.339800>0.250000 }
cylinder{<57.277000,0.038000,26.339800><57.277000,-1.538000,26.339800>0.250000 }
cylinder{<54.813200,0.038000,36.449000><54.813200,-1.538000,36.449000>0.250000 }
cylinder{<50.215800,0.038000,43.154600><50.215800,-1.538000,43.154600>0.250000 }
cylinder{<52.959000,0.038000,43.180000><52.959000,-1.538000,43.180000>0.250000 }
cylinder{<52.933600,0.038000,45.770800><52.933600,-1.538000,45.770800>0.250000 }
cylinder{<41.935400,0.038000,39.395400><41.935400,-1.538000,39.395400>0.250000 }
cylinder{<41.910000,0.038000,47.015400><41.910000,-1.538000,47.015400>0.250000 }
cylinder{<35.560000,0.038000,35.534600><35.560000,-1.538000,35.534600>0.250000 }
cylinder{<45.720000,0.038000,35.585400><45.720000,-1.538000,35.585400>0.250000 }
cylinder{<47.015400,0.038000,33.070800><47.015400,-1.538000,33.070800>0.250000 }
cylinder{<36.906200,0.038000,33.045400><36.906200,-1.538000,33.045400>0.250000 }
cylinder{<36.855400,0.038000,28.295600><36.855400,-1.538000,28.295600>0.250000 }
cylinder{<47.040800,0.038000,28.244800><47.040800,-1.538000,28.244800>0.250000 }
cylinder{<31.699200,0.038000,29.210000><31.699200,-1.538000,29.210000>0.250000 }
cylinder{<31.699200,0.038000,21.513800><31.699200,-1.538000,21.513800>0.250000 }
cylinder{<27.965400,0.038000,21.513800><27.965400,-1.538000,21.513800>0.250000 }
cylinder{<31.750000,0.038000,11.404600><31.750000,-1.538000,11.404600>0.250000 }
cylinder{<27.965400,0.038000,11.353800><27.965400,-1.538000,11.353800>0.250000 }
cylinder{<24.104600,0.038000,15.240000><24.104600,-1.538000,15.240000>0.250000 }
cylinder{<24.104600,0.038000,25.298400><24.104600,-1.538000,25.298400>0.250000 }
cylinder{<27.914600,0.038000,33.020000><27.914600,-1.538000,33.020000>0.250000 }
cylinder{<27.940000,0.038000,35.534600><27.940000,-1.538000,35.534600>0.250000 }
cylinder{<31.750000,0.038000,39.395400><31.750000,-1.538000,39.395400>0.250000 }
cylinder{<27.940000,0.038000,40.665400><27.940000,-1.538000,40.665400>0.250000 }
cylinder{<27.914600,0.038000,43.205400><27.914600,-1.538000,43.205400>0.250000 }
cylinder{<44.424600,0.038000,43.154600><44.424600,-1.538000,43.154600>0.250000 }
cylinder{<36.830000,0.038000,47.040800><36.830000,-1.538000,47.040800>0.250000 }
cylinder{<34.239200,0.038000,43.154600><34.239200,-1.538000,43.154600>0.250000 }
//Fori(Fast)/Scheda
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.065200,0.000000,47.625000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.065200,0.000000,46.990000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<39.065200,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.065200,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.065200,0.000000,46.355000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<39.065200,0.000000,46.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.065200,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,46.990000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<37.846000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.700200,0.000000,47.625000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.700200,0.000000,46.990000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<39.700200,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.700200,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.700200,0.000000,46.355000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<39.700200,0.000000,46.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.700200,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,46.990000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<39.700200,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,0.000000,48.006000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,0.000000,45.974000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.687000,0.000000,45.974000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,45.720000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.941000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,45.974000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,48.006000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.053000,0.000000,48.006000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,48.260000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.941000,0.000000,48.260000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<42.799000,0.000000,48.006000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<42.799000,0.000000,45.974000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<35.941000,0.000000,45.974000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<35.941000,0.000000,48.006000>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.065200,0.000000,40.005000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.065200,0.000000,39.370000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<39.065200,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.065200,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.065200,0.000000,38.735000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<39.065200,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.065200,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,39.370000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<37.846000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.700200,0.000000,40.005000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.700200,0.000000,39.370000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<39.700200,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.700200,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.700200,0.000000,38.735000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<39.700200,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.700200,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,39.370000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<39.700200,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,0.000000,38.354000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.687000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,38.100000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.941000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,40.386000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.053000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,40.640000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.941000,0.000000,40.640000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<42.799000,0.000000,40.386000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<42.799000,0.000000,38.354000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<35.941000,0.000000,38.354000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<35.941000,0.000000,40.386000>}
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,22.352000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.860000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,18.288000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,18.288000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.400000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,22.352000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<24.130000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<24.130000,0.000000,16.256000>}
box{<0,0,-0.381000><1.016000,0.036000,0.381000> rotate<0,90.000000,0> translate<24.130000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<24.130000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<24.130000,0.000000,24.384000>}
box{<0,0,-0.381000><1.016000,0.036000,0.381000> rotate<0,-90.000000,0> translate<24.130000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,20.320000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.130000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.765000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,19.304000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.495000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,20.320000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<23.495000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,18.796000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.130000,0.000000,18.796000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.765000,0.000000,19.304000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<24.130000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.765000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,20.320000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.130000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,20.320000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.495000,0.000000,20.320000> }
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-270.000000,0> translate<24.130000,0.000000,21.717000>}
box{<-0.952500,0,-0.381000><0.952500,0.036000,0.381000> rotate<0,-270.000000,0> translate<24.130000,0.000000,17.335500>}
box{<-0.952500,0,-0.381000><0.952500,0.036000,0.381000> rotate<0,-270.000000,0> translate<24.130000,0.000000,23.304500>}
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.769600,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.769600,0.000000,48.895000>}
box{<0,0,-0.076200><10.414000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.769600,0.000000,48.895000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.134600,0.000000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.134600,0.000000,48.260000>}
box{<0,0,-0.025400><9.144000,0.036000,0.025400> rotate<0,90.000000,0> translate<10.134600,0.000000,48.260000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<1.879600,0.000000,48.260000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.134600,0.000000,48.260000>}
box{<0,0,-0.025400><8.255000,0.036000,0.025400> rotate<0,0.000000,0> translate<1.879600,0.000000,48.260000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<1.879600,0.000000,48.260000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<1.879600,0.000000,39.116000>}
box{<0,0,-0.025400><9.144000,0.036000,0.025400> rotate<0,-90.000000,0> translate<1.879600,0.000000,39.116000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.134600,0.000000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<1.879600,0.000000,39.116000>}
box{<0,0,-0.025400><8.255000,0.036000,0.025400> rotate<0,0.000000,0> translate<1.879600,0.000000,39.116000> }
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-90.000000,0> translate<13.881100,0.000000,46.228000>}
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-90.000000,0> translate<13.881100,0.000000,43.688000>}
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-90.000000,0> translate<13.881100,0.000000,41.148000>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-90.000000,0> translate<12.166600,0.000000,41.148000>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-90.000000,0> translate<12.166600,0.000000,43.688000>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-90.000000,0> translate<12.166600,0.000000,46.228000>}
//LED1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.035000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.845000,0.000000,39.370000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<26.035000,0.000000,39.370000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<27.940000,0.000000,41.910000>}
object{ARC(1.143000,0.152400,0.000000,90.000000,0.036000) translate<27.940000,0.000000,41.910000>}
object{ARC(1.143000,0.152400,180.000000,270.000000,0.036000) translate<27.940000,0.000000,41.910000>}
object{ARC(1.651000,0.152400,0.000000,90.000000,0.036000) translate<27.940000,0.000000,41.910000>}
object{ARC(1.651000,0.152400,180.000000,270.000000,0.036000) translate<27.940000,0.000000,41.910000>}
object{ARC(2.159000,0.152400,0.000000,90.000000,0.036000) translate<27.940000,0.000000,41.910000>}
object{ARC(2.159000,0.152400,180.000000,270.000000,0.036000) translate<27.940000,0.000000,41.910000>}
difference{
cylinder{<27.940000,0,41.910000><27.940000,0.036000,41.910000>2.616200 translate<0,0.000000,0>}
cylinder{<27.940000,-0.1,41.910000><27.940000,0.135000,41.910000>2.463800 translate<0,0.000000,0>}}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.560000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<36.576000,0.000000,35.560000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<35.560000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.720000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.704000,0.000000,35.560000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<44.704000,0.000000,35.560000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<43.561000,0.000000,34.671000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<43.561000,0.000000,36.449000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<37.719000,0.000000,36.449000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<37.719000,0.000000,34.671000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,34.671000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.815000,0.000000,34.671000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.561000,0.000000,34.417000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,34.417000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.180000,0.000000,34.417000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,34.417000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<43.053000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.561000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,36.703000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.180000,0.000000,36.703000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,36.703000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.053000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,34.417000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.100000,0.000000,34.417000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,34.544000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.227000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,36.703000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<38.100000,0.000000,36.703000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,36.576000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.227000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.719000,0.000000,34.417000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,34.417000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.719000,0.000000,34.417000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.719000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,36.703000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.719000,0.000000,36.703000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,34.671000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.465000,0.000000,34.671000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<37.033200,0.000000,35.560000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<44.246800,0.000000,35.560000>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.290000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.306000,0.000000,43.180000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<34.290000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.450000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.434000,0.000000,43.180000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<43.434000,0.000000,43.180000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<42.291000,0.000000,42.291000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<42.291000,0.000000,44.069000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<36.449000,0.000000,44.069000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<36.449000,0.000000,42.291000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,44.069000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,42.291000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.545000,0.000000,42.291000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,42.037000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,42.037000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.910000,0.000000,42.037000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,42.037000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.783000,0.000000,42.164000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,44.323000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.910000,0.000000,44.323000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,44.323000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.783000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,42.037000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.830000,0.000000,42.037000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,42.164000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.957000,0.000000,42.164000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,44.323000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<36.830000,0.000000,44.323000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,44.196000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.957000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,42.037000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,42.037000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.449000,0.000000,42.037000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,44.323000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.449000,0.000000,44.323000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,44.069000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,42.291000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.195000,0.000000,42.291000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<35.763200,0.000000,43.180000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<42.976800,0.000000,43.180000>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<31.750000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<31.750000,0.000000,38.354000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<31.750000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<31.750000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<31.750000,0.000000,30.226000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<31.750000,0.000000,30.226000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<30.861000,0.000000,31.369000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<32.639000,0.000000,31.369000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<32.639000,0.000000,37.211000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<30.861000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.639000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,31.115000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.861000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<30.607000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.607000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<32.893000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<32.766000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,36.830000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<30.607000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,31.877000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.734000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,36.830000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.766000,0.000000,36.703000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,36.703000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,31.877000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.766000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,36.830000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.607000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,36.830000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.893000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.639000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,37.465000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.861000,0.000000,37.465000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<31.750000,0.000000,37.896800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<31.750000,0.000000,30.683200>}
//R5 silk screen
object{ARC(5.462500,0.127000,305.537678,594.462322,0.036000) translate<54.838600,0.000000,31.775400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.013600,0.000000,27.330400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.013600,0.000000,25.679400>}
box{<0,0,-0.063500><1.651000,0.036000,0.063500> rotate<0,-90.000000,0> translate<58.013600,0.000000,25.679400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.663600,0.000000,25.679400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.663600,0.000000,27.330400>}
box{<0,0,-0.063500><1.651000,0.036000,0.063500> rotate<0,90.000000,0> translate<51.663600,0.000000,27.330400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.044600,0.000000,25.679400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.044600,0.000000,28.219400>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,90.000000,0> translate<52.044600,0.000000,28.219400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.044600,0.000000,28.219400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.933600,0.000000,28.854400>}
box{<0,0,-0.063500><1.092495,0.036000,0.063500> rotate<0,-35.535332,0> translate<52.044600,0.000000,28.219400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.933600,0.000000,28.854400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.203600,0.000000,28.219400>}
box{<0,0,-0.063500><1.419903,0.036000,0.063500> rotate<0,26.563298,0> translate<52.933600,0.000000,28.854400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.203600,0.000000,28.219400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.203600,0.000000,26.949400>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<54.203600,0.000000,26.949400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.203600,0.000000,26.949400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.568600,0.000000,26.949400>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<53.568600,0.000000,26.949400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.568600,0.000000,26.949400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.568600,0.000000,25.679400>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<53.568600,0.000000,25.679400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.108600,0.000000,25.679400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.108600,0.000000,26.949400>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<56.108600,0.000000,26.949400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.108600,0.000000,26.949400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.473600,0.000000,26.949400>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<55.473600,0.000000,26.949400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.473600,0.000000,26.949400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.473600,0.000000,28.219400>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<55.473600,0.000000,28.219400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.473600,0.000000,28.219400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.743600,0.000000,28.854400>}
box{<0,0,-0.063500><1.419903,0.036000,0.063500> rotate<0,-26.563298,0> translate<55.473600,0.000000,28.219400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.743600,0.000000,28.854400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.632600,0.000000,28.219400>}
box{<0,0,-0.063500><1.092495,0.036000,0.063500> rotate<0,35.535332,0> translate<56.743600,0.000000,28.854400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.632600,0.000000,28.219400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.632600,0.000000,25.679400>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,-90.000000,0> translate<57.632600,0.000000,25.679400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.663600,0.000000,25.679400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.013600,0.000000,25.679400>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,0.000000,0> translate<51.663600,0.000000,25.679400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.727600,0.000000,32.791400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.711600,0.000000,31.775400>}
box{<0,0,-0.063500><1.436841,0.036000,0.063500> rotate<0,-44.997030,0> translate<54.711600,0.000000,31.775400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.711600,0.000000,31.775400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.330600,0.000000,32.156400>}
box{<0,0,-0.063500><0.538815,0.036000,0.063500> rotate<0,44.997030,0> translate<54.330600,0.000000,32.156400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.330600,0.000000,32.156400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.330600,0.000000,31.394400>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,-90.000000,0> translate<54.330600,0.000000,31.394400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.330600,0.000000,31.394400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.441600,0.000000,30.505400>}
box{<0,0,-0.063500><1.257236,0.036000,0.063500> rotate<0,-44.997030,0> translate<53.441600,0.000000,30.505400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.235600,0.000000,32.283400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.219600,0.000000,31.267400>}
box{<0,0,-0.063500><1.436841,0.036000,0.063500> rotate<0,-44.997030,0> translate<55.219600,0.000000,31.267400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.219600,0.000000,31.267400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.600600,0.000000,30.886400>}
box{<0,0,-0.063500><0.538815,0.036000,0.063500> rotate<0,44.997030,0> translate<55.219600,0.000000,31.267400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.600600,0.000000,30.886400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.838600,0.000000,30.886400>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<54.838600,0.000000,30.886400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.838600,0.000000,30.886400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.949600,0.000000,29.997400>}
box{<0,0,-0.063500><1.257236,0.036000,0.063500> rotate<0,-44.997030,0> translate<53.949600,0.000000,29.997400> }
difference{
cylinder{<54.838600,0,31.394400><54.838600,0.036000,31.394400>1.866900 translate<0,0.000000,0>}
cylinder{<54.838600,-0.1,31.394400><54.838600,0.135000,31.394400>1.739900 translate<0,0.000000,0>}}
difference{
cylinder{<54.838600,0,31.394400><54.838600,0.036000,31.394400>2.819400 translate<0,0.000000,0>}
cylinder{<54.838600,-0.1,31.394400><54.838600,0.135000,31.394400>2.768600 translate<0,0.000000,0>}}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<31.750000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<31.750000,0.000000,12.446000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<31.750000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<31.750000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<31.750000,0.000000,20.574000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<31.750000,0.000000,20.574000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<32.639000,0.000000,19.431000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<30.861000,0.000000,19.431000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<30.861000,0.000000,13.589000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<32.639000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.639000,0.000000,19.685000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.861000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,19.050000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.893000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,19.050000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.766000,0.000000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,19.050000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.607000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,19.050000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<30.607000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,14.097000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,13.970000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<32.766000,0.000000,14.097000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,14.097000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,18.923000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<32.766000,0.000000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,14.097000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,13.970000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.607000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,14.097000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,18.923000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<30.734000,0.000000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,13.970000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<32.893000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,13.970000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<30.607000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.639000,0.000000,13.335000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.861000,0.000000,13.335000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<31.750000,0.000000,12.903200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<31.750000,0.000000,20.116800>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.940000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.940000,0.000000,12.446000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<27.940000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.940000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.940000,0.000000,20.574000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<27.940000,0.000000,20.574000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<28.829000,0.000000,19.431000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<27.051000,0.000000,19.431000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<27.051000,0.000000,13.589000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<28.829000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829000,0.000000,19.685000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.051000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,0.000000,19.050000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.083000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.956000,0.000000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,0.000000,19.050000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.956000,0.000000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,0.000000,19.050000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.797000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.924000,0.000000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,0.000000,19.050000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<26.797000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.956000,0.000000,14.097000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,0.000000,13.970000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<28.956000,0.000000,14.097000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.956000,0.000000,14.097000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.956000,0.000000,18.923000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.956000,0.000000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.924000,0.000000,14.097000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,0.000000,13.970000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.797000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.924000,0.000000,14.097000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.924000,0.000000,18.923000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.924000,0.000000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,0.000000,13.970000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.083000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,0.000000,13.970000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.797000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829000,0.000000,13.335000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.051000,0.000000,13.335000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<27.940000,0.000000,12.903200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<27.940000,0.000000,20.116800>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<36.830000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<37.846000,0.000000,33.020000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<36.830000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<46.990000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.974000,0.000000,33.020000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<45.974000,0.000000,33.020000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<44.831000,0.000000,32.131000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<44.831000,0.000000,33.909000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<38.989000,0.000000,33.909000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<38.989000,0.000000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,33.909000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,32.131000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.085000,0.000000,32.131000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.831000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,31.877000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.450000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,31.877000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<44.323000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.831000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,34.163000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.450000,0.000000,34.163000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,34.163000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.323000,0.000000,34.036000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,31.877000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.370000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,32.004000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.497000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,34.163000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<39.370000,0.000000,34.163000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,34.036000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.497000,0.000000,34.036000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,31.877000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.989000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,34.163000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.989000,0.000000,34.163000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,33.909000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,32.131000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.735000,0.000000,32.131000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<38.303200,0.000000,33.020000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<45.516800,0.000000,33.020000>}
//R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<46.990000,0.000000,28.270200>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.974000,0.000000,28.270200>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<45.974000,0.000000,28.270200> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<36.830000,0.000000,28.270200>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<37.846000,0.000000,28.270200>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<36.830000,0.000000,28.270200> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<38.989000,0.000000,29.159200>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<38.989000,0.000000,27.381200>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<44.831000,0.000000,27.381200>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<44.831000,0.000000,29.159200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,27.381200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,29.159200>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<38.735000,0.000000,29.159200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,29.413200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,29.413200>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.989000,0.000000,29.413200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,29.286200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,29.413200>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<39.370000,0.000000,29.413200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,27.127200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,27.127200>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.989000,0.000000,27.127200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,27.254200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,27.127200>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.370000,0.000000,27.127200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,29.286200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,29.413200>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.323000,0.000000,29.286200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,29.286200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,29.286200>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.497000,0.000000,29.286200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,27.254200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,27.127200>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<44.323000,0.000000,27.254200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,27.254200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,27.254200>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.497000,0.000000,27.254200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.831000,0.000000,29.413200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,29.413200>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.450000,0.000000,29.413200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.831000,0.000000,27.127200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,27.127200>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.450000,0.000000,27.127200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,27.381200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,29.159200>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<45.085000,0.000000,29.159200> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<45.516800,0.000000,28.270200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<38.303200,0.000000,28.270200>}
//R16 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.179000,0.000000,24.130000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.179000,0.000000,24.130000> }
object{ARC(0.381000,0.152400,90.000000,180.000000,0.036000) translate<35.179000,0.000000,23.749000>}
object{ARC(0.381000,0.152400,270.000000,360.000000,0.036000) translate<38.481000,0.000000,14.351000>}
object{ARC(0.381000,0.152400,0.000000,90.000000,0.036000) translate<38.481000,0.000000,23.749000>}
object{ARC(0.381000,0.152400,180.000000,270.000000,0.036000) translate<35.179000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,23.114000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.798000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,23.114000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<34.798000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,23.114000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.862000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,23.114000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.735000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,14.986000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.798000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,22.987000>}
box{<0,0,-0.076200><7.874000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.925000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,14.986000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<38.735000,0.000000,15.113000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,22.987000>}
box{<0,0,-0.076200><7.874000,0.036000,0.076200> rotate<0,90.000000,0> translate<38.735000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.179000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,13.970000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.179000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,14.986000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.798000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,14.986000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<38.862000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<36.830000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<36.830000,0.000000,12.700000>}
box{<0,0,-0.381000><1.270000,0.036000,0.381000> rotate<0,90.000000,0> translate<36.830000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<36.830000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<36.830000,0.000000,26.670000>}
box{<0,0,-0.381000><1.270000,0.036000,0.381000> rotate<0,90.000000,0> translate<36.830000,0.000000,26.670000> }
box{<-0.698500,0,-0.381000><0.698500,0.036000,0.381000> rotate<0,-90.000000,0> translate<36.830000,0.000000,24.828500>}
box{<-0.698500,0,-0.381000><0.698500,0.036000,0.381000> rotate<0,-90.000000,0> translate<36.830000,0.000000,13.271500>}
//T1 silk screen
object{ARC(2.413000,0.050800,22.641418,67.358582,0.036000) translate<26.670000,0.000000,34.290000>}
object{ARC(2.413000,0.050800,292.641418,337.358582,0.036000) translate<26.670000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.733000,0.000000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.733000,0.000000,34.798000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<22.733000,0.000000,34.798000> }
object{ARC(2.413100,0.050800,67.359496,202.640504,0.036000) translate<26.670100,0.000000,34.290000>}
object{ARC(2.413000,0.050800,202.641418,247.358582,0.036000) translate<26.670000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.733000,0.000000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.793000,0.000000,33.782000>}
box{<0,0,-0.063500><1.060000,0.036000,0.063500> rotate<0,0.000000,0> translate<22.733000,0.000000,33.782000> }
object{ARC(2.413000,0.050800,247.358582,292.641418,0.036000) translate<26.670000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.733000,0.000000,34.798000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.793000,0.000000,34.798000>}
box{<0,0,-0.063500><1.060000,0.036000,0.063500> rotate<0,0.000000,0> translate<22.733000,0.000000,34.798000> }
object{ARC(2.413000,0.050800,337.358582,382.641418,0.036000) translate<26.670000,0.000000,34.290000>}
difference{
cylinder{<26.670000,0,34.290000><26.670000,0.036000,34.290000>2.984500 translate<0,0.000000,0>}
cylinder{<26.670000,-0.1,34.290000><26.670000,0.135000,34.290000>2.857500 translate<0,0.000000,0>}}
//T2 silk screen
object{ARC(2.413000,0.050800,22.641418,67.358582,0.036000) translate<51.638200,0.000000,44.450000>}
object{ARC(2.413000,0.050800,292.641418,337.358582,0.036000) translate<51.638200,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.701200,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.701200,0.000000,44.958000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<47.701200,0.000000,44.958000> }
object{ARC(2.413100,0.050800,67.359496,202.640504,0.036000) translate<51.638300,0.000000,44.450000>}
object{ARC(2.413000,0.050800,202.641418,247.358582,0.036000) translate<51.638200,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.701200,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.761200,0.000000,43.942000>}
box{<0,0,-0.063500><1.060000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.701200,0.000000,43.942000> }
object{ARC(2.413000,0.050800,247.358582,292.641418,0.036000) translate<51.638200,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.701200,0.000000,44.958000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.761200,0.000000,44.958000>}
box{<0,0,-0.063500><1.060000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.701200,0.000000,44.958000> }
object{ARC(2.413000,0.050800,337.358582,382.641418,0.036000) translate<51.638200,0.000000,44.450000>}
difference{
cylinder{<51.638200,0,44.450000><51.638200,0.036000,44.450000>2.984500 translate<0,0.000000,0>}
cylinder{<51.638200,-0.1,44.450000><51.638200,0.135000,44.450000>2.857500 translate<0,0.000000,0>}}
//X1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,19.685000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.150000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,22.733000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.990000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.658000,0.000000,22.733000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.150000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.658000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.658000,0.000000,17.907000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.658000,0.000000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.658000,0.000000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,18.161000>}
box{<0,0,-0.076200><0.567961,0.036000,0.076200> rotate<0,26.563298,0> translate<57.150000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.658000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,11.303000>}
box{<0,0,-0.076200><0.567961,0.036000,0.076200> rotate<0,26.563298,0> translate<57.150000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,10.287000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.150000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.658000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,12.446000>}
box{<0,0,-0.076200><0.567961,0.036000,0.076200> rotate<0,-26.563298,0> translate<57.150000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,11.303000>}
box{<0,0,-0.076200><1.143000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.150000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.658000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.658000,0.000000,11.049000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.658000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.527200,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.527200,0.000000,12.192000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.527200,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.591200,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.591200,0.000000,12.192000>}
box{<0,0,-0.076200><4.572000,0.036000,0.076200> rotate<0,-90.000000,0> translate<56.591200,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.527200,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.591200,0.000000,10.287000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.527200,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.591200,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,10.287000>}
box{<0,0,-0.076200><0.558800,0.036000,0.076200> rotate<0,0.000000,0> translate<56.591200,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.587400,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.587400,0.000000,12.192000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.587400,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.587400,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.527200,0.000000,10.287000>}
box{<0,0,-0.076200><0.939800,0.036000,0.076200> rotate<0,0.000000,0> translate<51.587400,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.523400,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.523400,0.000000,12.192000>}
box{<0,0,-0.076200><4.572000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.523400,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.523400,0.000000,10.287000>}
box{<0,0,-0.076200><0.533400,0.036000,0.076200> rotate<0,0.000000,0> translate<46.990000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.523400,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.587400,0.000000,10.287000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.523400,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.527200,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.591200,0.000000,12.192000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.527200,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.527200,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.527200,0.000000,16.764000>}
box{<0,0,-0.076200><4.572000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.527200,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.591200,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.591200,0.000000,10.287000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,-90.000000,0> translate<56.591200,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.587400,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.523400,0.000000,12.192000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.523400,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.587400,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.587400,0.000000,16.764000>}
box{<0,0,-0.076200><4.572000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.587400,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.523400,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.523400,0.000000,10.287000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.523400,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.210200,0.000000,12.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.210200,0.000000,16.002000>}
box{<0,0,-0.076200><3.175000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.210200,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.210200,0.000000,12.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.908200,0.000000,12.827000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.908200,0.000000,12.827000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.908200,0.000000,12.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.908200,0.000000,16.002000>}
box{<0,0,-0.076200><3.175000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.908200,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.206400,0.000000,12.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.206400,0.000000,16.002000>}
box{<0,0,-0.076200><3.175000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.206400,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.206400,0.000000,12.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.904400,0.000000,12.827000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.904400,0.000000,12.827000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.904400,0.000000,12.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.904400,0.000000,16.002000>}
box{<0,0,-0.076200><3.175000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.904400,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.904400,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.285400,0.000000,16.002000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.904400,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.206400,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.825400,0.000000,16.002000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.825400,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.908200,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.289200,0.000000,16.002000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.908200,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.210200,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.829200,0.000000,16.002000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.829200,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,17.145000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.990000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,19.685000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.990000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,17.145000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.150000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,12.446000>}
box{<0,0,-0.076200><4.699000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.150000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,19.685000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.990000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,22.733000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.990000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,18.161000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.150000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.527200,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.527200,0.000000,22.479000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.527200,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.527200,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.591200,0.000000,22.479000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.527200,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.591200,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.591200,0.000000,19.939000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<56.591200,0.000000,19.939000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.591200,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.527200,0.000000,19.939000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.527200,0.000000,19.939000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.587400,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.587400,0.000000,22.479000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.587400,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.587400,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.523400,0.000000,19.939000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.523400,0.000000,19.939000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.523400,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.523400,0.000000,22.479000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.523400,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.587400,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.523400,0.000000,22.479000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.523400,0.000000,22.479000> }
object{ARC(0.683400,0.152400,311.428843,401.992821,0.036000) translate<55.575200,0.000000,21.107300>}
object{ARC(2.439600,0.152400,231.340192,306.870367,0.036000) translate<54.610000,0.000000,22.580600>}
object{ARC(2.058700,0.152400,40.984068,141.007255,0.036000) translate<54.533700,0.000000,20.218400>}
object{ARC(0.593000,0.152400,136.728669,240.936951,0.036000) translate<53.416200,0.000000,21.158100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.933600,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.981600,0.000000,21.590000>}
box{<0,0,-0.076200><3.113443,0.036000,0.076200> rotate<0,-11.767512,0> translate<52.933600,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.060600,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.108600,0.000000,21.463000>}
box{<0,0,-0.076200><3.113443,0.036000,0.076200> rotate<0,-11.767512,0> translate<53.060600,0.000000,20.828000> }
object{ARC(0.683400,0.152400,311.428843,401.992821,0.036000) translate<50.571400,0.000000,21.107300>}
object{ARC(2.439700,0.152400,231.338358,306.867079,0.036000) translate<49.606300,0.000000,22.580600>}
object{ARC(2.058900,0.152400,40.988269,141.010757,0.036000) translate<49.530100,0.000000,20.218400>}
object{ARC(0.593000,0.152400,136.728669,240.936951,0.036000) translate<48.412400,0.000000,21.158100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.929800,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.977800,0.000000,21.590000>}
box{<0,0,-0.076200><3.113443,0.036000,0.076200> rotate<0,-11.767512,0> translate<47.929800,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.056800,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.104800,0.000000,21.463000>}
box{<0,0,-0.076200><3.113443,0.036000,0.076200> rotate<0,-11.767512,0> translate<48.056800,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.523400,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.904400,0.000000,16.764000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.523400,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.587400,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.206400,0.000000,16.764000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.206400,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.206400,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.904400,0.000000,16.764000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.904400,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.904400,0.000000,17.145000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<46.990000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.904400,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.206400,0.000000,17.145000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.904400,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.206400,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.908200,0.000000,17.145000>}
box{<0,0,-0.076200><1.701800,0.036000,0.076200> rotate<0,0.000000,0> translate<51.206400,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.210200,0.000000,17.145000>}
box{<0,0,-0.076200><0.939800,0.036000,0.076200> rotate<0,0.000000,0> translate<56.210200,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.210200,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.908200,0.000000,17.145000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.908200,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.591200,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.210200,0.000000,16.764000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.210200,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.527200,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.908200,0.000000,16.764000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.527200,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.908200,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.210200,0.000000,16.764000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.908200,0.000000,16.764000> }
box{<-1.270000,0,-1.397000><1.270000,0.036000,1.397000> rotate<0,-0.000000,0> translate<49.555400,0.000000,15.367000>}
box{<-1.270000,0,-1.397000><1.270000,0.036000,1.397000> rotate<0,-0.000000,0> translate<54.559200,0.000000,15.367000>}
//X2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,19.685000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.050000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,22.733000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.890000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,22.733000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.050000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,17.907000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.558000,0.000000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,18.161000>}
box{<0,0,-0.076200><0.567961,0.036000,0.076200> rotate<0,26.563298,0> translate<19.050000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,11.303000>}
box{<0,0,-0.076200><0.567961,0.036000,0.076200> rotate<0,26.563298,0> translate<19.050000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,10.287000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.050000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,12.446000>}
box{<0,0,-0.076200><0.567961,0.036000,0.076200> rotate<0,-26.563298,0> translate<19.050000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,11.303000>}
box{<0,0,-0.076200><1.143000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.050000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,11.049000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.558000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.427200,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.427200,0.000000,12.192000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.427200,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.491200,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.491200,0.000000,12.192000>}
box{<0,0,-0.076200><4.572000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.491200,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.427200,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.491200,0.000000,10.287000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.427200,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.491200,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,10.287000>}
box{<0,0,-0.076200><0.558800,0.036000,0.076200> rotate<0,0.000000,0> translate<18.491200,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.487400,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.487400,0.000000,12.192000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.487400,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.487400,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.427200,0.000000,10.287000>}
box{<0,0,-0.076200><0.939800,0.036000,0.076200> rotate<0,0.000000,0> translate<13.487400,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.423400,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.423400,0.000000,12.192000>}
box{<0,0,-0.076200><4.572000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.423400,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.423400,0.000000,10.287000>}
box{<0,0,-0.076200><0.533400,0.036000,0.076200> rotate<0,0.000000,0> translate<8.890000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.423400,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.487400,0.000000,10.287000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.423400,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.427200,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.491200,0.000000,12.192000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.427200,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.427200,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.427200,0.000000,16.764000>}
box{<0,0,-0.076200><4.572000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.427200,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.491200,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.491200,0.000000,10.287000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.491200,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.487400,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.423400,0.000000,12.192000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.423400,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.487400,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.487400,0.000000,16.764000>}
box{<0,0,-0.076200><4.572000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.487400,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.423400,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.423400,0.000000,10.287000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.423400,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.110200,0.000000,12.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.110200,0.000000,16.002000>}
box{<0,0,-0.076200><3.175000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.110200,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.110200,0.000000,12.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.808200,0.000000,12.827000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.808200,0.000000,12.827000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.808200,0.000000,12.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.808200,0.000000,16.002000>}
box{<0,0,-0.076200><3.175000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.808200,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.106400,0.000000,12.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.106400,0.000000,16.002000>}
box{<0,0,-0.076200><3.175000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.106400,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.106400,0.000000,12.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.804400,0.000000,12.827000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.804400,0.000000,12.827000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.804400,0.000000,12.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.804400,0.000000,16.002000>}
box{<0,0,-0.076200><3.175000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.804400,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.804400,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.185400,0.000000,16.002000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.804400,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.106400,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.725400,0.000000,16.002000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.725400,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.808200,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.189200,0.000000,16.002000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.808200,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.110200,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.729200,0.000000,16.002000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.729200,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,17.145000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<8.890000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,19.685000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<8.890000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,17.145000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.050000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,12.446000>}
box{<0,0,-0.076200><4.699000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.050000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,19.685000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.890000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,22.733000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,90.000000,0> translate<8.890000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,18.161000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.050000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.427200,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.427200,0.000000,22.479000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.427200,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.427200,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.491200,0.000000,22.479000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.427200,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.491200,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.491200,0.000000,19.939000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.491200,0.000000,19.939000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.491200,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.427200,0.000000,19.939000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.427200,0.000000,19.939000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.487400,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.487400,0.000000,22.479000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.487400,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.487400,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.423400,0.000000,19.939000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.423400,0.000000,19.939000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.423400,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.423400,0.000000,22.479000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.423400,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.487400,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.423400,0.000000,22.479000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.423400,0.000000,22.479000> }
object{ARC(0.683400,0.152400,311.428843,401.992821,0.036000) translate<17.475200,0.000000,21.107300>}
object{ARC(2.439600,0.152400,231.340192,306.870367,0.036000) translate<16.510000,0.000000,22.580600>}
object{ARC(2.058700,0.152400,40.984068,141.007255,0.036000) translate<16.433700,0.000000,20.218400>}
object{ARC(0.593000,0.152400,136.728669,240.936951,0.036000) translate<15.316200,0.000000,21.158100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.833600,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.881600,0.000000,21.590000>}
box{<0,0,-0.076200><3.113443,0.036000,0.076200> rotate<0,-11.767512,0> translate<14.833600,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.960600,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.008600,0.000000,21.463000>}
box{<0,0,-0.076200><3.113443,0.036000,0.076200> rotate<0,-11.767512,0> translate<14.960600,0.000000,20.828000> }
object{ARC(0.683400,0.152400,311.428843,401.992821,0.036000) translate<12.471400,0.000000,21.107300>}
object{ARC(2.439700,0.152400,231.338358,306.867079,0.036000) translate<11.506300,0.000000,22.580600>}
object{ARC(2.058900,0.152400,40.988269,141.010757,0.036000) translate<11.430100,0.000000,20.218400>}
object{ARC(0.593000,0.152400,136.728669,240.936951,0.036000) translate<10.312400,0.000000,21.158100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.829800,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.877800,0.000000,21.590000>}
box{<0,0,-0.076200><3.113443,0.036000,0.076200> rotate<0,-11.767512,0> translate<9.829800,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.956800,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.004800,0.000000,21.463000>}
box{<0,0,-0.076200><3.113443,0.036000,0.076200> rotate<0,-11.767512,0> translate<9.956800,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.423400,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.804400,0.000000,16.764000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.423400,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.487400,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.106400,0.000000,16.764000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.106400,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.106400,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.804400,0.000000,16.764000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.804400,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.804400,0.000000,17.145000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<8.890000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.804400,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.106400,0.000000,17.145000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.804400,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.106400,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.808200,0.000000,17.145000>}
box{<0,0,-0.076200><1.701800,0.036000,0.076200> rotate<0,0.000000,0> translate<13.106400,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.110200,0.000000,17.145000>}
box{<0,0,-0.076200><0.939800,0.036000,0.076200> rotate<0,0.000000,0> translate<18.110200,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.110200,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.808200,0.000000,17.145000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.808200,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.491200,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.110200,0.000000,16.764000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.110200,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.427200,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.808200,0.000000,16.764000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.427200,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.808200,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.110200,0.000000,16.764000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.808200,0.000000,16.764000> }
box{<-1.270000,0,-1.397000><1.270000,0.036000,1.397000> rotate<0,-0.000000,0> translate<11.455400,0.000000,15.367000>}
box{<-1.270000,0,-1.397000><1.270000,0.036000,1.397000> rotate<0,-0.000000,0> translate<16.459200,0.000000,15.367000>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  CARICABATTERIELITE(-31.115000,0,-29.730700,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//R16	1 ohm 1W	0411/15
//X1		AK300/2
//X2		AK300/2

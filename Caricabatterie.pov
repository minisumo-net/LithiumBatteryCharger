//POVRay-File creato da 3d41.ulp v1.05
//C:/Programmi/EAGLE-4.16r1/projects/CaricaBatterie/Caricabatterie.brd
//22/12/2007 21.01.48 

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
#local cam_y = 206;
#local cam_z = -92;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -4;
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

#local lgt1_pos_x = 24;
#local lgt1_pos_y = 36;
#local lgt1_pos_z = 21;
#local lgt1_intense = 0.737192;
#local lgt2_pos_x = -24;
#local lgt2_pos_y = 36;
#local lgt2_pos_z = 21;
#local lgt2_intense = 0.737192;
#local lgt3_pos_x = 24;
#local lgt3_pos_y = 36;
#local lgt3_pos_z = -14;
#local lgt3_intense = 0.737192;
#local lgt4_pos_x = -24;
#local lgt4_pos_y = 36;
#local lgt4_pos_z = -14;
#local lgt4_intense = 0.737192;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 64.440000;
#declare pcb_y_size = 40.401400;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(318);
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
	//translate<-32.220000,0,-20.200700>
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


#macro CARICABATTERIE(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
//Scheda
box{<65.240000,0,43.581400><0.800000,-1.500000,3.180000> texture{col_brd}}

//Fori(Real)/Componenti
cylinder{<5.842000,1,24.993600><5.842000,-5,24.993600>1.651000 texture{col_hls}}
//Fori(Real)/Scheda
//Fori(Real)/Via
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Componenti
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.1uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<30.480000,0.000000,40.640000>}#end		//ceramic disc capacitator C1 0.1uF C050-025X075
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.1uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<30.480000,0.000000,31.750000>}#end		//ceramic disc capacitator C2 0.1uF C050-025X075
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_DIS_DO41_102MM_H("1N4001",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<15.240000,0.000000,13.970000>}#end		//Diode DO35 10mm hor. D1 1N4001 DO41-10
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {TR_TO220_L2("317TB",)translate<0,0,-6.2> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<5.842000,0.000000,29.819600>}#end		//TO220 Horizontal IC1 317TB TO220H
#ifndef(pack_LED1) #declare global_pack_LED1=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<19.050000,0.000000,35.560000>}#end		//Diskrete 5MM LED LED1 RED LED5MM
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<45.720000,0.000000,30.480000>}#end		//Discrete Resistor 0,3W 10MM Grid R1 470 0207/10
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<45.720000,0.000000,27.940000>}#end		//Discrete Resistor 0,3W 10MM Grid R2 470 0207/10
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<30.480000,0.000000,36.830000>}#end		//Discrete Resistor 0,3W 10MM Grid R3 470 0207/10
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<22.860000,0.000000,27.940000>}#end		//Discrete Resistor 0,3W 10MM Grid R4 470 0207/10
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_DIS_TRIM_PT10_H_10("470",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<53.695600,0.000000,37.058600>}#end		//PT10 R5 470 PT-10
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<22.860000,0.000000,10.160000>}#end		//Discrete Resistor 0,3W 10MM Grid R6 47 0207/10
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<19.050000,0.000000,10.160000>}#end		//Discrete Resistor 0,3W 10MM Grid R7 47 0207/10
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<45.720000,0.000000,25.400000>}#end		//Discrete Resistor 0,3W 10MM Grid R8 47 0207/10
#ifndef(pack_R9) #declare global_pack_R9=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<45.720000,0.000000,21.590000>}#end		//Discrete Resistor 0,3W 10MM Grid R9 47 0207/10
#ifndef(pack_R10) #declare global_pack_R10=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<58.420000,0.000000,21.590000>}#end		//Discrete Resistor 0,3W 10MM Grid R10 1K 0207/10
#ifndef(pack_R11) #declare global_pack_R11=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<45.720000,0.000000,19.050000>}#end		//Discrete Resistor 0,3W 10MM Grid R11 10 0207/10
#ifndef(pack_R12) #declare global_pack_R12=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<45.720000,0.000000,16.510000>}#end		//Discrete Resistor 0,3W 10MM Grid R12 10 0207/10
#ifndef(pack_R13) #declare global_pack_R13=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<45.720000,0.000000,13.970000>}#end		//Discrete Resistor 0,3W 10MM Grid R13 10 0207/10
#ifndef(pack_R14) #declare global_pack_R14=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<45.720000,0.000000,11.430000>}#end		//Discrete Resistor 0,3W 10MM Grid R14 10 0207/10
#ifndef(pack_R15) #declare global_pack_R15=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<45.720000,0.000000,8.890000>}#end		//Discrete Resistor 0,3W 10MM Grid R15 10 0207/10
#ifndef(pack_R16) #declare global_pack_R16=yes; object {RES_DIS_0617_22MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Green*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<44.450000,0.000000,5.080000>}#end		//Discrete Resistor 1W 900mil R16 1 ohm 1W 0411/15
#ifndef(pack_S2) #declare global_pack_S2=yes; object {SWITCH_DIP08()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<30.480000,0.000000,17.780000>}#end		//Dip switch S2  DS-08
#ifndef(pack_T1) #declare global_pack_T1=yes; object {TR_TO18("2N2222A",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<17.780000,0.000000,27.940000>}#end		//TO18 T1 2N2222A TO18
#ifndef(pack_T2) #declare global_pack_T2=yes; object {TR_TO18("2N2222A",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<43.180000,0.000000,36.830000>}#end		//TO18 T2 2N2222A TO18
#ifndef(pack_X1) #declare global_pack_X1=yes; object {ARK_350MM_2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<59.690000,0.000000,13.970000>}#end		//connector X1  AK300/2
#ifndef(pack_X2) #declare global_pack_X2=yes; object {ARK_350MM_2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<6.350000,0.000000,10.160000>}#end		//connector X2  AK300/2
}//End union
#end
#if(pcb_pads_smds=on)
//Piazzole&SMD/Componenti
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<27.940000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<33.020000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<27.940000,0,31.750000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<33.020000,0,31.750000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<15.240000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<15.240000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<8.382000,0,39.979600> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<5.842000,0,39.979600> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<3.302000,0,39.979600> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<19.050000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<19.050000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<40.640000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<50.800000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<40.640000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<50.800000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<35.560000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<25.400000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<22.860000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<22.860000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<58.775600,0,34.518600> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<58.775600,0,39.598600> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<48.615600,0,37.058600> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<22.860000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<22.860000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<19.050000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<19.050000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<40.640000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<50.800000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<40.640000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<50.800000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<53.340000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<63.500000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_R11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<40.640000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_R11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<50.800000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_R12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<40.640000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_R12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<50.800000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_R13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<40.640000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_R13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<50.800000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_R14) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<40.640000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_R14) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<50.800000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_R15) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<40.640000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_R15) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<50.800000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_R16) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<36.830000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_R16) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<52.070000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<26.670000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<26.670000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<26.670000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<26.670000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<26.670000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<26.670000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<26.670000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<26.670000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<34.290000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<34.290000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<34.290000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<34.290000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<34.290000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<34.290000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<34.290000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<34.290000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<16.510000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<19.050000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<19.050000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<41.910000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<44.450000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<44.450000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<59.690000,0,16.484600> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<59.690000,0,11.480800> texture{col_thl}}
#ifndef(global_pack_X2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<6.350000,0,12.674600> texture{col_thl}}
#ifndef(global_pack_X2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<6.350000,0,7.670800> texture{col_thl}}
//Piazzole/Via
object{TOOLS_PCB_VIA(1.778000,0.600000,1,16,0,0) translate<34.290000,0,34.290000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.600000,1,16,0,0) translate<27.940000,0,34.290000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<16.510000,0,26.644600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<33.020000,0,40.614600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<58.775600,0,34.493200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,2,0) translate<44.424600,0,38.100000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,0,0) translate<34.315400,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.422400,0.500000,1,16,1,0) translate<8.356600,0,40.081200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.422400,0.500000,1,16,1,0) translate<5.816600,0,39.979600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.422400,0.500000,1,16,1,0) translate<3.276600,0,40.030400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<50.825400,0,21.539200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,2,0) translate<50.825400,0,18.999200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<50.825400,0,19.024600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<50.825400,0,25.374600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<50.825400,0,27.914600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<50.825400,0,30.429200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<40.614600,0,27.914600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<40.640000,0,30.505400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<40.640000,0,25.374600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<40.690800,0,21.590000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<40.640000,0,19.024600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<40.614600,0,16.484600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<40.640000,0,13.919200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<40.589200,0,11.455400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<40.589200,0,8.864600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<63.500000,0,21.539200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<53.365400,0,21.539200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,0,0) translate<34.264600,0,11.455400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,0,0) translate<34.188400,0,13.995400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,0,0) translate<34.264600,0,16.510000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,0,0) translate<26.644600,0,16.510000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,0,0) translate<26.695400,0,13.970000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,0,0) translate<26.644600,0,11.430000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,0,0) translate<26.670000,0,8.864600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,0,0) translate<26.695400,0,18.999200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,0,0) translate<34.239200,0,19.075400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,0,0) translate<26.644600,0,21.590000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,0,0) translate<26.644600,0,24.130000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,0,0) translate<26.720800,0,26.695400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,0,0) translate<34.163000,0,24.130000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,0,0) translate<34.290000,0,26.670000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,0,0) translate<34.340800,0,21.640800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<22.809200,0,22.860000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<22.809200,0,15.163800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<19.075400,0,15.163800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<22.860000,0,5.054600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<19.075400,0,5.003800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,1,0) translate<15.214600,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,1,0) translate<15.214600,0,18.948400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.676400,0.500000,1,16,1,0) translate<6.426200,0,7.645400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.676400,0.500000,1,16,1,0) translate<6.451600,0,12.725400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<19.024600,0,26.670000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<19.050000,0,29.184600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<27.965400,0,31.724600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<22.860000,0,33.045400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<19.050000,0,34.315400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<19.024600,0,36.855400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<35.534600,0,36.804600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<27.940000,0,40.690800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<33.070800,0,31.724600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<25.349200,0,36.804600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,2,0) translate<41.884600,0,35.585400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,2,0) translate<44.424600,0,35.560000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.676400,0.500000,1,16,1,0) translate<59.664600,0,16.433800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.676400,0.500000,1,16,1,0) translate<59.842400,0,11.430000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<50.825400,0,16.459200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<50.850800,0,13.970000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<50.876200,0,11.430000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<50.825400,0,8.940800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,1,0) translate<36.830000,0,5.029200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,1,0) translate<52.070000,0,5.105400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.778000,0.500000,1,16,2,0) translate<48.641000,0,37.033200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.422400,0.500000,1,16,2,0) translate<58.775600,0,39.547800> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Segnali
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.302000,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.302000,-1.535000,39.979600>}
box{<0,0,-0.406400><2.641600,0.035000,0.406400> rotate<0,90.000000,0> translate<3.302000,-1.535000,39.979600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.302000,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.080000,-1.535000,35.560000>}
box{<0,0,-0.406400><2.514472,0.035000,0.406400> rotate<0,44.997030,0> translate<3.302000,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.842000,-1.535000,39.979600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.842000,-1.535000,38.608000>}
box{<0,0,-0.203200><1.371600,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.842000,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,-1.535000,7.670800>}
box{<0,0,-0.203200><0.050800,0.035000,0.203200> rotate<0,90.000000,0> translate<6.350000,-1.535000,7.670800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.842000,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,36.830000>}
box{<0,0,-0.203200><2.514472,0.035000,0.203200> rotate<0,44.997030,0> translate<5.842000,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,-1.535000,39.979600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,-1.535000,40.132000>}
box{<0,0,-0.203200><0.152400,0.035000,0.203200> rotate<0,90.000000,0> translate<8.382000,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.350000,-1.535000,12.674600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.864600,-1.535000,12.674600>}
box{<0,0,-0.406400><2.514600,0.035000,0.406400> rotate<0,0.000000,0> translate<6.350000,-1.535000,12.674600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,-1.535000,40.640000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.382000,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160000,-1.535000,36.830000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.620000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.350000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.430000,-1.535000,7.620000>}
box{<0,0,-0.406400><5.080000,0.035000,0.406400> rotate<0,0.000000,0> translate<6.350000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.864600,-1.535000,12.674600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.430000,-1.535000,15.240000>}
box{<0,0,-0.406400><3.628023,0.035000,0.406400> rotate<0,-44.997030,0> translate<8.864600,-1.535000,12.674600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.080000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.430000,-1.535000,35.560000>}
box{<0,0,-0.406400><6.350000,0.035000,0.406400> rotate<0,0.000000,0> translate<5.080000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.430000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.430000,-1.535000,35.560000>}
box{<0,0,-0.406400><20.320000,0.035000,0.406400> rotate<0,90.000000,0> translate<11.430000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.430000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.700000,-1.535000,36.830000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,-44.997030,0> translate<11.430000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,39.370000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.160000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.430000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.240000,-1.535000,11.430000>}
box{<0,0,-0.406400><5.388154,0.035000,0.406400> rotate<0,-44.997030,0> translate<11.430000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.240000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.240000,-1.535000,11.430000>}
box{<0,0,-0.406400><7.620000,0.035000,0.406400> rotate<0,-90.000000,0> translate<15.240000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.240000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.510000,-1.535000,20.320000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,-44.997030,0> translate<15.240000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.510000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.510000,-1.535000,26.644600>}
box{<0,0,-0.406400><6.324600,0.035000,0.406400> rotate<0,90.000000,0> translate<16.510000,-1.535000,26.644600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,-1.535000,26.644600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,-1.535000,26.670000>}
box{<0,0,-0.203200><0.025400,0.035000,0.203200> rotate<0,90.000000,0> translate<16.510000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.240000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.780000,-1.535000,19.050000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<15.240000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.240000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.050000,-1.535000,5.080000>}
box{<0,0,-0.406400><5.388154,0.035000,0.406400> rotate<0,44.997030,0> translate<15.240000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.780000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.050000,-1.535000,17.780000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<17.780000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.050000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.050000,-1.535000,17.780000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<19.050000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.050000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.050000,-1.535000,26.670000>}
box{<0,0,-0.406400><3.810000,0.035000,0.406400> rotate<0,90.000000,0> translate<19.050000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.700000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.050000,-1.535000,36.830000>}
box{<0,0,-0.406400><6.350000,0.035000,0.406400> rotate<0,0.000000,0> translate<12.700000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.050000,-1.535000,36.855400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.050000,-1.535000,36.830000>}
box{<0,0,-0.406400><0.025400,0.035000,0.406400> rotate<0,-90.000000,0> translate<19.050000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.024600,-1.535000,36.880800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.050000,-1.535000,36.855400>}
box{<0,0,-0.406400><0.035921,0.035000,0.406400> rotate<0,44.997030,0> translate<19.024600,-1.535000,36.880800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.050000,-1.535000,36.855400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.202400,-1.535000,36.703000>}
box{<0,0,-0.406400><0.215526,0.035000,0.406400> rotate<0,44.997030,0> translate<19.050000,-1.535000,36.855400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.202400,-1.535000,36.703000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.218400,-1.535000,36.703000>}
box{<0,0,-0.406400><1.016000,0.035000,0.406400> rotate<0,0.000000,0> translate<19.202400,-1.535000,36.703000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.050000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.320000,-1.535000,21.590000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<19.050000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.050000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.320000,-1.535000,33.020000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<19.050000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.320000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.590000,-1.535000,21.590000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,0.000000,0> translate<20.320000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.050000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.590000,-1.535000,29.210000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<19.050000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.218400,-1.535000,36.703000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.844000,-1.535000,35.077400>}
box{<0,0,-0.406400><2.298946,0.035000,0.406400> rotate<0,44.997030,0> translate<20.218400,-1.535000,36.703000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.050000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,-1.535000,5.080000>}
box{<0,0,-0.406400><3.810000,0.035000,0.406400> rotate<0,0.000000,0> translate<19.050000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.590000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,-1.535000,20.320000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<21.590000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,-1.535000,20.320000>}
box{<0,0,-0.406400><5.080000,0.035000,0.406400> rotate<0,90.000000,0> translate<22.860000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.590000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,-1.535000,27.940000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<21.590000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,-1.535000,27.940000>}
box{<0,0,-0.406400><5.080000,0.035000,0.406400> rotate<0,90.000000,0> translate<22.860000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.320000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,-1.535000,33.020000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<20.320000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,39.370000>}
box{<0,0,-0.203200><10.160000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.700000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.844000,-1.535000,35.077400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.485600,-1.535000,35.077400>}
box{<0,0,-0.406400><2.641600,0.035000,0.406400> rotate<0,0.000000,0> translate<21.844000,-1.535000,35.077400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,-1.535000,36.830000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,44.997030,0> translate<22.860000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.485600,-1.535000,35.077400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.450800,-1.535000,34.112200>}
box{<0,0,-0.406400><1.364999,0.035000,0.406400> rotate<0,44.997030,0> translate<24.485600,-1.535000,35.077400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.450800,-1.535000,32.664400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.450800,-1.535000,34.112200>}
box{<0,0,-0.406400><1.447800,0.035000,0.406400> rotate<0,90.000000,0> translate<25.450800,-1.535000,34.112200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.450800,-1.535000,32.664400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.365200,-1.535000,31.750000>}
box{<0,0,-0.406400><1.293157,0.035000,0.406400> rotate<0,44.997030,0> translate<25.450800,-1.535000,32.664400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670000,-1.535000,8.890000>}
box{<0,0,-0.304800><5.388154,0.035000,0.304800> rotate<0,-44.997030,0> translate<22.860000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670000,-1.535000,11.430000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<26.670000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.670000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.670000,-1.535000,13.970000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<26.670000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.670000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.670000,-1.535000,16.510000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<26.670000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.670000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.670000,-1.535000,19.050000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<26.670000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.670000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.670000,-1.535000,21.590000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<26.670000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.670000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.670000,-1.535000,24.130000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,-90.000000,0> translate<26.670000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.670000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.873200,-1.535000,26.670000>}
box{<0,0,-0.406400><0.203200,0.035000,0.406400> rotate<0,0.000000,0> translate<26.670000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.365200,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.940000,-1.535000,31.750000>}
box{<0,0,-0.406400><1.574800,0.035000,0.406400> rotate<0,0.000000,0> translate<26.365200,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,34.290000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,44.997030,0> translate<25.400000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,40.640000>}
box{<0,0,-0.203200><19.050000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.890000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.940000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.940000,-1.535000,40.894000>}
box{<0,0,-0.406400><0.254000,0.035000,0.406400> rotate<0,90.000000,0> translate<27.940000,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.940000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.965400,-1.535000,40.640000>}
box{<0,0,-0.406400><0.025400,0.035000,0.406400> rotate<0,0.000000,0> translate<27.940000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.940000,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.514800,-1.535000,42.468800>}
box{<0,0,-0.406400><2.227104,0.035000,0.406400> rotate<0,-44.997030,0> translate<27.940000,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.873200,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.124400,-1.535000,29.921200>}
box{<0,0,-0.406400><4.597891,0.035000,0.406400> rotate<0,-44.997030,0> translate<26.873200,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.124400,-1.535000,38.481000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.124400,-1.535000,29.921200>}
box{<0,0,-0.406400><8.559800,0.035000,0.406400> rotate<0,-90.000000,0> translate<30.124400,-1.535000,29.921200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.965400,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.124400,-1.535000,38.481000>}
box{<0,0,-0.406400><3.053287,0.035000,0.406400> rotate<0,44.997030,0> translate<27.965400,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,21.590000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.670000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,-1.535000,22.860000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.480000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.851600,-1.535000,33.248600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.851600,-1.535000,39.293800>}
box{<0,0,-0.406400><6.045200,0.035000,0.406400> rotate<0,90.000000,0> translate<31.851600,-1.535000,39.293800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.851600,-1.535000,33.248600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,-1.535000,32.080200>}
box{<0,0,-0.406400><1.652367,0.035000,0.406400> rotate<0,44.997030,0> translate<31.851600,-1.535000,33.248600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,-1.535000,32.080200>}
box{<0,0,-0.406400><0.330200,0.035000,0.406400> rotate<0,90.000000,0> translate<33.020000,-1.535000,32.080200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,-1.535000,40.513000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,-1.535000,40.614600>}
box{<0,0,-0.406400><0.101600,0.035000,0.406400> rotate<0,90.000000,0> translate<33.020000,-1.535000,40.614600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,-1.535000,40.614600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,-1.535000,40.640000>}
box{<0,0,-0.203200><0.025400,0.035000,0.203200> rotate<0,90.000000,0> translate<33.020000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.851600,-1.535000,39.293800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.045400,-1.535000,40.487600>}
box{<0,0,-0.406400><1.688288,0.035000,0.406400> rotate<0,-44.997030,0> translate<31.851600,-1.535000,39.293800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,-1.535000,40.513000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.045400,-1.535000,40.487600>}
box{<0,0,-0.406400><0.035921,0.035000,0.406400> rotate<0,44.997030,0> translate<33.020000,-1.535000,40.513000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.290000,-1.535000,30.480000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<33.020000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.290000,0.000000,34.290000>}
box{<0,0,-0.203200><6.350000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.940000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.290000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.315400,-1.535000,8.890000>}
box{<0,0,-0.203200><0.025400,0.035000,0.203200> rotate<0,0.000000,0> translate<34.290000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.514800,-1.535000,42.468800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.569400,-1.535000,42.468800>}
box{<0,0,-0.406400><5.054600,0.035000,0.406400> rotate<0,0.000000,0> translate<29.514800,-1.535000,42.468800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.290000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.052000,-1.535000,26.670000>}
box{<0,0,-0.203200><0.762000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.290000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.315400,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,8.890000>}
box{<0,0,-0.304800><1.244600,0.035000,0.304800> rotate<0,0.000000,0> translate<34.315400,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.290000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,-1.535000,34.290000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.290000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.560000,-1.535000,41.478200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.560000,-1.535000,36.830000>}
box{<0,0,-0.406400><4.648200,0.035000,0.406400> rotate<0,-90.000000,0> translate<35.560000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.569400,-1.535000,42.468800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.560000,-1.535000,41.478200>}
box{<0,0,-0.406400><1.400920,0.035000,0.406400> rotate<0,44.997030,0> translate<34.569400,-1.535000,42.468800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.830000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.830000,-1.535000,5.080000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,-90.000000,0> translate<36.830000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.560000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.830000,-1.535000,7.620000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<35.560000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.830000,-1.535000,24.130000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<34.290000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.290000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.830000,-1.535000,30.480000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.290000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.560000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.830000,-1.535000,38.100000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,-44.997030,0> translate<35.560000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100000,-1.535000,22.860000>}
box{<0,0,-0.203200><6.350000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.750000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.830000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,-1.535000,25.400000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<36.830000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,-1.535000,25.400000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,-90.000000,0> translate<38.100000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.830000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100000,-1.535000,31.750000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.830000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100000,-1.535000,31.750000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.100000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100000,-1.535000,36.830000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.560000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.052000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,-1.535000,30.480000>}
box{<0,0,-0.203200><5.388154,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.052000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.370000,-1.535000,27.940000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<38.100000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370000,-1.535000,35.560000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.100000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.290000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.640000,-1.535000,11.430000>}
box{<0,0,-0.406400><6.350000,0.035000,0.406400> rotate<0,0.000000,0> translate<34.290000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.640000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.640000,-1.535000,11.430000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<40.640000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.290000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.640000,-1.535000,13.970000>}
box{<0,0,-0.406400><6.350000,0.035000,0.406400> rotate<0,0.000000,0> translate<34.290000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.290000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.640000,-1.535000,16.510000>}
box{<0,0,-0.406400><6.350000,0.035000,0.406400> rotate<0,0.000000,0> translate<34.290000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.290000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.640000,-1.535000,19.050000>}
box{<0,0,-0.406400><6.350000,0.035000,0.406400> rotate<0,0.000000,0> translate<34.290000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.290000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.640000,-1.535000,21.590000>}
box{<0,0,-0.406400><6.350000,0.035000,0.406400> rotate<0,0.000000,0> translate<34.290000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.640000,-1.535000,25.400000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.100000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.370000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,27.940000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<39.370000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.640000,-1.535000,30.480000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.862000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.640000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.665400,-1.535000,30.505400>}
box{<0,0,-0.203200><0.035921,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.640000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910000,-1.535000,25.400000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<40.640000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.910000,-1.535000,35.560000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.370000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,-1.535000,26.670000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<41.910000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,-1.535000,34.290000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<41.910000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,-1.535000,34.290000>}
box{<0,0,-0.304800><7.620000,0.035000,0.304800> rotate<0,90.000000,0> translate<43.180000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.830000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.424600,-1.535000,38.100000>}
box{<0,0,-0.406400><7.594600,0.035000,0.406400> rotate<0,0.000000,0> translate<36.830000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.424600,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.450000,-1.535000,38.100000>}
box{<0,0,-0.203200><0.025400,0.035000,0.203200> rotate<0,0.000000,0> translate<44.424600,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.475400,-1.535000,26.746200>}
box{<0,0,-0.304800><8.813837,0.035000,0.304800> rotate<0,89.828954,0> translate<44.450000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.475400,-1.535000,26.746200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.720000,-1.535000,25.400000>}
box{<0,0,-0.304800><1.833380,0.035000,0.304800> rotate<0,47.242625,0> translate<44.475400,-1.535000,26.746200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720000,-1.535000,36.830000>}
box{<0,0,-0.203200><7.620000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.100000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990000,-1.535000,31.750000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,-90.000000,0> translate<46.990000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990000,-1.535000,35.560000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<45.720000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.450000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.990000,-1.535000,38.100000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<44.450000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,-1.535000,30.480000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<46.990000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.990000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<48.260000,-1.535000,36.830000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<46.990000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.488600,-1.535000,37.058600>}
box{<0,0,-0.203200><0.323289,0.035000,0.203200> rotate<0,-44.997030,0> translate<48.260000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.488600,-1.535000,37.058600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.615600,-1.535000,37.058600>}
box{<0,0,-0.203200><0.127000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.488600,-1.535000,37.058600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<48.615600,-1.535000,37.058600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<48.615600,-1.535000,38.455600>}
box{<0,0,-0.406400><1.397000,0.035000,0.406400> rotate<0,90.000000,0> translate<48.615600,-1.535000,38.455600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<48.615600,-1.535000,38.455600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.530000,-1.535000,39.370000>}
box{<0,0,-0.406400><1.293157,0.035000,0.406400> rotate<0,-44.997030,0> translate<48.615600,-1.535000,38.455600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,-1.535000,8.890000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<50.800000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,-1.535000,11.430000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<50.800000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,-1.535000,13.970000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<50.800000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,-1.535000,16.510000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<50.800000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,-1.535000,19.050000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<50.800000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,-1.535000,21.590000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<50.800000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.720000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800000,-1.535000,25.400000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<45.720000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,-1.535000,25.400000>}
box{<0,0,-0.406400><3.810000,0.035000,0.406400> rotate<0,90.000000,0> translate<50.800000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800000,-1.535000,27.940000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,-90.000000,0> translate<50.800000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,-1.535000,30.480000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.260000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.850800,-1.535000,11.480800>}
box{<0,0,-0.203200><0.071842,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.800000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.070000,-1.535000,5.080000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<50.800000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.340000,-1.535000,21.590000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<50.800000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.420000,-1.535000,27.940000>}
box{<0,0,-0.304800><7.620000,0.035000,0.304800> rotate<0,0.000000,0> translate<50.800000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.530000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,-1.535000,39.370000>}
box{<0,0,-0.406400><8.890000,0.035000,0.406400> rotate<0,0.000000,0> translate<49.530000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.648600,-1.535000,39.598600>}
box{<0,0,-0.203200><0.323289,0.035000,0.203200> rotate<0,-44.997030,0> translate<58.420000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.775600,-1.535000,34.493200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.775600,-1.535000,30.124400>}
box{<0,0,-0.406400><4.368800,0.035000,0.406400> rotate<0,-90.000000,0> translate<58.775600,-1.535000,30.124400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.775600,-1.535000,34.518600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.775600,-1.535000,34.493200>}
box{<0,0,-0.203200><0.025400,0.035000,0.203200> rotate<0,-90.000000,0> translate<58.775600,-1.535000,34.493200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.648600,-1.535000,39.598600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.775600,-1.535000,39.598600>}
box{<0,0,-0.203200><0.127000,0.035000,0.203200> rotate<0,0.000000,0> translate<58.648600,-1.535000,39.598600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.850800,-1.535000,11.480800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.690000,-1.535000,11.480800>}
box{<0,0,-0.406400><8.839200,0.035000,0.406400> rotate<0,0.000000,0> translate<50.850800,-1.535000,11.480800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690000,-1.535000,16.484600>}
box{<0,0,-0.304800><10.185400,0.035000,0.304800> rotate<0,-90.000000,0> translate<59.690000,-1.535000,16.484600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.420000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690000,-1.535000,26.670000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<58.420000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<60.960000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<60.960000,-1.535000,22.860000>}
box{<0,0,-0.406400><5.080000,0.035000,0.406400> rotate<0,-90.000000,0> translate<60.960000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.775600,-1.535000,30.124400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<60.960000,-1.535000,27.940000>}
box{<0,0,-0.406400><3.089208,0.035000,0.406400> rotate<0,44.997030,0> translate<58.775600,-1.535000,30.124400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<60.960000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<62.230000,-1.535000,21.590000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<60.960000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<62.230000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<63.500000,-1.535000,21.590000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,0.000000,0> translate<62.230000,-1.535000,21.590000> }
//Text
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,17.627600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.983500,-1.535000,17.627600>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<8.356600,-1.535000,17.627600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.983500,-1.535000,17.627600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,18.169900>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,44.997030,0> translate<9.441200,-1.535000,18.169900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,18.169900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.983500,-1.535000,18.712200>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,-44.997030,0> translate<9.441200,-1.535000,18.169900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.983500,-1.535000,18.712200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,18.712200>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<8.356600,-1.535000,18.712200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,19.264700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,19.535800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<9.441200,-1.535000,19.535800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,19.535800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,19.535800>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<8.356600,-1.535000,19.535800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,19.264700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,19.807000>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<8.356600,-1.535000,19.807000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.254700,-1.535000,19.535800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.983500,-1.535000,19.535800>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,0.000000,0> translate<9.983500,-1.535000,19.535800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,20.356100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,20.356100>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<8.356600,-1.535000,20.356100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,20.356100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,21.169500>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,90.000000,0> translate<9.441200,-1.535000,21.169500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,21.169500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.170000,-1.535000,21.440700>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<9.170000,-1.535000,21.440700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.170000,-1.535000,21.440700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,21.440700>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<8.356600,-1.535000,21.440700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,21.993200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,22.264300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<9.441200,-1.535000,22.264300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,22.264300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,22.264300>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<8.356600,-1.535000,22.264300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,21.993200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,22.535500>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<8.356600,-1.535000,22.535500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.254700,-1.535000,22.264300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.983500,-1.535000,22.264300>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,0.000000,0> translate<9.983500,-1.535000,22.264300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,23.084600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,23.898000>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,90.000000,0> translate<8.356600,-1.535000,23.898000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,23.898000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.627700,-1.535000,24.169200>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<8.356600,-1.535000,23.898000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.627700,-1.535000,24.169200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.898900,-1.535000,23.898000>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<8.627700,-1.535000,24.169200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.898900,-1.535000,23.898000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.898900,-1.535000,23.355700>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<8.898900,-1.535000,23.355700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.898900,-1.535000,23.355700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.170000,-1.535000,23.084600>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<8.898900,-1.535000,23.355700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.170000,-1.535000,23.084600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,23.355700>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<9.170000,-1.535000,23.084600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,23.355700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,24.169200>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,90.000000,0> translate<9.441200,-1.535000,24.169200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,24.721700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.627700,-1.535000,24.721700>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<8.627700,-1.535000,24.721700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.627700,-1.535000,24.721700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,24.992800>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<8.356600,-1.535000,24.992800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,24.992800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,25.806300>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,90.000000,0> translate<8.356600,-1.535000,25.806300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,25.806300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,25.806300>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<8.356600,-1.535000,25.806300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,26.358800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,26.358800>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<8.356600,-1.535000,26.358800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,26.358800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,26.629900>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<9.441200,-1.535000,26.629900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,26.629900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.170000,-1.535000,26.901100>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<9.170000,-1.535000,26.901100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.170000,-1.535000,26.901100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,26.901100>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<8.356600,-1.535000,26.901100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.170000,-1.535000,26.901100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,27.172200>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<9.170000,-1.535000,26.901100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,27.172200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.170000,-1.535000,27.443400>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<9.170000,-1.535000,27.443400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.170000,-1.535000,27.443400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,27.443400>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<8.356600,-1.535000,27.443400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,28.267000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,28.809300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<8.356600,-1.535000,28.809300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,28.809300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.627700,-1.535000,29.080500>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<8.356600,-1.535000,28.809300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.627700,-1.535000,29.080500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.170000,-1.535000,29.080500>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<8.627700,-1.535000,29.080500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.170000,-1.535000,29.080500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,28.809300>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<9.170000,-1.535000,29.080500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,28.809300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,28.267000>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<9.441200,-1.535000,28.267000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,28.267000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.170000,-1.535000,27.995900>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<9.170000,-1.535000,27.995900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.170000,-1.535000,27.995900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.627700,-1.535000,27.995900>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<8.627700,-1.535000,27.995900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.627700,-1.535000,27.995900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,28.267000>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<8.356600,-1.535000,28.267000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,29.633000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.627700,-1.535000,29.633000>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<8.356600,-1.535000,29.633000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.627700,-1.535000,29.633000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.627700,-1.535000,29.904100>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<8.627700,-1.535000,29.904100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.627700,-1.535000,29.904100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,29.904100>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<8.356600,-1.535000,29.904100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,29.904100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,29.633000>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<8.356600,-1.535000,29.633000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,30.451500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,30.451500>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<8.356600,-1.535000,30.451500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,30.451500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,31.264900>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,90.000000,0> translate<9.441200,-1.535000,31.264900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,31.264900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.170000,-1.535000,31.536100>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<9.170000,-1.535000,31.536100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.170000,-1.535000,31.536100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,31.536100>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<8.356600,-1.535000,31.536100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,32.902000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,32.359700>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<8.356600,-1.535000,32.359700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,32.359700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.627700,-1.535000,32.088600>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<8.356600,-1.535000,32.359700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.627700,-1.535000,32.088600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.170000,-1.535000,32.088600>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<8.627700,-1.535000,32.088600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.170000,-1.535000,32.088600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,32.359700>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<9.170000,-1.535000,32.088600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,32.359700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,32.902000>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<9.441200,-1.535000,32.902000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,32.902000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.170000,-1.535000,33.173200>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<9.170000,-1.535000,33.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.170000,-1.535000,33.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.898900,-1.535000,33.173200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<8.898900,-1.535000,33.173200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.898900,-1.535000,33.173200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.898900,-1.535000,32.088600>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,-90.000000,0> translate<8.898900,-1.535000,32.088600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.712400,-1.535000,33.996800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.627700,-1.535000,33.996800>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,0.000000,0> translate<8.627700,-1.535000,33.996800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.627700,-1.535000,33.996800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.356600,-1.535000,34.268000>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<8.356600,-1.535000,34.268000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,33.725700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.441200,-1.535000,34.268000>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<9.441200,-1.535000,34.268000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.958500,-1.535000,20.804000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,20.804000>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<62.331600,-1.535000,20.804000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,20.804000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,21.888600>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<62.331600,-1.535000,21.888600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,22.441100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,22.712200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<63.416200,-1.535000,22.712200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,22.712200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,22.712200>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<62.331600,-1.535000,22.712200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,22.441100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,22.983400>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<62.331600,-1.535000,22.983400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<64.229700,-1.535000,22.712200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.958500,-1.535000,22.712200>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,0.000000,0> translate<63.958500,-1.535000,22.712200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.145000,-1.535000,23.532500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.145000,-1.535000,24.617100>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<63.145000,-1.535000,24.617100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,25.169600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.958500,-1.535000,25.169600>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<62.331600,-1.535000,25.169600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.958500,-1.535000,25.169600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.958500,-1.535000,25.983000>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,90.000000,0> translate<63.958500,-1.535000,25.983000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.958500,-1.535000,25.983000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.687400,-1.535000,26.254200>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<63.687400,-1.535000,26.254200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.687400,-1.535000,26.254200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.145000,-1.535000,26.254200>}
box{<0,0,-0.076200><0.542400,0.035000,0.076200> rotate<0,0.000000,0> translate<63.145000,-1.535000,26.254200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.145000,-1.535000,26.254200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.873900,-1.535000,25.983000>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<62.873900,-1.535000,25.983000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.873900,-1.535000,25.983000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.873900,-1.535000,25.169600>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,-90.000000,0> translate<62.873900,-1.535000,25.169600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,27.077800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,27.620100>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<62.331600,-1.535000,27.620100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,27.620100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.602700,-1.535000,27.891300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<62.331600,-1.535000,27.620100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.602700,-1.535000,27.891300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.145000,-1.535000,27.891300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<62.602700,-1.535000,27.891300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.145000,-1.535000,27.891300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,27.620100>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<63.145000,-1.535000,27.891300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,27.620100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,27.077800>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<63.416200,-1.535000,27.077800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,27.077800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.145000,-1.535000,26.806700>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<63.145000,-1.535000,26.806700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.145000,-1.535000,26.806700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.602700,-1.535000,26.806700>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<62.602700,-1.535000,26.806700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.602700,-1.535000,26.806700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,27.077800>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<62.331600,-1.535000,27.077800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.687400,-1.535000,31.165500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.958500,-1.535000,30.894300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<63.687400,-1.535000,31.165500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.958500,-1.535000,30.894300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.958500,-1.535000,30.352000>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<63.958500,-1.535000,30.352000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.958500,-1.535000,30.352000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.687400,-1.535000,30.080900>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<63.687400,-1.535000,30.080900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.687400,-1.535000,30.080900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.602700,-1.535000,30.080900>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,0.000000,0> translate<62.602700,-1.535000,30.080900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.602700,-1.535000,30.080900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,30.352000>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<62.331600,-1.535000,30.352000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,30.352000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,30.894300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<62.331600,-1.535000,30.894300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,30.894300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.602700,-1.535000,31.165500>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<62.331600,-1.535000,30.894300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.958500,-1.535000,31.718000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,31.718000>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<62.331600,-1.535000,31.718000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.145000,-1.535000,31.718000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,31.989100>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<63.145000,-1.535000,31.718000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,31.989100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,32.531400>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<63.416200,-1.535000,32.531400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,32.531400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.145000,-1.535000,32.802600>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<63.145000,-1.535000,32.802600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.145000,-1.535000,32.802600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,32.802600>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<62.331600,-1.535000,32.802600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,33.626200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,34.168500>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<63.416200,-1.535000,34.168500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,34.168500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.145000,-1.535000,34.439700>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<63.145000,-1.535000,34.439700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.145000,-1.535000,34.439700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,34.439700>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<62.331600,-1.535000,34.439700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,34.439700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,33.626200>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,-90.000000,0> translate<62.331600,-1.535000,33.626200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,33.626200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.602700,-1.535000,33.355100>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<62.331600,-1.535000,33.626200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.602700,-1.535000,33.355100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.873900,-1.535000,33.626200>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<62.602700,-1.535000,33.355100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.873900,-1.535000,33.626200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.873900,-1.535000,34.439700>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,90.000000,0> translate<62.873900,-1.535000,34.439700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,34.992200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,34.992200>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<62.331600,-1.535000,34.992200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.873900,-1.535000,34.992200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,35.534500>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,-44.997030,0> translate<62.873900,-1.535000,34.992200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,35.534500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,35.805600>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<63.416200,-1.535000,35.805600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<61.789300,-1.535000,36.898700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<61.789300,-1.535000,37.169800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<61.789300,-1.535000,37.169800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<61.789300,-1.535000,37.169800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.060500,-1.535000,37.441000>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,-44.997030,0> translate<61.789300,-1.535000,37.169800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.060500,-1.535000,37.441000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,37.441000>}
box{<0,0,-0.076200><1.355700,0.035000,0.076200> rotate<0,0.000000,0> translate<62.060500,-1.535000,37.441000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,37.441000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,36.627500>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,-90.000000,0> translate<63.416200,-1.535000,36.627500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,36.627500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.145000,-1.535000,36.356400>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<63.145000,-1.535000,36.356400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.145000,-1.535000,36.356400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.602700,-1.535000,36.356400>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<62.602700,-1.535000,36.356400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.602700,-1.535000,36.356400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,36.627500>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<62.331600,-1.535000,36.627500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,36.627500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,37.441000>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,90.000000,0> translate<62.331600,-1.535000,37.441000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,38.806900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,38.264600>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<62.331600,-1.535000,38.264600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,38.264600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.602700,-1.535000,37.993500>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<62.331600,-1.535000,38.264600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.602700,-1.535000,37.993500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.145000,-1.535000,37.993500>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<62.602700,-1.535000,37.993500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.145000,-1.535000,37.993500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,38.264600>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<63.145000,-1.535000,37.993500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,38.264600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,38.806900>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<63.416200,-1.535000,38.806900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,38.806900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.145000,-1.535000,39.078100>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<63.145000,-1.535000,39.078100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.145000,-1.535000,39.078100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.873900,-1.535000,39.078100>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<62.873900,-1.535000,39.078100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.873900,-1.535000,39.078100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.873900,-1.535000,37.993500>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,-90.000000,0> translate<62.873900,-1.535000,37.993500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.331600,-1.535000,39.630600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,39.630600>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<62.331600,-1.535000,39.630600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.873900,-1.535000,39.630600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,40.172900>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,-44.997030,0> translate<62.873900,-1.535000,39.630600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,40.172900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.416200,-1.535000,40.444000>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<63.416200,-1.535000,40.444000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.616200,-1.535000,8.966200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.616200,-1.535000,9.508500>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<2.616200,-1.535000,9.508500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.616200,-1.535000,9.237300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.243100,-1.535000,9.237300>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<2.616200,-1.535000,9.237300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.243100,-1.535000,8.966200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.243100,-1.535000,9.508500>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<4.243100,-1.535000,9.508500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.616200,-1.535000,10.057600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.243100,-1.535000,10.057600>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<2.616200,-1.535000,10.057600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.243100,-1.535000,10.057600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.616200,-1.535000,11.142200>}
box{<0,0,-0.076200><1.955290,0.035000,0.076200> rotate<0,33.687844,0> translate<2.616200,-1.535000,11.142200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.616200,-1.535000,11.142200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.243100,-1.535000,11.142200>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<2.616200,-1.535000,11.142200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<56.313100,-1.535000,13.589600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<56.313100,-1.535000,13.047300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<56.313100,-1.535000,13.047300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<56.313100,-1.535000,13.047300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<56.042000,-1.535000,12.776200>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<56.042000,-1.535000,12.776200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<56.042000,-1.535000,12.776200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.957300,-1.535000,12.776200>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,0.000000,0> translate<54.957300,-1.535000,12.776200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.957300,-1.535000,12.776200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.686200,-1.535000,13.047300>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<54.686200,-1.535000,13.047300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.686200,-1.535000,13.047300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.686200,-1.535000,13.589600>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<54.686200,-1.535000,13.589600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.686200,-1.535000,13.589600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.957300,-1.535000,13.860800>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<54.686200,-1.535000,13.589600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.957300,-1.535000,13.860800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<56.042000,-1.535000,13.860800>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,0.000000,0> translate<54.957300,-1.535000,13.860800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<56.042000,-1.535000,13.860800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<56.313100,-1.535000,13.589600>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<56.042000,-1.535000,13.860800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<56.313100,-1.535000,14.413300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.957300,-1.535000,14.413300>}
box{<0,0,-0.076200><1.355800,0.035000,0.076200> rotate<0,0.000000,0> translate<54.957300,-1.535000,14.413300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.957300,-1.535000,14.413300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.686200,-1.535000,14.684400>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<54.686200,-1.535000,14.684400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.686200,-1.535000,14.684400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.686200,-1.535000,15.226700>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<54.686200,-1.535000,15.226700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.686200,-1.535000,15.226700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.957300,-1.535000,15.497900>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<54.686200,-1.535000,15.226700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.957300,-1.535000,15.497900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<56.313100,-1.535000,15.497900>}
box{<0,0,-0.076200><1.355800,0.035000,0.076200> rotate<0,0.000000,0> translate<54.957300,-1.535000,15.497900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.686200,-1.535000,16.592700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<56.313100,-1.535000,16.592700>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<54.686200,-1.535000,16.592700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<56.313100,-1.535000,16.050400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<56.313100,-1.535000,17.135000>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<56.313100,-1.535000,17.135000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,17.856200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.658900,-1.535000,17.856200>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<2.032000,-1.535000,17.856200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.658900,-1.535000,17.856200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.658900,-1.535000,18.940800>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<3.658900,-1.535000,18.940800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.845400,-1.535000,17.856200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.845400,-1.535000,18.398500>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<2.845400,-1.535000,18.398500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,19.764400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,20.306700>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<2.032000,-1.535000,20.306700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,20.306700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.303100,-1.535000,20.577900>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<2.032000,-1.535000,20.306700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.303100,-1.535000,20.577900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.845400,-1.535000,20.577900>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<2.303100,-1.535000,20.577900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.845400,-1.535000,20.577900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,20.306700>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<2.845400,-1.535000,20.577900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,20.306700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,19.764400>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<3.116600,-1.535000,19.764400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,19.764400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.845400,-1.535000,19.493300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<2.845400,-1.535000,19.493300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.845400,-1.535000,19.493300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.303100,-1.535000,19.493300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<2.303100,-1.535000,19.493300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.303100,-1.535000,19.493300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,19.764400>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<2.032000,-1.535000,19.764400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,21.130400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,21.130400>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<2.032000,-1.535000,21.130400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.574300,-1.535000,21.130400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,21.672700>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,-44.997030,0> translate<2.574300,-1.535000,21.130400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,21.672700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,21.943800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<3.116600,-1.535000,21.943800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.658900,-1.535000,24.131700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,24.131700>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<2.032000,-1.535000,24.131700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,24.131700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,25.216300>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<2.032000,-1.535000,25.216300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,25.768800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,26.039900>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<3.116600,-1.535000,26.039900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,26.039900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,26.039900>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<2.032000,-1.535000,26.039900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,25.768800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,26.311100>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<2.032000,-1.535000,26.311100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.930100,-1.535000,26.039900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.658900,-1.535000,26.039900>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,0.000000,0> translate<3.658900,-1.535000,26.039900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.489700,-1.535000,26.860200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,26.860200>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<1.489700,-1.535000,26.860200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,26.860200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,27.673600>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,90.000000,0> translate<3.116600,-1.535000,27.673600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,27.673600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.845400,-1.535000,27.944800>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<2.845400,-1.535000,27.944800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.845400,-1.535000,27.944800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.303100,-1.535000,27.944800>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<2.303100,-1.535000,27.944800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.303100,-1.535000,27.944800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,27.673600>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<2.032000,-1.535000,27.673600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,27.673600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,26.860200>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,-90.000000,0> translate<2.032000,-1.535000,26.860200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,28.768400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,29.310700>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<2.032000,-1.535000,29.310700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,29.310700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.303100,-1.535000,29.581900>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<2.032000,-1.535000,29.310700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.303100,-1.535000,29.581900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.845400,-1.535000,29.581900>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<2.303100,-1.535000,29.581900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.845400,-1.535000,29.581900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,29.310700>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<2.845400,-1.535000,29.581900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,29.310700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,28.768400>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<3.116600,-1.535000,28.768400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,28.768400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.845400,-1.535000,28.497300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<2.845400,-1.535000,28.497300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.845400,-1.535000,28.497300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.303100,-1.535000,28.497300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<2.303100,-1.535000,28.497300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.303100,-1.535000,28.497300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,28.768400>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<2.032000,-1.535000,28.768400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.387800,-1.535000,30.405500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.303100,-1.535000,30.405500>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,0.000000,0> translate<2.303100,-1.535000,30.405500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.303100,-1.535000,30.405500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,30.676700>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<2.032000,-1.535000,30.676700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,30.134400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,30.676700>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<3.116600,-1.535000,30.676700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,32.039200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,31.496900>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<2.032000,-1.535000,31.496900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,31.496900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.303100,-1.535000,31.225800>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<2.032000,-1.535000,31.496900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.303100,-1.535000,31.225800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.845400,-1.535000,31.225800>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<2.303100,-1.535000,31.225800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.845400,-1.535000,31.225800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,31.496900>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<2.845400,-1.535000,31.225800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,31.496900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,32.039200>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<3.116600,-1.535000,32.039200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,32.039200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.845400,-1.535000,32.310400>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<2.845400,-1.535000,32.310400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.845400,-1.535000,32.310400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.574300,-1.535000,32.310400>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<2.574300,-1.535000,32.310400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.574300,-1.535000,32.310400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.574300,-1.535000,31.225800>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,-90.000000,0> translate<2.574300,-1.535000,31.225800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,33.947500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,33.134000>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,-90.000000,0> translate<3.116600,-1.535000,33.134000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,33.134000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.845400,-1.535000,32.862900>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<2.845400,-1.535000,32.862900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.845400,-1.535000,32.862900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.303100,-1.535000,32.862900>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<2.303100,-1.535000,32.862900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.303100,-1.535000,32.862900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,33.134000>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<2.032000,-1.535000,33.134000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,33.134000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,33.947500>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,90.000000,0> translate<2.032000,-1.535000,33.947500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.658900,-1.535000,34.500000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,34.500000>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<2.032000,-1.535000,34.500000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.845400,-1.535000,34.500000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,34.771100>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<2.845400,-1.535000,34.500000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,34.771100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,35.313400>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<3.116600,-1.535000,35.313400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.116600,-1.535000,35.313400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.845400,-1.535000,35.584600>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<2.845400,-1.535000,35.584600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.845400,-1.535000,35.584600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.032000,-1.535000,35.584600>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<2.032000,-1.535000,35.584600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.035800,-1.535000,14.605600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.951200,-1.535000,14.605600>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<5.951200,-1.535000,14.605600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.493500,-1.535000,15.148000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.493500,-1.535000,14.063300>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,-90.000000,0> translate<6.493500,-1.535000,14.063300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.474600,-1.535000,16.383600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.390000,-1.535000,16.383600>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<62.390000,-1.535000,16.383600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.932300,-1.535000,16.926000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.932300,-1.535000,15.841300>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,-90.000000,0> translate<62.932300,-1.535000,15.841300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.010400,-1.535000,9.660300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.925800,-1.535000,9.660300>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<5.925800,-1.535000,9.660300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<63.322200,-1.535000,11.717700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<62.237600,-1.535000,11.717700>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<62.237600,-1.535000,11.717700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.777200,-1.535000,3.835400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,4.377700>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,-44.997030,0> translate<30.777200,-1.535000,3.835400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,4.377700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,4.377700>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<29.692600,-1.535000,4.377700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,3.835400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,4.920000>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<29.692600,-1.535000,4.920000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,6.557100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,6.014800>}
box{<0,0,-0.076200><0.606287,0.035000,0.076200> rotate<0,-63.434988,0> translate<31.048400,-1.535000,6.014800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,6.014800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.506000,-1.535000,5.472500>}
box{<0,0,-0.076200><0.766999,0.035000,0.076200> rotate<0,-44.991748,0> translate<30.506000,-1.535000,5.472500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.506000,-1.535000,5.472500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,5.472500>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<29.963700,-1.535000,5.472500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,5.472500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,5.743600>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<29.692600,-1.535000,5.743600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,5.743600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,6.285900>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<29.692600,-1.535000,6.285900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,6.285900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,6.557100>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<29.692600,-1.535000,6.285900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,6.557100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.234900,-1.535000,6.557100>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,0.000000,0> translate<29.963700,-1.535000,6.557100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.234900,-1.535000,6.557100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.506000,-1.535000,6.285900>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<30.234900,-1.535000,6.557100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.506000,-1.535000,6.285900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.506000,-1.535000,5.472500>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,-90.000000,0> translate<30.506000,-1.535000,5.472500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.777200,-1.535000,7.109600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,7.651900>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,-44.997030,0> translate<30.777200,-1.535000,7.109600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,7.651900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,7.651900>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<29.692600,-1.535000,7.651900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,7.109600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,8.194200>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<29.692600,-1.535000,8.194200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,8.746700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,8.746700>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,0.000000,0> translate<29.963700,-1.535000,8.746700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,8.746700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,9.017800>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<31.048400,-1.535000,8.746700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,9.017800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,9.560100>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<31.319500,-1.535000,9.560100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,9.560100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,9.831300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<31.048400,-1.535000,9.831300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,9.831300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,9.831300>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,0.000000,0> translate<29.963700,-1.535000,9.831300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,9.831300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,9.560100>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<29.692600,-1.535000,9.560100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,9.560100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,9.017800>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<29.692600,-1.535000,9.017800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,9.017800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,8.746700>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<29.692600,-1.535000,9.017800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,8.746700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,9.831300>}
box{<0,0,-0.076200><1.533927,0.035000,0.076200> rotate<0,-44.994389,0> translate<29.963700,-1.535000,8.746700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,11.468400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,10.383800>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,-90.000000,0> translate<29.692600,-1.535000,10.383800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,10.383800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.777200,-1.535000,11.468400>}
box{<0,0,-0.076200><1.533856,0.035000,0.076200> rotate<0,-44.997030,0> translate<29.692600,-1.535000,10.383800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.777200,-1.535000,11.468400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,11.468400>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,0.000000,0> translate<30.777200,-1.535000,11.468400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,11.468400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,11.197200>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<31.048400,-1.535000,11.468400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,11.197200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,10.654900>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<31.319500,-1.535000,10.654900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,10.654900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,10.383800>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<31.048400,-1.535000,10.383800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,12.020900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,12.020900>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,0.000000,0> translate<29.963700,-1.535000,12.020900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,12.020900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,12.292000>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<31.048400,-1.535000,12.020900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,12.292000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,12.834300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<31.319500,-1.535000,12.834300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,12.834300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,13.105500>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<31.048400,-1.535000,13.105500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,13.105500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,13.105500>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,0.000000,0> translate<29.963700,-1.535000,13.105500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,13.105500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,12.834300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<29.692600,-1.535000,12.834300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,12.834300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,12.292000>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<29.692600,-1.535000,12.292000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,12.292000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,12.020900>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<29.692600,-1.535000,12.292000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,12.020900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,13.105500>}
box{<0,0,-0.076200><1.533927,0.035000,0.076200> rotate<0,-44.994389,0> translate<29.963700,-1.535000,12.020900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,13.658000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,13.658000>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,0.000000,0> translate<29.963700,-1.535000,13.658000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,13.658000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,13.929100>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<31.048400,-1.535000,13.658000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,13.929100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,14.471400>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<31.319500,-1.535000,14.471400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,14.471400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,14.742600>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<31.048400,-1.535000,14.742600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,14.742600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,14.742600>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,0.000000,0> translate<29.963700,-1.535000,14.742600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,14.742600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,14.471400>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<29.692600,-1.535000,14.471400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,14.471400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,13.929100>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<29.692600,-1.535000,13.929100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,13.929100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,13.658000>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<29.692600,-1.535000,13.929100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,13.658000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,14.742600>}
box{<0,0,-0.076200><1.533927,0.035000,0.076200> rotate<0,-44.994389,0> translate<29.963700,-1.535000,13.658000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,16.108500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,16.108500>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<29.692600,-1.535000,16.108500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,16.108500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.506000,-1.535000,15.295100>}
box{<0,0,-0.076200><1.150392,0.035000,0.076200> rotate<0,-44.993509,0> translate<30.506000,-1.535000,15.295100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.506000,-1.535000,15.295100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.506000,-1.535000,16.379700>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<30.506000,-1.535000,16.379700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.777200,-1.535000,18.569300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,19.111600>}
box{<0,0,-0.076200><1.212620,0.035000,0.076200> rotate<0,26.563298,0> translate<29.692600,-1.535000,19.111600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,19.111600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.777200,-1.535000,19.653900>}
box{<0,0,-0.076200><1.212620,0.035000,0.076200> rotate<0,-26.563298,0> translate<29.692600,-1.535000,19.111600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.777200,-1.535000,20.206400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,20.748700>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,-44.997030,0> translate<30.777200,-1.535000,20.206400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,20.748700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,20.748700>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,0.000000,0> translate<29.692600,-1.535000,20.748700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,20.206400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,21.291000>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<29.692600,-1.535000,21.291000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,21.843500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,21.843500>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<29.692600,-1.535000,21.843500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,21.843500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,22.114600>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<29.963700,-1.535000,22.114600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,22.114600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,22.114600>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<29.692600,-1.535000,22.114600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,22.114600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,21.843500>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<29.692600,-1.535000,21.843500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,22.662000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,22.662000>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,0.000000,0> translate<29.963700,-1.535000,22.662000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,22.662000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,22.933100>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<31.048400,-1.535000,22.662000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,22.933100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,23.475400>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<31.319500,-1.535000,23.475400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.319500,-1.535000,23.475400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,23.746600>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<31.048400,-1.535000,23.746600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,23.746600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,23.746600>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,0.000000,0> translate<29.963700,-1.535000,23.746600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,23.746600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,23.475400>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<29.692600,-1.535000,23.475400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,23.475400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,22.933100>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<29.692600,-1.535000,22.933100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.692600,-1.535000,22.933100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,22.662000>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<29.692600,-1.535000,22.933100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.963700,-1.535000,22.662000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.048400,-1.535000,23.746600>}
box{<0,0,-0.076200><1.533927,0.035000,0.076200> rotate<0,-44.994389,0> translate<29.963700,-1.535000,22.662000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<47.294800,-1.535000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<47.294800,-1.535000,24.334500>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,90.000000,0> translate<47.294800,-1.535000,24.334500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<47.294800,-1.535000,24.334500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<46.481400,-1.535000,24.334500>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<46.481400,-1.535000,24.334500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<46.481400,-1.535000,24.334500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<46.210200,-1.535000,24.063400>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<46.210200,-1.535000,24.063400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<46.210200,-1.535000,24.063400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<46.210200,-1.535000,23.521000>}
box{<0,0,-0.076200><0.542400,0.035000,0.076200> rotate<0,-90.000000,0> translate<46.210200,-1.535000,23.521000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<46.210200,-1.535000,23.521000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<46.481400,-1.535000,23.249900>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,44.986466,0> translate<46.210200,-1.535000,23.521000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<46.481400,-1.535000,23.249900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<47.294800,-1.535000,23.249900>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<46.481400,-1.535000,23.249900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<46.752500,-1.535000,23.249900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<46.210200,-1.535000,22.707600>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,-44.997030,0> translate<46.210200,-1.535000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<45.657700,-1.535000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<45.657700,-1.535000,24.334500>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,90.000000,0> translate<45.657700,-1.535000,24.334500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<45.657700,-1.535000,24.334500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.844300,-1.535000,24.334500>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<44.844300,-1.535000,24.334500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.844300,-1.535000,24.334500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.573100,-1.535000,24.063400>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<44.573100,-1.535000,24.063400> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.573100,-1.535000,24.063400>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.573100,-1.535000,23.792200>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,-90.000000,0> translate<44.573100,-1.535000,23.792200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.573100,-1.535000,23.792200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.844300,-1.535000,23.521000>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<44.573100,-1.535000,23.792200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.844300,-1.535000,23.521000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.573100,-1.535000,23.249900>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<44.573100,-1.535000,23.249900> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.573100,-1.535000,23.249900>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.573100,-1.535000,22.978700>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,-90.000000,0> translate<44.573100,-1.535000,22.978700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.573100,-1.535000,22.978700>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.844300,-1.535000,22.707600>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,44.986466,0> translate<44.573100,-1.535000,22.978700> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.844300,-1.535000,22.707600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<45.657700,-1.535000,22.707600>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<44.844300,-1.535000,22.707600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<45.657700,-1.535000,23.521000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.844300,-1.535000,23.521000>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<44.844300,-1.535000,23.521000> }
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
cylinder{<27.940000,0.038000,40.640000><27.940000,-1.538000,40.640000>0.406400}
cylinder{<33.020000,0.038000,40.640000><33.020000,-1.538000,40.640000>0.406400}
cylinder{<27.940000,0.038000,31.750000><27.940000,-1.538000,31.750000>0.406400}
cylinder{<33.020000,0.038000,31.750000><33.020000,-1.538000,31.750000>0.406400}
cylinder{<15.240000,0.038000,8.890000><15.240000,-1.538000,8.890000>0.558800}
cylinder{<15.240000,0.038000,19.050000><15.240000,-1.538000,19.050000>0.558800}
cylinder{<8.382000,0.038000,39.979600><8.382000,-1.538000,39.979600>0.558800}
cylinder{<5.842000,0.038000,39.979600><5.842000,-1.538000,39.979600>0.558800}
cylinder{<3.302000,0.038000,39.979600><3.302000,-1.538000,39.979600>0.558800}
cylinder{<19.050000,0.038000,36.830000><19.050000,-1.538000,36.830000>0.406400}
cylinder{<19.050000,0.038000,34.290000><19.050000,-1.538000,34.290000>0.406400}
cylinder{<40.640000,0.038000,30.480000><40.640000,-1.538000,30.480000>0.406400}
cylinder{<50.800000,0.038000,30.480000><50.800000,-1.538000,30.480000>0.406400}
cylinder{<40.640000,0.038000,27.940000><40.640000,-1.538000,27.940000>0.406400}
cylinder{<50.800000,0.038000,27.940000><50.800000,-1.538000,27.940000>0.406400}
cylinder{<35.560000,0.038000,36.830000><35.560000,-1.538000,36.830000>0.406400}
cylinder{<25.400000,0.038000,36.830000><25.400000,-1.538000,36.830000>0.406400}
cylinder{<22.860000,0.038000,22.860000><22.860000,-1.538000,22.860000>0.406400}
cylinder{<22.860000,0.038000,33.020000><22.860000,-1.538000,33.020000>0.406400}
cylinder{<58.775600,0.038000,34.518600><58.775600,-1.538000,34.518600>0.508000}
cylinder{<58.775600,0.038000,39.598600><58.775600,-1.538000,39.598600>0.508000}
cylinder{<48.615600,0.038000,37.058600><48.615600,-1.538000,37.058600>0.508000}
cylinder{<22.860000,0.038000,15.240000><22.860000,-1.538000,15.240000>0.406400}
cylinder{<22.860000,0.038000,5.080000><22.860000,-1.538000,5.080000>0.406400}
cylinder{<19.050000,0.038000,15.240000><19.050000,-1.538000,15.240000>0.406400}
cylinder{<19.050000,0.038000,5.080000><19.050000,-1.538000,5.080000>0.406400}
cylinder{<40.640000,0.038000,25.400000><40.640000,-1.538000,25.400000>0.406400}
cylinder{<50.800000,0.038000,25.400000><50.800000,-1.538000,25.400000>0.406400}
cylinder{<40.640000,0.038000,21.590000><40.640000,-1.538000,21.590000>0.406400}
cylinder{<50.800000,0.038000,21.590000><50.800000,-1.538000,21.590000>0.406400}
cylinder{<53.340000,0.038000,21.590000><53.340000,-1.538000,21.590000>0.406400}
cylinder{<63.500000,0.038000,21.590000><63.500000,-1.538000,21.590000>0.406400}
cylinder{<40.640000,0.038000,19.050000><40.640000,-1.538000,19.050000>0.406400}
cylinder{<50.800000,0.038000,19.050000><50.800000,-1.538000,19.050000>0.406400}
cylinder{<40.640000,0.038000,16.510000><40.640000,-1.538000,16.510000>0.406400}
cylinder{<50.800000,0.038000,16.510000><50.800000,-1.538000,16.510000>0.406400}
cylinder{<40.640000,0.038000,13.970000><40.640000,-1.538000,13.970000>0.406400}
cylinder{<50.800000,0.038000,13.970000><50.800000,-1.538000,13.970000>0.406400}
cylinder{<40.640000,0.038000,11.430000><40.640000,-1.538000,11.430000>0.406400}
cylinder{<50.800000,0.038000,11.430000><50.800000,-1.538000,11.430000>0.406400}
cylinder{<40.640000,0.038000,8.890000><40.640000,-1.538000,8.890000>0.406400}
cylinder{<50.800000,0.038000,8.890000><50.800000,-1.538000,8.890000>0.406400}
cylinder{<36.830000,0.038000,5.080000><36.830000,-1.538000,5.080000>0.457200}
cylinder{<52.070000,0.038000,5.080000><52.070000,-1.538000,5.080000>0.457200}
cylinder{<26.670000,0.038000,26.670000><26.670000,-1.538000,26.670000>0.406400}
cylinder{<26.670000,0.038000,24.130000><26.670000,-1.538000,24.130000>0.406400}
cylinder{<26.670000,0.038000,21.590000><26.670000,-1.538000,21.590000>0.406400}
cylinder{<26.670000,0.038000,19.050000><26.670000,-1.538000,19.050000>0.406400}
cylinder{<26.670000,0.038000,16.510000><26.670000,-1.538000,16.510000>0.406400}
cylinder{<26.670000,0.038000,13.970000><26.670000,-1.538000,13.970000>0.406400}
cylinder{<26.670000,0.038000,11.430000><26.670000,-1.538000,11.430000>0.406400}
cylinder{<26.670000,0.038000,8.890000><26.670000,-1.538000,8.890000>0.406400}
cylinder{<34.290000,0.038000,8.890000><34.290000,-1.538000,8.890000>0.406400}
cylinder{<34.290000,0.038000,11.430000><34.290000,-1.538000,11.430000>0.406400}
cylinder{<34.290000,0.038000,13.970000><34.290000,-1.538000,13.970000>0.406400}
cylinder{<34.290000,0.038000,16.510000><34.290000,-1.538000,16.510000>0.406400}
cylinder{<34.290000,0.038000,19.050000><34.290000,-1.538000,19.050000>0.406400}
cylinder{<34.290000,0.038000,21.590000><34.290000,-1.538000,21.590000>0.406400}
cylinder{<34.290000,0.038000,24.130000><34.290000,-1.538000,24.130000>0.406400}
cylinder{<34.290000,0.038000,26.670000><34.290000,-1.538000,26.670000>0.406400}
cylinder{<16.510000,0.038000,26.670000><16.510000,-1.538000,26.670000>0.406400}
cylinder{<19.050000,0.038000,26.670000><19.050000,-1.538000,26.670000>0.406400}
cylinder{<19.050000,0.038000,29.210000><19.050000,-1.538000,29.210000>0.406400}
cylinder{<41.910000,0.038000,35.560000><41.910000,-1.538000,35.560000>0.406400}
cylinder{<44.450000,0.038000,35.560000><44.450000,-1.538000,35.560000>0.406400}
cylinder{<44.450000,0.038000,38.100000><44.450000,-1.538000,38.100000>0.406400}
cylinder{<59.690000,0.038000,16.484600><59.690000,-1.538000,16.484600>0.660400}
cylinder{<59.690000,0.038000,11.480800><59.690000,-1.538000,11.480800>0.660400}
cylinder{<6.350000,0.038000,12.674600><6.350000,-1.538000,12.674600>0.660400}
cylinder{<6.350000,0.038000,7.670800><6.350000,-1.538000,7.670800>0.660400}
//Fori(Fast)/Via
cylinder{<34.290000,0.038000,34.290000><34.290000,-1.538000,34.290000>0.300000 }
cylinder{<27.940000,0.038000,34.290000><27.940000,-1.538000,34.290000>0.300000 }
cylinder{<16.510000,0.038000,26.644600><16.510000,-1.538000,26.644600>0.250000 }
cylinder{<33.020000,0.038000,40.614600><33.020000,-1.538000,40.614600>0.250000 }
cylinder{<58.775600,0.038000,34.493200><58.775600,-1.538000,34.493200>0.250000 }
cylinder{<44.424600,0.038000,38.100000><44.424600,-1.538000,38.100000>0.250000 }
cylinder{<34.315400,0.038000,8.890000><34.315400,-1.538000,8.890000>0.250000 }
cylinder{<8.356600,0.038000,40.081200><8.356600,-1.538000,40.081200>0.250000 }
cylinder{<5.816600,0.038000,39.979600><5.816600,-1.538000,39.979600>0.250000 }
cylinder{<3.276600,0.038000,40.030400><3.276600,-1.538000,40.030400>0.250000 }
cylinder{<50.825400,0.038000,21.539200><50.825400,-1.538000,21.539200>0.250000 }
cylinder{<50.825400,0.038000,18.999200><50.825400,-1.538000,18.999200>0.250000 }
cylinder{<50.825400,0.038000,19.024600><50.825400,-1.538000,19.024600>0.250000 }
cylinder{<50.825400,0.038000,25.374600><50.825400,-1.538000,25.374600>0.250000 }
cylinder{<50.825400,0.038000,27.914600><50.825400,-1.538000,27.914600>0.250000 }
cylinder{<50.825400,0.038000,30.429200><50.825400,-1.538000,30.429200>0.250000 }
cylinder{<40.614600,0.038000,27.914600><40.614600,-1.538000,27.914600>0.250000 }
cylinder{<40.640000,0.038000,30.505400><40.640000,-1.538000,30.505400>0.250000 }
cylinder{<40.640000,0.038000,25.374600><40.640000,-1.538000,25.374600>0.250000 }
cylinder{<40.690800,0.038000,21.590000><40.690800,-1.538000,21.590000>0.250000 }
cylinder{<40.640000,0.038000,19.024600><40.640000,-1.538000,19.024600>0.250000 }
cylinder{<40.614600,0.038000,16.484600><40.614600,-1.538000,16.484600>0.250000 }
cylinder{<40.640000,0.038000,13.919200><40.640000,-1.538000,13.919200>0.250000 }
cylinder{<40.589200,0.038000,11.455400><40.589200,-1.538000,11.455400>0.250000 }
cylinder{<40.589200,0.038000,8.864600><40.589200,-1.538000,8.864600>0.250000 }
cylinder{<63.500000,0.038000,21.539200><63.500000,-1.538000,21.539200>0.250000 }
cylinder{<53.365400,0.038000,21.539200><53.365400,-1.538000,21.539200>0.250000 }
cylinder{<34.264600,0.038000,11.455400><34.264600,-1.538000,11.455400>0.250000 }
cylinder{<34.188400,0.038000,13.995400><34.188400,-1.538000,13.995400>0.250000 }
cylinder{<34.264600,0.038000,16.510000><34.264600,-1.538000,16.510000>0.250000 }
cylinder{<26.644600,0.038000,16.510000><26.644600,-1.538000,16.510000>0.250000 }
cylinder{<26.695400,0.038000,13.970000><26.695400,-1.538000,13.970000>0.250000 }
cylinder{<26.644600,0.038000,11.430000><26.644600,-1.538000,11.430000>0.250000 }
cylinder{<26.670000,0.038000,8.864600><26.670000,-1.538000,8.864600>0.250000 }
cylinder{<26.695400,0.038000,18.999200><26.695400,-1.538000,18.999200>0.250000 }
cylinder{<34.239200,0.038000,19.075400><34.239200,-1.538000,19.075400>0.250000 }
cylinder{<26.644600,0.038000,21.590000><26.644600,-1.538000,21.590000>0.250000 }
cylinder{<26.644600,0.038000,24.130000><26.644600,-1.538000,24.130000>0.250000 }
cylinder{<26.720800,0.038000,26.695400><26.720800,-1.538000,26.695400>0.250000 }
cylinder{<34.163000,0.038000,24.130000><34.163000,-1.538000,24.130000>0.250000 }
cylinder{<34.290000,0.038000,26.670000><34.290000,-1.538000,26.670000>0.250000 }
cylinder{<34.340800,0.038000,21.640800><34.340800,-1.538000,21.640800>0.250000 }
cylinder{<22.809200,0.038000,22.860000><22.809200,-1.538000,22.860000>0.250000 }
cylinder{<22.809200,0.038000,15.163800><22.809200,-1.538000,15.163800>0.250000 }
cylinder{<19.075400,0.038000,15.163800><19.075400,-1.538000,15.163800>0.250000 }
cylinder{<22.860000,0.038000,5.054600><22.860000,-1.538000,5.054600>0.250000 }
cylinder{<19.075400,0.038000,5.003800><19.075400,-1.538000,5.003800>0.250000 }
cylinder{<15.214600,0.038000,8.890000><15.214600,-1.538000,8.890000>0.250000 }
cylinder{<15.214600,0.038000,18.948400><15.214600,-1.538000,18.948400>0.250000 }
cylinder{<6.426200,0.038000,7.645400><6.426200,-1.538000,7.645400>0.250000 }
cylinder{<6.451600,0.038000,12.725400><6.451600,-1.538000,12.725400>0.250000 }
cylinder{<19.024600,0.038000,26.670000><19.024600,-1.538000,26.670000>0.250000 }
cylinder{<19.050000,0.038000,29.184600><19.050000,-1.538000,29.184600>0.250000 }
cylinder{<27.965400,0.038000,31.724600><27.965400,-1.538000,31.724600>0.250000 }
cylinder{<22.860000,0.038000,33.045400><22.860000,-1.538000,33.045400>0.250000 }
cylinder{<19.050000,0.038000,34.315400><19.050000,-1.538000,34.315400>0.250000 }
cylinder{<19.024600,0.038000,36.855400><19.024600,-1.538000,36.855400>0.250000 }
cylinder{<35.534600,0.038000,36.804600><35.534600,-1.538000,36.804600>0.250000 }
cylinder{<27.940000,0.038000,40.690800><27.940000,-1.538000,40.690800>0.250000 }
cylinder{<33.070800,0.038000,31.724600><33.070800,-1.538000,31.724600>0.250000 }
cylinder{<25.349200,0.038000,36.804600><25.349200,-1.538000,36.804600>0.250000 }
cylinder{<41.884600,0.038000,35.585400><41.884600,-1.538000,35.585400>0.250000 }
cylinder{<44.424600,0.038000,35.560000><44.424600,-1.538000,35.560000>0.250000 }
cylinder{<59.664600,0.038000,16.433800><59.664600,-1.538000,16.433800>0.250000 }
cylinder{<59.842400,0.038000,11.430000><59.842400,-1.538000,11.430000>0.250000 }
cylinder{<50.825400,0.038000,16.459200><50.825400,-1.538000,16.459200>0.250000 }
cylinder{<50.850800,0.038000,13.970000><50.850800,-1.538000,13.970000>0.250000 }
cylinder{<50.876200,0.038000,11.430000><50.876200,-1.538000,11.430000>0.250000 }
cylinder{<50.825400,0.038000,8.940800><50.825400,-1.538000,8.940800>0.250000 }
cylinder{<36.830000,0.038000,5.029200><36.830000,-1.538000,5.029200>0.250000 }
cylinder{<52.070000,0.038000,5.105400><52.070000,-1.538000,5.105400>0.250000 }
cylinder{<48.641000,0.038000,37.033200><48.641000,-1.538000,37.033200>0.250000 }
cylinder{<58.775600,0.038000,39.547800><58.775600,-1.538000,39.547800>0.250000 }
//Fori(Fast)/Scheda
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.175200,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.175200,0.000000,40.640000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<30.175200,0.000000,40.640000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.175200,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.175200,0.000000,40.005000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<30.175200,0.000000,40.005000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.175200,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.956000,0.000000,40.640000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<28.956000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.810200,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.810200,0.000000,40.640000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<30.810200,0.000000,40.640000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.810200,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.810200,0.000000,40.005000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<30.810200,0.000000,40.005000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.810200,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,40.640000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<30.810200,0.000000,40.640000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,0.000000,39.624000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.797000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.909000,0.000000,39.370000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.051000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,41.656000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.163000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.909000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,41.910000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.051000,0.000000,41.910000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<33.909000,0.000000,41.656000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<33.909000,0.000000,39.624000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<27.051000,0.000000,39.624000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<27.051000,0.000000,41.656000>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.175200,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.175200,0.000000,31.750000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<30.175200,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.175200,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.175200,0.000000,31.115000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<30.175200,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.175200,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.956000,0.000000,31.750000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<28.956000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.810200,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.810200,0.000000,31.750000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<30.810200,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.810200,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.810200,0.000000,31.115000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<30.810200,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.810200,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,31.750000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<30.810200,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,0.000000,32.766000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,0.000000,30.734000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.797000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.909000,0.000000,30.480000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.051000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,32.766000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.163000,0.000000,32.766000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.909000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,33.020000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.051000,0.000000,33.020000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<33.909000,0.000000,32.766000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<33.909000,0.000000,30.734000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<27.051000,0.000000,30.734000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<27.051000,0.000000,32.766000>}
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,16.002000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.970000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,11.938000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.970000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,11.938000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.510000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,16.002000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.970000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<15.240000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<15.240000,0.000000,9.906000>}
box{<0,0,-0.381000><1.016000,0.036000,0.381000> rotate<0,90.000000,0> translate<15.240000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<15.240000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<15.240000,0.000000,18.034000>}
box{<0,0,-0.381000><1.016000,0.036000,0.381000> rotate<0,-90.000000,0> translate<15.240000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,13.970000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.240000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,12.954000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.605000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,13.970000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<14.605000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,12.446000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.240000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,12.954000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<15.240000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,13.970000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.240000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,13.970000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.605000,0.000000,13.970000> }
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-270.000000,0> translate<15.240000,0.000000,15.367000>}
box{<-0.952500,0,-0.381000><0.952500,0.036000,0.381000> rotate<0,-270.000000,0> translate<15.240000,0.000000,10.985500>}
box{<-0.952500,0,-0.381000><0.952500,0.036000,0.381000> rotate<0,-270.000000,0> translate<15.240000,0.000000,16.954500>}
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.524000,0.000000,24.993600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.524000,0.000000,23.469600>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.524000,0.000000,23.469600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,37.439600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,24.993600>}
box{<0,0,-0.076200><12.446000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.049000,0.000000,24.993600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,24.993600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,24.993600>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.160000,0.000000,24.993600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,24.993600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,23.469600>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.160000,0.000000,23.469600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,23.469600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,23.469600>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.160000,0.000000,23.469600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,23.469600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,21.564600>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.049000,0.000000,21.564600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.414000,0.000000,36.804600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<1.270000,0.000000,36.804600>}
box{<0,0,-0.025400><9.144000,0.036000,0.025400> rotate<0,0.000000,0> translate<1.270000,0.000000,36.804600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<1.270000,0.000000,28.549600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<1.270000,0.000000,36.804600>}
box{<0,0,-0.025400><8.255000,0.036000,0.025400> rotate<0,90.000000,0> translate<1.270000,0.000000,36.804600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<1.270000,0.000000,28.549600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.414000,0.000000,28.549600>}
box{<0,0,-0.025400><9.144000,0.036000,0.025400> rotate<0,0.000000,0> translate<1.270000,0.000000,28.549600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.414000,0.000000,36.804600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.414000,0.000000,28.549600>}
box{<0,0,-0.025400><8.255000,0.036000,0.025400> rotate<0,-90.000000,0> translate<10.414000,0.000000,28.549600> }
difference{
cylinder{<5.842000,0,24.993600><5.842000,0.036000,24.993600>1.879600 translate<0,0.000000,0>}
cylinder{<5.842000,-0.1,24.993600><5.842000,0.135000,24.993600>1.727200 translate<0,0.000000,0>}}
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-180.000000,0> translate<3.302000,0.000000,40.551100>}
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-180.000000,0> translate<5.842000,0.000000,40.551100>}
box{<-0.381000,0,-0.317500><0.381000,0.036000,0.317500> rotate<0,-180.000000,0> translate<8.382000,0.000000,40.551100>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-180.000000,0> translate<8.382000,0.000000,38.836600>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-180.000000,0> translate<5.842000,0.000000,38.836600>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-180.000000,0> translate<3.302000,0.000000,38.836600>}
//LED1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.145000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.955000,0.000000,33.020000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<17.145000,0.000000,33.020000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<19.050000,0.000000,35.560000>}
object{ARC(1.143000,0.152400,0.000000,90.000000,0.036000) translate<19.050000,0.000000,35.560000>}
object{ARC(1.143000,0.152400,180.000000,270.000000,0.036000) translate<19.050000,0.000000,35.560000>}
object{ARC(1.651000,0.152400,0.000000,90.000000,0.036000) translate<19.050000,0.000000,35.560000>}
object{ARC(1.651000,0.152400,180.000000,270.000000,0.036000) translate<19.050000,0.000000,35.560000>}
object{ARC(2.159000,0.152400,0.000000,90.000000,0.036000) translate<19.050000,0.000000,35.560000>}
object{ARC(2.159000,0.152400,180.000000,270.000000,0.036000) translate<19.050000,0.000000,35.560000>}
difference{
cylinder{<19.050000,0,35.560000><19.050000,0.036000,35.560000>2.616200 translate<0,0.000000,0>}
cylinder{<19.050000,-0.1,35.560000><19.050000,0.135000,35.560000>2.463800 translate<0,0.000000,0>}}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.800000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<49.784000,0.000000,30.480000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<49.784000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.640000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.656000,0.000000,30.480000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<40.640000,0.000000,30.480000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<42.799000,0.000000,31.369000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<42.799000,0.000000,29.591000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<48.641000,0.000000,29.591000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<48.641000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,31.369000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.545000,0.000000,31.369000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,31.623000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,31.623000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<43.180000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,29.337000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,29.337000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.180000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,31.623000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.133000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,31.496000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.307000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,29.337000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<48.133000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,29.464000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.307000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,31.623000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,29.337000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,31.369000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.895000,0.000000,31.369000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<49.326800,0.000000,30.480000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<42.113200,0.000000,30.480000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.800000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<49.784000,0.000000,27.940000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<49.784000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.640000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.656000,0.000000,27.940000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<40.640000,0.000000,27.940000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<42.799000,0.000000,28.829000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<42.799000,0.000000,27.051000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<48.641000,0.000000,27.051000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<48.641000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,28.829000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.545000,0.000000,28.829000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,29.083000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,29.083000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<43.180000,0.000000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,26.797000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,26.924000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,26.797000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.180000,0.000000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,29.083000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.133000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,28.956000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.307000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,26.924000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,26.797000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<48.133000,0.000000,26.924000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,26.924000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,26.924000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.307000,0.000000,26.924000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,29.083000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,26.797000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,28.829000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.895000,0.000000,28.829000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<49.326800,0.000000,27.940000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<42.113200,0.000000,27.940000>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<25.400000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.416000,0.000000,36.830000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<25.400000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.560000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.544000,0.000000,36.830000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<34.544000,0.000000,36.830000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<33.401000,0.000000,35.941000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<33.401000,0.000000,37.719000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<27.559000,0.000000,37.719000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<27.559000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.655000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.655000,0.000000,35.941000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.655000,0.000000,35.941000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,35.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,35.687000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.020000,0.000000,35.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,35.687000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<32.893000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,37.973000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,37.973000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.020000,0.000000,37.973000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,37.973000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.893000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.067000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,35.687000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.940000,0.000000,35.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.067000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,35.814000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.067000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.067000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,37.973000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<27.940000,0.000000,37.973000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.067000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,37.846000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.067000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,35.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,35.687000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.559000,0.000000,35.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,37.973000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,37.973000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.559000,0.000000,37.973000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.305000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.305000,0.000000,35.941000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.305000,0.000000,35.941000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<26.873200,0.000000,36.830000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<34.086800,0.000000,36.830000>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<22.860000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<22.860000,0.000000,32.004000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<22.860000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<22.860000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<22.860000,0.000000,23.876000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<22.860000,0.000000,23.876000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<21.971000,0.000000,25.019000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<23.749000,0.000000,25.019000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<23.749000,0.000000,30.861000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<21.971000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.749000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,24.765000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.971000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,25.019000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,25.400000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.717000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.844000,0.000000,25.527000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,25.400000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.717000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,25.019000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,25.400000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.003000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,25.527000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,25.400000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<23.876000,0.000000,25.527000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.844000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,30.480000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<21.717000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.844000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.844000,0.000000,25.527000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.844000,0.000000,25.527000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,30.480000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<23.876000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,25.527000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.876000,0.000000,25.527000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,30.480000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.717000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,30.480000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.003000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.749000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,31.115000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.971000,0.000000,31.115000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<22.860000,0.000000,31.546800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<22.860000,0.000000,24.333200>}
//R5 silk screen
object{ARC(5.462500,0.127000,35.537678,324.462322,0.036000) translate<53.314600,0.000000,37.058600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.759600,0.000000,40.233600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.410600,0.000000,40.233600>}
box{<0,0,-0.063500><1.651000,0.036000,0.063500> rotate<0,0.000000,0> translate<57.759600,0.000000,40.233600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.410600,0.000000,33.883600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.759600,0.000000,33.883600>}
box{<0,0,-0.063500><1.651000,0.036000,0.063500> rotate<0,0.000000,0> translate<57.759600,0.000000,33.883600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.410600,0.000000,34.264600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.870600,0.000000,34.264600>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<56.870600,0.000000,34.264600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.870600,0.000000,34.264600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.235600,0.000000,35.153600>}
box{<0,0,-0.063500><1.092495,0.036000,0.063500> rotate<0,54.458728,0> translate<56.235600,0.000000,35.153600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.235600,0.000000,35.153600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.870600,0.000000,36.423600>}
box{<0,0,-0.063500><1.419903,0.036000,0.063500> rotate<0,-63.430762,0> translate<56.235600,0.000000,35.153600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.870600,0.000000,36.423600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.140600,0.000000,36.423600>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<56.870600,0.000000,36.423600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.140600,0.000000,36.423600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.140600,0.000000,35.788600>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,-90.000000,0> translate<58.140600,0.000000,35.788600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.140600,0.000000,35.788600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.410600,0.000000,35.788600>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<58.140600,0.000000,35.788600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.410600,0.000000,38.328600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.140600,0.000000,38.328600>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<58.140600,0.000000,38.328600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.140600,0.000000,38.328600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.140600,0.000000,37.693600>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,-90.000000,0> translate<58.140600,0.000000,37.693600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.140600,0.000000,37.693600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.870600,0.000000,37.693600>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<56.870600,0.000000,37.693600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.870600,0.000000,37.693600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.235600,0.000000,38.963600>}
box{<0,0,-0.063500><1.419903,0.036000,0.063500> rotate<0,63.430762,0> translate<56.235600,0.000000,38.963600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.235600,0.000000,38.963600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.870600,0.000000,39.852600>}
box{<0,0,-0.063500><1.092495,0.036000,0.063500> rotate<0,-54.458728,0> translate<56.235600,0.000000,38.963600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.870600,0.000000,39.852600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.410600,0.000000,39.852600>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<56.870600,0.000000,39.852600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.410600,0.000000,33.883600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.410600,0.000000,40.233600>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,90.000000,0> translate<59.410600,0.000000,40.233600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.298600,0.000000,37.947600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.314600,0.000000,36.931600>}
box{<0,0,-0.063500><1.436841,0.036000,0.063500> rotate<0,44.997030,0> translate<52.298600,0.000000,37.947600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.314600,0.000000,36.931600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.933600,0.000000,36.550600>}
box{<0,0,-0.063500><0.538815,0.036000,0.063500> rotate<0,-44.997030,0> translate<52.933600,0.000000,36.550600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.933600,0.000000,36.550600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.695600,0.000000,36.550600>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<52.933600,0.000000,36.550600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.695600,0.000000,36.550600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.584600,0.000000,35.661600>}
box{<0,0,-0.063500><1.257236,0.036000,0.063500> rotate<0,44.997030,0> translate<53.695600,0.000000,36.550600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.806600,0.000000,38.455600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.822600,0.000000,37.439600>}
box{<0,0,-0.063500><1.436841,0.036000,0.063500> rotate<0,44.997030,0> translate<52.806600,0.000000,38.455600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.822600,0.000000,37.439600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.203600,0.000000,37.820600>}
box{<0,0,-0.063500><0.538815,0.036000,0.063500> rotate<0,-44.997030,0> translate<53.822600,0.000000,37.439600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.203600,0.000000,37.820600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.203600,0.000000,37.058600>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,-90.000000,0> translate<54.203600,0.000000,37.058600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.203600,0.000000,37.058600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.092600,0.000000,36.169600>}
box{<0,0,-0.063500><1.257236,0.036000,0.063500> rotate<0,44.997030,0> translate<54.203600,0.000000,37.058600> }
difference{
cylinder{<53.695600,0,37.058600><53.695600,0.036000,37.058600>1.866900 translate<0,0.000000,0>}
cylinder{<53.695600,-0.1,37.058600><53.695600,0.135000,37.058600>1.739900 translate<0,0.000000,0>}}
difference{
cylinder{<53.695600,0,37.058600><53.695600,0.036000,37.058600>2.819400 translate<0,0.000000,0>}
cylinder{<53.695600,-0.1,37.058600><53.695600,0.135000,37.058600>2.768600 translate<0,0.000000,0>}}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<22.860000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<22.860000,0.000000,6.096000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<22.860000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<22.860000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<22.860000,0.000000,14.224000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<22.860000,0.000000,14.224000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<23.749000,0.000000,13.081000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<21.971000,0.000000,13.081000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<21.971000,0.000000,7.239000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<23.749000,0.000000,7.239000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.749000,0.000000,13.335000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.971000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,12.700000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.003000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,12.700000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<23.876000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,12.700000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.717000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.844000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,12.700000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<21.717000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,7.620000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<23.876000,0.000000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,12.573000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.876000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.844000,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,7.620000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.717000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.844000,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.844000,0.000000,12.573000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.844000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,7.239000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,7.620000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.003000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,7.239000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,7.620000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.717000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.749000,0.000000,6.985000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.971000,0.000000,6.985000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<22.860000,0.000000,6.553200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<22.860000,0.000000,13.766800>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<19.050000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<19.050000,0.000000,6.096000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<19.050000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<19.050000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<19.050000,0.000000,14.224000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<19.050000,0.000000,14.224000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<19.939000,0.000000,13.081000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<18.161000,0.000000,13.081000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<18.161000,0.000000,7.239000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<19.939000,0.000000,7.239000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.939000,0.000000,13.335000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.161000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,12.700000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.193000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,12.700000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.066000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,12.700000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.907000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,12.700000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<17.907000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,7.620000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<20.066000,0.000000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,12.573000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.066000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,7.620000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.907000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,0.000000,12.573000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.034000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,7.239000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,7.620000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.193000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,7.239000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,7.620000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.907000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.939000,0.000000,6.985000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.161000,0.000000,6.985000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<19.050000,0.000000,6.553200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<19.050000,0.000000,13.766800>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.800000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<49.784000,0.000000,25.400000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<49.784000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.640000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.656000,0.000000,25.400000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<40.640000,0.000000,25.400000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<42.799000,0.000000,26.289000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<42.799000,0.000000,24.511000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<48.641000,0.000000,24.511000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<48.641000,0.000000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,24.511000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,26.289000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.545000,0.000000,26.289000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,26.543000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,26.543000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,26.543000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<43.180000,0.000000,26.543000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,24.257000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,24.257000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.180000,0.000000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,26.543000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.133000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,26.416000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.307000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,24.257000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<48.133000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,24.384000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.307000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,26.543000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,26.543000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,24.257000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,24.511000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,26.289000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.895000,0.000000,26.289000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<49.326800,0.000000,25.400000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<42.113200,0.000000,25.400000>}
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.800000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<49.784000,0.000000,21.590000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<49.784000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.640000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.656000,0.000000,21.590000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<40.640000,0.000000,21.590000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<42.799000,0.000000,22.479000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<42.799000,0.000000,20.701000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<48.641000,0.000000,20.701000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<48.641000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,22.479000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.545000,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,22.733000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,22.733000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<43.180000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,20.447000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,20.447000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,20.447000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.180000,0.000000,20.447000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,22.733000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.133000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,22.606000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.307000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,20.447000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<48.133000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,20.574000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.307000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,22.733000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,20.447000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,20.447000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,22.479000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.895000,0.000000,22.479000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<49.326800,0.000000,21.590000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<42.113200,0.000000,21.590000>}
//R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<63.500000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<62.484000,0.000000,21.590000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<62.484000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<53.340000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<54.356000,0.000000,21.590000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<53.340000,0.000000,21.590000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<55.499000,0.000000,22.479000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<55.499000,0.000000,20.701000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<61.341000,0.000000,20.701000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<61.341000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,22.479000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<55.245000,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.880000,0.000000,22.733000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.499000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.880000,0.000000,22.733000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<55.880000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.880000,0.000000,20.447000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.499000,0.000000,20.447000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.880000,0.000000,20.447000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<55.880000,0.000000,20.447000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.833000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,22.733000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<60.833000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.833000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,0.000000,22.606000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.007000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.833000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,20.447000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<60.833000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.833000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,0.000000,20.574000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.007000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.341000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,22.733000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.960000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.341000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,20.447000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.960000,0.000000,20.447000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,22.479000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<61.595000,0.000000,22.479000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<62.026800,0.000000,21.590000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<54.813200,0.000000,21.590000>}
//R11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.800000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<49.784000,0.000000,19.050000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<49.784000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.640000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.656000,0.000000,19.050000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<40.640000,0.000000,19.050000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<42.799000,0.000000,19.939000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<42.799000,0.000000,18.161000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<48.641000,0.000000,18.161000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<48.641000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,19.939000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.545000,0.000000,19.939000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,20.193000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,20.193000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,20.193000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,20.193000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<43.180000,0.000000,20.193000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,17.907000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,17.907000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.180000,0.000000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,20.193000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.133000,0.000000,20.066000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,20.066000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.307000,0.000000,20.066000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,17.907000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<48.133000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,18.034000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.307000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,20.193000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,20.193000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,20.193000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,17.907000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,19.939000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.895000,0.000000,19.939000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<49.326800,0.000000,19.050000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<42.113200,0.000000,19.050000>}
//R12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.800000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<49.784000,0.000000,16.510000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<49.784000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.640000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.656000,0.000000,16.510000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<40.640000,0.000000,16.510000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<42.799000,0.000000,17.399000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<42.799000,0.000000,15.621000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<48.641000,0.000000,15.621000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<48.641000,0.000000,17.399000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,17.399000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.545000,0.000000,17.399000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,17.653000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,17.653000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,17.653000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,17.653000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<43.180000,0.000000,17.653000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,15.367000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,15.367000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,15.367000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,15.367000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.180000,0.000000,15.367000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,17.653000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.133000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,17.526000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.307000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,15.367000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<48.133000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,15.494000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.307000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,17.653000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,17.653000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,17.653000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,15.367000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,15.367000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,15.367000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,17.399000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.895000,0.000000,17.399000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<49.326800,0.000000,16.510000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<42.113200,0.000000,16.510000>}
//R13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.800000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<49.784000,0.000000,13.970000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<49.784000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.640000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.656000,0.000000,13.970000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<40.640000,0.000000,13.970000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<42.799000,0.000000,14.859000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<42.799000,0.000000,13.081000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<48.641000,0.000000,13.081000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<48.641000,0.000000,14.859000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,14.859000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.545000,0.000000,14.859000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,15.113000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,15.113000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,15.113000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<43.180000,0.000000,15.113000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,12.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,12.827000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,12.827000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,12.827000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.180000,0.000000,12.827000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,15.113000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.133000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,14.986000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.307000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,12.827000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<48.133000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,12.954000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.307000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,15.113000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,15.113000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,12.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,12.827000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,12.827000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,14.859000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.895000,0.000000,14.859000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<49.326800,0.000000,13.970000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<42.113200,0.000000,13.970000>}
//R14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.800000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<49.784000,0.000000,11.430000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<49.784000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.640000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.656000,0.000000,11.430000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<40.640000,0.000000,11.430000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<42.799000,0.000000,12.319000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<42.799000,0.000000,10.541000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<48.641000,0.000000,10.541000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<48.641000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,12.319000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.545000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,12.573000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,12.573000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<43.180000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,10.287000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,10.287000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.180000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,12.573000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.133000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,12.446000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.307000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,10.287000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<48.133000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,10.414000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.307000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,12.573000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,10.287000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,12.319000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.895000,0.000000,12.319000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<49.326800,0.000000,11.430000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<42.113200,0.000000,11.430000>}
//R15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.800000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<49.784000,0.000000,8.890000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<49.784000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.640000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.656000,0.000000,8.890000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<40.640000,0.000000,8.890000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<42.799000,0.000000,9.779000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<42.799000,0.000000,8.001000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<48.641000,0.000000,8.001000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<48.641000,0.000000,9.779000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,9.779000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.545000,0.000000,9.779000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,10.033000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,10.033000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,10.033000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,10.033000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<43.180000,0.000000,10.033000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,7.747000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,7.747000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.180000,0.000000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,10.033000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.133000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,9.906000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.307000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,7.747000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<48.133000,0.000000,7.874000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,7.874000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.307000,0.000000,7.874000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,10.033000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,10.033000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,10.033000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,7.747000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,9.779000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.895000,0.000000,9.779000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<49.326800,0.000000,8.890000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<42.113200,0.000000,8.890000>}
//R16 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,6.731000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,90.000000,0> translate<49.530000,0.000000,6.731000> }
object{ARC(0.381000,0.152400,0.000000,90.000000,0.036000) translate<49.149000,0.000000,6.731000>}
object{ARC(0.381000,0.152400,90.000000,180.000000,0.036000) translate<39.751000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,7.112000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.514000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.387000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,7.112000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.387000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,7.112000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<40.386000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.387000,0.000000,6.985000>}
box{<0,0,-0.076200><7.874000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.513000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,3.429000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.370000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,7.112000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.751000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<36.830000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<38.100000,0.000000,5.080000>}
box{<0,0,-0.381000><1.270000,0.036000,0.381000> rotate<0,0.000000,0> translate<36.830000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<50.800000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<52.070000,0.000000,5.080000>}
box{<0,0,-0.381000><1.270000,0.036000,0.381000> rotate<0,0.000000,0> translate<50.800000,0.000000,5.080000> }
box{<-0.698500,0,-0.381000><0.698500,0.036000,0.381000> rotate<0,-0.000000,0> translate<50.228500,0.000000,5.080000>}
box{<-0.698500,0,-0.381000><0.698500,0.036000,0.381000> rotate<0,-0.000000,0> translate<38.671500,0.000000,5.080000>}
//S2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,6.858000>}
box{<0,0,-0.076200><21.844000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.400000,0.000000,6.858000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,6.858000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,28.702000>}
box{<0,0,-0.076200><21.844000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.560000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,28.702000>}
box{<0,0,-0.076200><3.175000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.385000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,28.702000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.575000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,28.702000>}
box{<0,0,-0.076200><3.175000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.400000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,6.858000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,6.858000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.400000,0.000000,6.858000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,9.652000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.575000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,8.128000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.385000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,8.128000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.575000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,9.652000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.575000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,12.192000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.575000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,10.668000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.385000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,10.668000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.575000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,12.192000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.575000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,14.732000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.575000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,13.208000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.385000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,13.208000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.575000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,14.732000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.575000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,17.272000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.575000,0.000000,17.272000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,15.748000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.385000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,15.748000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.575000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,17.272000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.575000,0.000000,17.272000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,19.812000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.575000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,18.288000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.385000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,18.288000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.575000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,19.812000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.575000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,22.352000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.575000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,20.828000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.385000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,20.828000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.575000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,22.352000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.575000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,24.892000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.575000,0.000000,24.892000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,23.368000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.385000,0.000000,23.368000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,23.368000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,23.368000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.575000,0.000000,23.368000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,23.368000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,24.892000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.575000,0.000000,24.892000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,27.432000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.575000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,25.908000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.385000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,25.908000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.575000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,27.432000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.575000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,28.067000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.385000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,28.067000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.575000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,28.067000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.575000,0.000000,28.067000> }
box{<-0.762000,0,-0.952500><0.762000,0.036000,0.952500> rotate<0,-270.000000,0> translate<29.527500,0.000000,26.670000>}
box{<-0.762000,0,-0.952500><0.762000,0.036000,0.952500> rotate<0,-270.000000,0> translate<29.527500,0.000000,24.130000>}
box{<-0.762000,0,-0.952500><0.762000,0.036000,0.952500> rotate<0,-270.000000,0> translate<29.527500,0.000000,21.590000>}
box{<-0.762000,0,-0.952500><0.762000,0.036000,0.952500> rotate<0,-270.000000,0> translate<29.527500,0.000000,19.050000>}
box{<-0.762000,0,-0.952500><0.762000,0.036000,0.952500> rotate<0,-270.000000,0> translate<29.527500,0.000000,16.510000>}
box{<-0.762000,0,-0.952500><0.762000,0.036000,0.952500> rotate<0,-270.000000,0> translate<29.527500,0.000000,13.970000>}
box{<-0.762000,0,-0.952500><0.762000,0.036000,0.952500> rotate<0,-270.000000,0> translate<29.527500,0.000000,11.430000>}
box{<-0.762000,0,-0.952500><0.762000,0.036000,0.952500> rotate<0,-270.000000,0> translate<29.527500,0.000000,8.890000>}
//T1 silk screen
object{ARC(2.413000,0.050800,22.641418,67.358582,0.036000) translate<17.780000,0.000000,27.940000>}
object{ARC(2.413000,0.050800,292.641418,337.358582,0.036000) translate<17.780000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.843000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.843000,0.000000,28.448000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<13.843000,0.000000,28.448000> }
object{ARC(2.413100,0.050800,67.359496,202.640504,0.036000) translate<17.780100,0.000000,27.940000>}
object{ARC(2.413000,0.050800,202.641418,247.358582,0.036000) translate<17.780000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.843000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.903000,0.000000,27.432000>}
box{<0,0,-0.063500><1.060000,0.036000,0.063500> rotate<0,0.000000,0> translate<13.843000,0.000000,27.432000> }
object{ARC(2.413000,0.050800,247.358582,292.641418,0.036000) translate<17.780000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.843000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.903000,0.000000,28.448000>}
box{<0,0,-0.063500><1.060000,0.036000,0.063500> rotate<0,0.000000,0> translate<13.843000,0.000000,28.448000> }
object{ARC(2.413000,0.050800,337.358582,382.641418,0.036000) translate<17.780000,0.000000,27.940000>}
difference{
cylinder{<17.780000,0,27.940000><17.780000,0.036000,27.940000>2.984500 translate<0,0.000000,0>}
cylinder{<17.780000,-0.1,27.940000><17.780000,0.135000,27.940000>2.857500 translate<0,0.000000,0>}}
//T2 silk screen
object{ARC(2.413000,0.050800,22.641418,67.358582,0.036000) translate<43.180000,0.000000,36.830000>}
object{ARC(2.413000,0.050800,292.641418,337.358582,0.036000) translate<43.180000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.243000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.243000,0.000000,37.338000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<39.243000,0.000000,37.338000> }
object{ARC(2.413100,0.050800,67.359496,202.640504,0.036000) translate<43.180100,0.000000,36.830000>}
object{ARC(2.413000,0.050800,202.641418,247.358582,0.036000) translate<43.180000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.243000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.303000,0.000000,36.322000>}
box{<0,0,-0.063500><1.060000,0.036000,0.063500> rotate<0,0.000000,0> translate<39.243000,0.000000,36.322000> }
object{ARC(2.413000,0.050800,247.358582,292.641418,0.036000) translate<43.180000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.243000,0.000000,37.338000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.303000,0.000000,37.338000>}
box{<0,0,-0.063500><1.060000,0.036000,0.063500> rotate<0,0.000000,0> translate<39.243000,0.000000,37.338000> }
object{ARC(2.413000,0.050800,337.358582,382.641418,0.036000) translate<43.180000,0.000000,36.830000>}
difference{
cylinder{<43.180000,0,36.830000><43.180000,0.036000,36.830000>2.984500 translate<0,0.000000,0>}
cylinder{<43.180000,-0.1,36.830000><43.180000,0.135000,36.830000>2.857500 translate<0,0.000000,0>}}
//X1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.087000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.341000,0.000000,8.890000>}
box{<0,0,-0.076200><0.567961,0.036000,0.076200> rotate<0,-63.430762,0> translate<61.087000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.483000,0.000000,8.890000>}
box{<0,0,-0.076200><0.567961,0.036000,0.076200> rotate<0,-63.430762,0> translate<54.229000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.483000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,8.890000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.467000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.880000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.626000,0.000000,8.890000>}
box{<0,0,-0.076200><0.567961,0.036000,0.076200> rotate<0,63.430762,0> translate<55.626000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.626000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.483000,0.000000,8.890000>}
box{<0,0,-0.076200><1.143000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.483000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.880000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,8.382000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.229000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,13.512800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,13.512800>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.467000,0.000000,13.512800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,0.000000,9.448800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,9.448800>}
box{<0,0,-0.076200><4.572000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.372000,0.000000,9.448800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,13.512800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,9.448800>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.467000,0.000000,9.448800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,9.448800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,8.890000>}
box{<0,0,-0.076200><0.558800,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.467000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,14.452600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,14.452600>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.467000,0.000000,14.452600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,14.452600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,13.512800>}
box{<0,0,-0.076200><0.939800,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.467000,0.000000,13.512800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,0.000000,18.516600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,18.516600>}
box{<0,0,-0.076200><4.572000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.372000,0.000000,18.516600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,18.516600>}
box{<0,0,-0.076200><0.533400,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.467000,0.000000,18.516600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,18.516600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,14.452600>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.467000,0.000000,14.452600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,13.512800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,9.448800>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.372000,0.000000,9.448800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,13.512800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,0.000000,13.512800>}
box{<0,0,-0.076200><4.572000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.372000,0.000000,13.512800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,9.448800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,9.448800>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.467000,0.000000,9.448800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,14.452600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,18.516600>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<55.372000,0.000000,18.516600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,14.452600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,0.000000,14.452600>}
box{<0,0,-0.076200><4.572000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.372000,0.000000,14.452600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,18.516600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,18.516600>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.467000,0.000000,18.516600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,9.829800>}
box{<0,0,-0.076200><3.175000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.007000,0.000000,9.829800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,0.000000,13.131800>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.007000,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,13.131800>}
box{<0,0,-0.076200><3.175000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.007000,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,0.000000,14.833600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,14.833600>}
box{<0,0,-0.076200><3.175000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.007000,0.000000,14.833600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,0.000000,14.833600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,0.000000,18.135600>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.007000,0.000000,18.135600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,0.000000,18.135600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,18.135600>}
box{<0,0,-0.076200><3.175000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.007000,0.000000,18.135600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,18.135600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,17.754600>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.182000,0.000000,17.754600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,14.833600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,15.214600>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<59.182000,0.000000,15.214600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,12.750800>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.182000,0.000000,12.750800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,10.210800>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<59.182000,0.000000,10.210800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,19.050000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.467000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,19.050000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.325000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.341000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,8.890000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.325000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.626000,0.000000,8.890000>}
box{<0,0,-0.076200><4.699000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.626000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,8.890000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.865000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.341000,0.000000,8.890000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.341000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.119000,0.000000,9.448800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.119000,0.000000,13.512800>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<63.119000,0.000000,13.512800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.119000,0.000000,14.452600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.119000,0.000000,18.516600>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<63.119000,0.000000,18.516600> }
object{ARC(0.683400,0.152400,221.428843,311.992821,0.036000) translate<64.287300,0.000000,10.464800>}
object{ARC(2.439600,0.152400,141.340192,216.870367,0.036000) translate<65.760600,0.000000,11.430000>}
object{ARC(2.058700,0.152400,310.984068,411.007255,0.036000) translate<63.398400,0.000000,11.506300>}
object{ARC(0.593000,0.152400,46.728669,150.936951,0.036000) translate<64.338100,0.000000,12.623800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,13.106400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,10.058400>}
box{<0,0,-0.076200><3.113443,0.036000,0.076200> rotate<0,78.226548,0> translate<64.135000,0.000000,13.106400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.008000,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.643000,0.000000,9.931400>}
box{<0,0,-0.076200><3.113443,0.036000,0.076200> rotate<0,78.226548,0> translate<64.008000,0.000000,12.979400> }
object{ARC(0.683400,0.152400,221.428843,311.992821,0.036000) translate<64.287300,0.000000,15.468600>}
object{ARC(2.439700,0.152400,141.338358,216.867079,0.036000) translate<65.760600,0.000000,16.433700>}
object{ARC(2.058900,0.152400,310.988269,411.010757,0.036000) translate<63.398400,0.000000,16.509900>}
object{ARC(0.593000,0.152400,46.728669,150.936951,0.036000) translate<64.338100,0.000000,17.627600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,18.110200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,15.062200>}
box{<0,0,-0.076200><3.113443,0.036000,0.076200> rotate<0,78.226548,0> translate<64.135000,0.000000,18.110200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.008000,0.000000,17.983200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.643000,0.000000,14.935200>}
box{<0,0,-0.076200><3.113443,0.036000,0.076200> rotate<0,78.226548,0> translate<64.008000,0.000000,17.983200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,0.000000,18.516600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,0.000000,18.135600>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.944000,0.000000,18.135600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,0.000000,14.452600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,0.000000,14.833600>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<59.944000,0.000000,14.833600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,0.000000,14.833600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,0.000000,18.135600>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,90.000000,0> translate<59.944000,0.000000,18.135600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,18.135600>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.325000,0.000000,18.135600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,18.135600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,14.833600>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.325000,0.000000,14.833600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,14.833600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,13.131800>}
box{<0,0,-0.076200><1.701800,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.325000,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,9.829800>}
box{<0,0,-0.076200><0.939800,0.036000,0.076200> rotate<0,90.000000,0> translate<60.325000,0.000000,9.829800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,13.131800>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,90.000000,0> translate<60.325000,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,0.000000,9.448800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,0.000000,9.829800>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<59.944000,0.000000,9.829800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,0.000000,13.512800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,0.000000,13.131800>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.944000,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,0.000000,9.829800>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.944000,0.000000,9.829800> }
box{<-1.270000,0,-1.397000><1.270000,0.036000,1.397000> rotate<0,-270.000000,0> translate<58.547000,0.000000,16.484600>}
box{<-1.270000,0,-1.397000><1.270000,0.036000,1.397000> rotate<0,-270.000000,0> translate<58.547000,0.000000,11.480800>}
//X2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.525000,0.000000,5.080000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.525000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,15.240000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.573000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,4.572000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.573000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,4.572000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.747000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.001000,0.000000,5.080000>}
box{<0,0,-0.076200><0.567961,0.036000,0.076200> rotate<0,-63.430762,0> translate<7.747000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.889000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.143000,0.000000,5.080000>}
box{<0,0,-0.076200><0.567961,0.036000,0.076200> rotate<0,-63.430762,0> translate<0.889000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.540000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.286000,0.000000,5.080000>}
box{<0,0,-0.076200><0.567961,0.036000,0.076200> rotate<0,63.430762,0> translate<2.286000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.286000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.143000,0.000000,5.080000>}
box{<0,0,-0.076200><1.143000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.143000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.540000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.889000,0.000000,4.572000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,0.000000,0> translate<0.889000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,5.638800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.032000,0.000000,5.638800>}
box{<0,0,-0.076200><4.572000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.032000,0.000000,5.638800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,14.706600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.032000,0.000000,14.706600>}
box{<0,0,-0.076200><4.572000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.032000,0.000000,14.706600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.032000,0.000000,9.702800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.032000,0.000000,5.638800>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<2.032000,0.000000,5.638800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.032000,0.000000,9.702800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,9.702800>}
box{<0,0,-0.076200><4.572000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.032000,0.000000,9.702800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.032000,0.000000,10.642600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.032000,0.000000,14.706600>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<2.032000,0.000000,14.706600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.032000,0.000000,10.642600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,10.642600>}
box{<0,0,-0.076200><4.572000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.032000,0.000000,10.642600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.667000,0.000000,6.019800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.842000,0.000000,6.019800>}
box{<0,0,-0.076200><3.175000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.667000,0.000000,6.019800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.667000,0.000000,6.019800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.667000,0.000000,9.321800>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,90.000000,0> translate<2.667000,0.000000,9.321800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.667000,0.000000,9.321800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.842000,0.000000,9.321800>}
box{<0,0,-0.076200><3.175000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.667000,0.000000,9.321800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.667000,0.000000,11.023600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.842000,0.000000,11.023600>}
box{<0,0,-0.076200><3.175000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.667000,0.000000,11.023600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.667000,0.000000,11.023600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.667000,0.000000,14.325600>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,90.000000,0> translate<2.667000,0.000000,14.325600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.667000,0.000000,14.325600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.842000,0.000000,14.325600>}
box{<0,0,-0.076200><3.175000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.667000,0.000000,14.325600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.842000,0.000000,14.325600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.842000,0.000000,13.944600>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.842000,0.000000,13.944600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.842000,0.000000,11.023600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.842000,0.000000,11.404600>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<5.842000,0.000000,11.404600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.842000,0.000000,9.321800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.842000,0.000000,8.940800>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.842000,0.000000,8.940800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.842000,0.000000,6.019800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.842000,0.000000,6.400800>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<5.842000,0.000000,6.400800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.525000,0.000000,15.240000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.985000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.001000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,5.080000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.985000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.286000,0.000000,5.080000>}
box{<0,0,-0.076200><4.699000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.286000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.525000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.525000,0.000000,5.080000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.525000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.525000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,15.240000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.525000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.525000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.001000,0.000000,5.080000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.001000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,9.702800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,9.702800>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.779000,0.000000,9.702800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,9.702800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,5.638800>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.319000,0.000000,5.638800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,5.638800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,5.638800>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.779000,0.000000,5.638800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,5.638800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,9.702800>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.779000,0.000000,9.702800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,10.642600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,10.642600>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.779000,0.000000,10.642600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,10.642600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,14.706600>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.779000,0.000000,14.706600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,14.706600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,14.706600>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.779000,0.000000,14.706600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,10.642600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,14.706600>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.319000,0.000000,14.706600> }
object{ARC(0.683400,0.152400,221.428843,311.992821,0.036000) translate<10.947300,0.000000,6.654800>}
object{ARC(2.439600,0.152400,141.340192,216.870367,0.036000) translate<12.420600,0.000000,7.620000>}
object{ARC(2.058700,0.152400,310.984068,411.007255,0.036000) translate<10.058400,0.000000,7.696300>}
object{ARC(0.593000,0.152400,46.728669,150.936951,0.036000) translate<10.998100,0.000000,8.813800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,9.296400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,6.248400>}
box{<0,0,-0.076200><3.113443,0.036000,0.076200> rotate<0,78.226548,0> translate<10.795000,0.000000,9.296400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,9.169400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,6.121400>}
box{<0,0,-0.076200><3.113443,0.036000,0.076200> rotate<0,78.226548,0> translate<10.668000,0.000000,9.169400> }
object{ARC(0.683400,0.152400,221.428843,311.992821,0.036000) translate<10.947300,0.000000,11.658600>}
object{ARC(2.439700,0.152400,141.338358,216.867079,0.036000) translate<12.420600,0.000000,12.623700>}
object{ARC(2.058900,0.152400,310.988269,411.010757,0.036000) translate<10.058400,0.000000,12.699900>}
object{ARC(0.593000,0.152400,46.728669,150.936951,0.036000) translate<10.998100,0.000000,13.817600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,14.300200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,11.252200>}
box{<0,0,-0.076200><3.113443,0.036000,0.076200> rotate<0,78.226548,0> translate<10.795000,0.000000,14.300200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,14.173200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,11.125200>}
box{<0,0,-0.076200><3.113443,0.036000,0.076200> rotate<0,78.226548,0> translate<10.668000,0.000000,14.173200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,14.706600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,14.325600>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.604000,0.000000,14.325600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,10.642600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,11.023600>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.604000,0.000000,11.023600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,11.023600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,14.325600>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.604000,0.000000,14.325600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,14.325600>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.985000,0.000000,14.325600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,14.325600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,11.023600>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.985000,0.000000,11.023600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,11.023600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,9.321800>}
box{<0,0,-0.076200><1.701800,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.985000,0.000000,9.321800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,6.019800>}
box{<0,0,-0.076200><0.939800,0.036000,0.076200> rotate<0,90.000000,0> translate<6.985000,0.000000,6.019800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,6.019800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,9.321800>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.985000,0.000000,9.321800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,5.638800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,6.019800>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.604000,0.000000,6.019800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,9.702800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,9.321800>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.604000,0.000000,9.321800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,9.321800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,6.019800>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.604000,0.000000,6.019800> }
box{<-1.270000,0,-1.397000><1.270000,0.036000,1.397000> rotate<0,-270.000000,0> translate<5.207000,0.000000,12.674600>}
box{<-1.270000,0,-1.397000><1.270000,0.036000,1.397000> rotate<0,-270.000000,0> translate<5.207000,0.000000,7.670800>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  CARICABATTERIE(-33.020000,0,-23.380700,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:

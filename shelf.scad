include <..\SCAD_Modules\modules.scad>//FILE: ..\SCAD_Modules\modules.scad.vfc


	thick = 2;
	t = 1.8;
	
	
	

	usbL = 14;
	usbD = 35;
	usbW = 7 ;
	usb = [ usbL , usbD ,  usbW ];
	

base( A  );

module ballsock(  T = [ 0, 8, 0 ] , R = [ 90, 0, 0 ] ) {
	translate( [ 0 , 8, 0 ] )  rotate( [90, 0, 0 ])   import( "ball_socket.stl" );
	}
//  ballsock();
module base(    ) { 
	L = 105;
	W = 42 ;
	t = 3;
	difference(){
	union(){
		box( L , W+8 , t  );
		translate( [ t/2 , 0 , -10] )  box( L , t , 10  );
		translate( [ L/2, 0 , 0 ] )  box( t , W , L*.75  );
		translate( [ 0 , W/2, 0 ] )  box( L ,t , t*2  );
		translate( [ 0 , -W/2, 0 ] )  box( L ,t , t*2  );
	} #union(){// } union() {
		translate([ W , 0 , L/3 ]) rotate([ 0 , 90 , 0 ]) cylinder( r = 1.3, h = 50 , center = true );
		translate([ W , 0 , L*2/3 ]) rotate([ 0 , 90 , 0 ]) cylinder( r = 1.3, h = 50 , center = true );
		
		} }
	}
module plug( H = 64  )  {//plug( pos=[0,0,35] )
	R = 22/2 ;
	L = 3;
	ROT= -16 ;
	ZOF= -3 ;
	pos=[0,0,65] ; 
	translate( pos  )
	difference(){
	union(){
		cylinder( r = R+t, h = L );
		rotate( [ 0, ROT, 0 ])  translate( [ (R+1.5*t) , 0 , -H+L + ZOF ] )  cylinder( r = 3, h = H );
	} #union(){
		cylinder( r = R, h = L );
		} }
	}
/* ============================================================================= */
/* ============================================================================= */
/* ============================================================================= */
//BOOKstand() ;
//rotate( [ 180 , 0 , 0 ] )  cover ( );
module BOOKstand(  ) {
	A = 0;
	Y = 20;
	Z = -5;
	R = 3;
	H = 100;
	t = 10;
	difference(){
	union(){
		translate( [ 0 , 11, 5 ] )  rotate( [ 0 , 180 , 0 ] )    box( 70 ,50 , 6 );//  box( W , L , 1 );
		translate( [ 0 , 34 , 0 ] )    box( 70 ,4 , 70 );//  box( W , L , 1 );
		//translate( [ 20 , Y, Z ] ) rotate( [-A,0,0] ) wedge(T=t,L=10,h = H );
		//translate( [-20 , Y, Z ] ) rotate( [-A,0,0] ) wedge(T=t,L=10,h = H );
		//translate([ 20, 8 , 33 ]) rotate([ -30 , 0 , 0 ]) cylinder( r = R, h = H , center = true );
		//translate([ -20, 8 , 33 ]) rotate([ -30 , 0 , 0 ]) cylinder( r = R, h = H , center = true );
	} #union(){
		translate( [ 0 , 0 , -1] )  floor() ;
		} }
	}//////
//stand() ;
//rotate( [ 180 , 0 , 0 ] )  cover ( );
module stand(  ) {
	A = -15;
	Y = 20;
	Z = -5;
	difference(){
	union(){
		rotate( [ 0 , 180 , 0 ] )    box( 57.5 , 51.5 , 2 );//  box( W , L , 1 );
		translate( [ 20 , Y, Z ] ) rotate( [-A,0,0] ) wedge(T=5,L=10,h = 50 );
		translate( [-20 , Y, Z ] ) rotate( [-A,0,0] ) wedge(T=5,L=10,h = 50 );
		translate([ 20, 8 , 11 ]) rotate([ -30 , 0 , 0 ]) cylinder( r = 1.3, h = 45 , center = true );
		translate([ -20, 8 , 11 ]) rotate([ -30 , 0 , 0 ]) cylinder( r = 1.3, h = 45 , center = true );
	} #union(){
		translate( [ 0 , 0 , -1] )  floor() ;
		} }
	}//////
//translate( [ W/2 + 3 , 0 , 0] )  usb();
module usb(  ) {
	difference(){
	union(){
		box( usbL , usbW , usbD );
	} #union(){
		} }
	}//////


echo("------------------------");
//  Export  Date: 08:51:39 PM - 18:Oct:2025...


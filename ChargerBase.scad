include <..\SCAD_Modules\modules.scad>


	thick = 2;
	t = 3;
	
	
	

	usbL = 10;
	usbD = 30;
	usbW = 4;
	usb = [ usbL , usbD ,  usbW ];
	

for  (A= [ 0:120:300 ]) {
	base( A  );
	}


module ballsock(  T = [ 0, 8, 0 ] , R = [ 90, 0, 0 ] ) {
	translate( [ 0 , 8, 0 ] )  rotate( [90, 0, 0 ])   import( "ball_socket.stl" );
	}
translate( [ 50, 0 , 0 ] )
ballsock();
module base( A = 0  ) {
	L = 52;
	D = 10;
	H = 10;
	R = 56.5 / 2 ;
	W = t + R ;
	difference(){
	union(){
		rotate( [ 0 , 0 , A ] )   plug( );
		cylinder( r = W, h = H );
	} #union(){
		cylinder( r = R, h = H );
		translate( [ 0, 30 , H/2-usbW/2 ] )  rounded_box( usb , 1 );
		
		} }
	}
module plug( pos=[0,0,45]  )  {
	R = 22/2 ;
	L = 10;
	H = 55;
	ROT= -20 ;
	ZOF= -5 ;
	translate( pos  )
	difference(){
	union(){
		cylinder( r = R+t, h = L );
		rotate( [ 0, ROT, 0 ])  translate( [ (R+1.5*t) , 0 , -H+L + ZOF ] )  cylinder( r = t, h = H );
	} #union(){
		cylinder( r = R, h = L );
		} }
	}
/* ============================================================================= */
/* ============================================================================= */
/* ============================================================================= */


module BOOKstand(  ) {
	A = 0;
	Y = 20;
	Z = -5;
	R = 3;
	H = 100;
	t = 10;
	difference(){
	union(){
		translate( [ 0 , 11, 5 ] )  rotate( [ 0 , 180 , 0 ] )    box( 70 ,50 , 6 );
		translate( [ 0 , 34 , 0 ] )    box( 70 ,4 , 70 );
		
		
		
		
	} #union(){
		translate( [ 0 , 0 , -1] )  floor() ;
		} }
	}


module stand(  ) {
	A = -15;
	Y = 20;
	Z = -5;
	difference(){
	union(){
		rotate( [ 0 , 180 , 0 ] )    box( 57.5 , 51.5 , 2 );
		translate( [ 20 , Y, Z ] ) rotate( [-A,0,0] ) wedge(T=5,L=10,h = 50 );
		translate( [-20 , Y, Z ] ) rotate( [-A,0,0] ) wedge(T=5,L=10,h = 50 );
		translate([ 20, 8 , 11 ]) rotate([ -30 , 0 , 0 ]) cylinder( r = 1.3, h = 45 , center = true );
		translate([ -20, 8 , 11 ]) rotate([ -30 , 0 , 0 ]) cylinder( r = 1.3, h = 45 , center = true );
	} #union(){
		translate( [ 0 , 0 , -1] )  floor() ;
		} }
	}

module usb(  ) {
	difference(){
	union(){
		box( usbL , usbW , usbD );
	} #union(){
		} }
	}


echo("------------------------");
//  Export  Date: 06:34:38 PM - 16:Sep:2025...


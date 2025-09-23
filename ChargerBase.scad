include <..\SCAD_Modules\modules.scad>


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

module ring_holder (  ) {
	L = 52;
	D = 10;
	H = 8;
	R = 57.5 / 2 ;
	W = t + R ;
	difference(){
	union(){
		cylinder( r = W, h = H );
	} #union(){
		cylinder( r = R, h = H );
		translate( [ 0, 30 , H/2-usbW/2+1 ] )  rounded_box( usb , 1 );
		
		} }
	}

module base(    ) {
	L = 52;
	D = 10;
	H = 9.5;
	R = 57.5 / 2 ;
	W = t + R ;
	ANG = 8 ;
	difference(){
	union(){
		for  (A= [ 0:120:300 ]) {
			if( A == 0 )
			{
				rotate( [ 0 , 0 , A ] )   plug(  72 );
			} else {
				rotate( [ 0 , 0 , A ] )   plug(  64 );
				}
			}
		
		rotate( [ 0 , ANG, 0 ]) translate( [0,0,-.2] ) cylinder( r = W, h = H+.2 );
	} #union(){
		rotate( [ 0 , ANG, 0 ]) translate( [0,0,.10] )  cylinder( r = R, h = H );
		rotate( [ 0 , ANG, 0 ]) translate( [0,0,-3] )  cylinder( r = R-1, h = 4);
		rotate( [ 0 , ANG, 0 ])  translate( [ 0, 30 , H/2-usbW/2+1 ] )  rounded_box( usb , 1 );
		
		} }
	}
module plug( H = 64  )  {
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
//  Export  Date: 02:30:04 PM - 20:Sep:2025...


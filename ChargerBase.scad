include <..\SCAD_Modules\modules.scad>


	thick = 2;
	t = 1.8;
	
	
	

	usbL = 14;
	usbD = 35;
	usbW = 7 ;
	usb = [ usbL , usbD ,  usbW ];
	

module crown( H = 4 ) {
	R1 = 24.5/2;
	R2= 22/2;
	difference(){
	union(){
		translate( [ 0 , 0 , -H] )  cylinder( r = R1, h = H);
		cylinder( r1 = R1, r2=R2, h = H);
	} #union(){
		} }
	}

module ballsock(  T = [ 0, 8, 0 ] , R = [ 90, 0, 0 ] ) {
	translate( [ 0 , 8, 0 ] )  rotate( [90, 0, 0 ])   import( "ball_socket.stl" );
	}
module ring_holder ( in = true ) {
	L = 52;
	D = 10;
	H = 8;
	R = 57.5 / 2 ;
	W = t + R ;
	ANG = 0;
	difference(){
	union(){
		if(  in  )
		{
			translate( [0,0,-.2] ) cylinder( r = W, h = H+.2 );
		} else {
			rotate( [ 0 , ANG, 0 ]) translate( [0,0,.10] )  cylinder( r = R, h = H );
			rotate( [ 0 , ANG, 0 ]) translate( [0,0,-3] )  cylinder( r = R-1, h = 4);
			rotate( [ 0 , ANG, 0 ])  translate( [ 0, 30 , H/2-usbW/2+1  ] )  rounded_box( usb , 1 );
			}
	} #union(){
		if(  in  )
		{
			rotate( [ 0 , ANG, 0 ]) translate( [0,0,.10] )  cylinder( r = R, h = H );
			rotate( [ 0 , ANG, 0 ]) translate( [0,0,-3] )  cylinder( r = R-1, h = 4);
			rotate( [ 0 , ANG, -90 ])  translate( [ 0, 30 , H/2-usbW/2+1  ] )  rounded_box( usb , 1 );
			}
		
		} }
	}


base(  );
module base(    ) {
	L = 52;
	D = 10;
	H = 9.5;
	R = 57.5 / 2 ;
	W = t + R ;
	PH =[ 1, 1, 3]  ;
	ANG =[ -7, 7 , 0 ] ;
	difference(){
	union(){
		
		PHASE = 30;
		for  (A= [ PHASE:120:300+PHASE ]) {
			if( A == PHASE )
			{
				rotate( [ 0 , 0 , A ] )   plug( 73 );
			} else {
				rotate( [ 0 , 0 , A ] )   plug(  60 );
				}
			}
		
		translate( PH ) rotate( ANG )   ring_holder();
	} #union(){
		translate( PH ) rotate( ANG )    ring_holder( false );
		
		} }
	}
module plug( H = 64  )  {
	R = 22/2 ;
	Rc = 28.4/2 ;
	dz = 6;
	L = 6;
	ROT= -16.5 ;
	ZOF= -5 ;
	pos=[0,0,65] ;
	translate( pos  )
	difference(){
	union(){
		union()
		{
			translate( [ 0 , 0 , -1.25 + dz] )  cylinder( r = Rc, h = dz );
			translate( [ 0 , 0 , -1.25] )  cylinder( r = R+t, h = L );
			}
		rotate( [ 0, ROT, 0 ])  translate( [ (R+1.5*t) , 0 , -H+L + ZOF ] )  cylinder( r = 3, h = H );
	} #union(){
		crown();
		cylinder( r = R, h = 25 );
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
//  Export  Date: 02:15:54 PM - 25:Oct:2025...


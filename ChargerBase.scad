include <E:\Users\luisr\OneDrive\Desktop\SCAD_Modules\modules.scad>

thick = 2;

W = 58 ;
L = 52;
D = 10;
R = 25;

usbL = 20;
usbD = 6;
usbW = 14;




module base(  ) {
	difference(){
	union(){
		box( W+thick*2 , L+thick*2 , 15 + 1 );
		translate( [ 0 , 0 , 1 ] )  cylinder( r = R+thick/2, h = 15);
	} #union(){
		box( W , L , D  );
		cylinder( r = R, h = 15);
		translate( [ W/2 + 3 , 0 , 0] )  usb();
		} }
	}

module cover(  ) {
	difference(){
	union(){
		box( 57.5 , 51.5 , 2 );
		box( W+thick*2 , L+thick*2 , 1 );
	} #union(){
		} }
	}
BOOKstand() ;

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
//  Export  Date: 09:39:44 PM - 03:Feb:2025...


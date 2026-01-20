include <..\SCAD_Modules\modules.scad>//FILE:..\SCAD_Modules\modules.scad.vfc
use <strap.scad>//////FILE:.strap.scad.vfc
$fn=100;

R = 7;
phoneH  = 8.4;
phoneDIM = [ 71 , 146. , phoneH  ] ;
//% translate( [ 0 , 0 , 50] )  phone();

module tapered_box(d,r , taper=0) {///
	translate( [ -d[0]/2 , -d[1]/2 , 0 ] )///
	if(taper == 0) {///
	///
		linear_extrude(height = d[2] )///
		minkowski() {///
		///
			translate([r,r]) square([d[0]-2*r, d[1]-2*r]);///
			circle(r);///
			}///
	} else {///
		hull() {///
		
			linear_extrude(height = 0.01 )///
			minkowski() {///
			///
				translate([r,r]) square([d[0]-2*r, d[1]-2*r]);///
				circle(r);///
				}///
			translate([0, 0, d[2]])///
			linear_extrude(height = 0.01 )///
			minkowski() {///
			///
				translate([r-taper/2,r-taper/2]) square([d[0]+taper-2*r, d[1]+taper-2*r]);///
				circle(r);///
				}///
			}///
		}///
	}
//translate( [ 0 , 0 , 100] )
//translate( [ 0 , 0 , 90] )  phone() ;
module phone( ) {
	scrDIM = [ 29 , 44 , 12  ] ;
	M = 5;
	scrMARGIN  = [ M, M , 0  ] ;
	cameraLOC = [ 23.2 , 48,  -7.4 ] ;
	difference()
	union() {
		translate( [ 0 , 0 , 9. ] )   tapered_box( phoneDIM - [ 7, 7, 0 ] , R , 30  );///
		rounded_box( phoneDIM , R  );//body
		color("yellow")  translate( cameraLOC ) cam();//color("yellow")  translate( cameraLOC )  rounded_box( cameraDIM , R  );
		color("blue")  translate( [0, 0 ,  6 ] )  rounded_box( phoneDIM - scrMARGIN ,R  );
		
		translate( [ 35, 27, phoneH/2-3.5 ] )  box( 10 , 26 ,7  );
		
		translate([ 8 , 61 , -7 ])  cylinder( r1 = 10, r2=4, h = 15 , center = true );//sensor hole
		
		translate([ 22 , 61.5 , -7 ])  cylinder( r1 = 20, r2=4, h = 15 , center = true );//camera 2 hole
		translate([ 22 , 47.5 , -7 ])  cylinder( r1 = 20, r2=4, h = 15 , center = true );//camera 1 hole
		translate([ 22 , 33.5 , -7 ])  cylinder( r1 = 20, r2=4, h = 15 , center = true );//camera 2 hole
	} union() {
		}
	}
module cam( ) {
	cameraDIM =[21 , 50. , 10 ] ;
	translate([0,0,6])  rounded_box( cameraDIM , R  );
	translate( [ -R/2, 18.0 ,6 ] )  box( 2*R , 2*R , 10 );
	translate( [ R/2, -18 , 6] )  box( 2*R , 2*R , 10 );
	}
module charger( R=49.5, H = 10 ) {
	translate([ 0 , -5 , 0 ]) rotate([ 0 , 0 , 0 ]) cylinder( r = R, h =H , center = true );
	}
//% translate( [ 0 , 0 , 50] )  phone();
main( top = true  );//main( top = false );
main( );
module main ( top = false ) {//module main ( top = true ) {
	LeanA = 10;
	bumperTHICK = 15;
	bumperH = -2.5 ;
	bumperL = 44;
	bumperW = 34;
	bumperDIM = [ bumperW , bumperL , bumperTHICK ] ;
	buttonDIM = [ 30 , 9, 5  ] ;
	bumperMARG = 5;
	bumperX = 18 + bumperMARG ;
	bumperY =57 - 5  ;
	
	BRcornerLOC  = [ -(bumperX  ) , -(bumperY+2) ,  bumperH ] ;
	BLcornerLOC  = [ (bumperX  ) , -(bumperY+2) ,  bumperH ] ;
	
	TRcornerLOC  = [ -(bumperX) , (bumperY+3) ,  bumperH ] ;
	TLcornerLOC  = [ (bumperX) , (bumperY+3) ,  bumperH ] ;
	
	strapLOC  = [ 0 ,-5 , -1.  ] ;
	difference() {
	union()  {
		if( top )
		{
			color("white")  translate( TRcornerLOC  )  smooth_box( bumperDIM , R  );
			color("white")  translate( TLcornerLOC  )  smooth_box( bumperDIM , R  );
			
			color("red")  translate( TLcornerLOC + [  2 , -10, 8  ]  )  smooth_box( buttonDIM , 4  );
			///color("red")  translate( TLcornerLOC + [ 1, -27, 8 ]  )  smooth_box( buttonDIM , 4  );//
			
			// translate( [ 0 , 54 , bumperH ] )  box( 78 , 37 , 4 );
			
			//translate([ -34 , 57 , -4 ]) rotate([ 0 , 90-LeanA  + 8 , 0 ]) cylinder( r = 6, h = 4 , center = true );
			//translate([ 34 , 57 , -4 ]) rotate([ 0 , 90-LeanA  + 8 , 0 ]) cylinder( r = 6, h = 4 , center = true );
			
			translate( [ 0 , 45., bumperH   ] )  box( 40 ,55 , abs(bumperH) );
		} else {
			color("white")  translate( BRcornerLOC  )  smooth_box( bumperDIM , R  );
			color("white")  translate( BLcornerLOC  )  smooth_box( bumperDIM , R  );
			translate( [ 0 , -45., bumperH   ] )  box( 40 , 48 , abs(bumperH) );
			
			//translate([ -34 , -57 , -4 ]) rotate([ 0 , 90-LeanA  + 8 , 0 ]) cylinder( r = 6, h = 4 , center = true );
			//translate([ 34 , -57 , -4 ]) rotate([ 0 , 90-LeanA  + 8 , 0 ]) cylinder( r = 6, h = 4 , center = true );
			}
	} union() {//}# union() {
		//FILE:.\Funct Builds\Zipper.scad.vfc//translate( strapLOC  ) rotate([0,0,90]) strap( );
		//shiftX = 2;
		//shiftY = shiftX;
		phone();
		if( top  )
		{
			translate( [ 0 , 0 , -6] )  charger();
			translate( [ 0 , 0 , 0] )  charger( 35 );
		} else {
			translate( [ 0 , 0 , -6] )  charger();
			translate( [ 0 , 0 , 0] )  charger( 32);
			}
		//color("white")  translate( [ -(20 - shiftX ) , (50 - shiftY ) ,  4 ] )  rounded_box( DIM ,R  );
		
		// speaker hole//translate( [ -23 , 80, 1.5] ) rotate( [ 0 ,  0 , 20 ] )box( 13 , 30 , 5 );
		translate( [ -23 , -80, 1.5] ) rotate( [ 0 ,  0 , -20 ] )box( 13 , 30 , 5 );//// speaker hole
		//speaker hole//translate( [ 23 , 80, 1.5] )   rotate( [ 0 ,  0 , -20 ] )box( 13 , 30 , 5 );
		translate( [ 23 , -80, 1.5] )   rotate( [ 0 ,  0 , 20 ] )box( 13 , 30 , 5 );////speaker hole
		
		//sloped sides//translate([ -45 , 0 , -10 ]) rotate([ 0 , -LeanA , 0 ]) translate([0,0,-15]) box( 20, 200, 50 ) ;
		//sloped sides//translate([ 45 , 0 , -10 ]) rotate([ 0 , LeanA , 0 ]) translate([0,0,-15]) box( 20, 200, 50 ) ;
		
		translate([0 , 0 , -11 ]) box( 20, 200, 10 ) ;//make room for charge cable
		} }
	}
//  Export  Date: 10:36:01 PM - 19:Jan:2026...


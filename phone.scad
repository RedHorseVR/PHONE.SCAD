include <..\SCAD_Modules\modules.scad>
use <strap.scad>

R = 7;
phoneH  = 8;
phoneDIM = [ 70.2 , 146. , phoneH  ] ;


module phone( ) {
	scrDIM = [ 29 , 44 , 12  ] ;
	M = 5;
	scrMARGIN  = [ M, M , 0  ] ;
	cameraLOC = [ 23.2 , 48,  -14 ] ;
	difference()
	union() {
		rounded_box( phoneDIM , R  );
		color("yellow")  translate( cameraLOC ) cam();
		color("blue")  translate( [0, 0 ,  6 ] )  rounded_box( phoneDIM - scrMARGIN ,R  );
		
		translate( [ 35, 27, phoneH/2-3.5 ] )  box( 10 , 26 ,7  );
		
		translate([ 8 , 61 , -7 ])  cylinder( r1 = 20, r2=4, h = 15 , center = true );
		translate([ 23 , 46 , -7 ])  cylinder( r1 = 20, r2=4, h = 15 , center = true );
		translate([ 23 , 61 , -7 ])  cylinder( r1 = 20, r2=4, h = 15 , center = true );
	} union() {
		}
	}
module cam( ) {
	cameraDIM =[120 , 49. , 10 ] ;
	translate([0,0,3])  rounded_box( cameraDIM , R  );
	
	
	}
module charger( R=49.5, H = 10 ) {
	translate([ 0 , 0 , 0 ]) rotate([ 0 , 0 , 0 ]) cylinder( r = R, h =H , center = true );
	}
main( true  );

module main ( top = false  ) {
	LeanA = 10;
	bumperTHICK = 15;
	bumperDIM = [ 29 , 40 , bumperTHICK ] ;
	bumperDIM2 = [ 29 ,40 , bumperTHICK ] ;
	buttonDIM = [ 30 , 9, 5  ] ;
	bumperMARG = 5;
	bumperH = -4;
	bumperX = 21 + bumperMARG ;
	bumperY =57 - 5  ;
	
	BRcornerLOC  = [ -(bumperX - 2 ) , -(bumperY+4) ,  bumperH ] ;
	BLcornerLOC  = [ (bumperX - 2 ) , -(bumperY+4) ,  bumperH ] ;
	
	TRcornerLOC  = [ -(bumperX-2) , (bumperY+5) ,  bumperH ] ;
	TLcornerLOC  = [ (bumperX-2) , (bumperY+5) ,  bumperH ] ;
	
	strapLOC  = [ 0 ,-5 , -1.  ] ;
	difference() {
	union()  {
		if( top )
		{
			color("white")  translate( TRcornerLOC  )  rounded_box( bumperDIM , R  );
			color("white")  translate( TLcornerLOC  )  rounded_box( bumperDIM , R  );
			
			color("red")  translate( TLcornerLOC + [  2 , -10, 8  ]  )  rounded_box( buttonDIM , 4  );
			
			
			translate( [ 0 , 54 , bumperH ] )  box( 78 , 37 , 4 );
			
			
			
			
		} else {
			color("white")  translate( BRcornerLOC  )  rounded_box( bumperDIM2 , R  );
			color("white")  translate( BLcornerLOC  )  rounded_box( bumperDIM2 , R  );
			translate( [ 0 , -52., bumperH   ] )  box( 40 ,30 , abs(bumperH) );
			
			
			
			}
	} union() {
		//FILE:.\Funct Builds\Zipper.scad.vfc
		
		
		phone();
		
		
		
		// speaker hole
		translate( [ -23 , -80, 1.5] ) rotate( [ 0 ,  0 , -20 ] )box( 13 , 30 , 5 );
		//speaker hole
		translate( [ 23 , -80, 1.5] )   rotate( [ 0 ,  0 , 20 ] )box( 13 , 30 , 5 );
		
		translate([ -45 , 0 , -10 ]) rotate([ 0 , -LeanA , 0 ]) translate([0,0,-15]) box( 20, 200, 50 ) ;
		translate([ 45 , 0 , -10 ]) rotate([ 0 , LeanA , 0 ]) translate([0,0,-15]) box( 20, 200, 50 ) ;
		
		translate([0 , 0 , -11 ]) box( 20, 200, 10 ) ;
		} }
	}
//  Export  Date: 01:56:48 PM - 20:Sep:2025...


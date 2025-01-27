include <C:\Users\luisr\OneDrive\Desktop\SCAD_Modules\modules.scad>
	include <E:\Users\luisr\OneDrive\Desktop\SCAD_Modules\modules.scad>
	use <strap.scad>
	
R = 7;
phoneH  = 8;
phoneDIM = [ 70.2 , 146. , phoneH  ] ;
% translate( [ 0 , 0 , 50] )  phone();
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
	} union() {
		}
	}
module cam( ) {
	cameraDIM =[20 , 49. , 20 ] ;
	rounded_box( cameraDIM , R  );
	translate( [ -R/2+.5, 17.5 , 0 ] )  box( 2*R , 2*R , 15 );
	translate( [ R/2-.5, -17.5 , 0 ] )  box( 2*R , 2*R , 15 );
	}
module charger( R=49.5, H = 10 ) {
	translate([ 0 , 0 , 0 ]) rotate([ 0 , 0 , 0 ]) cylinder( r = R, h =H , center = true );
	}
main( true  );

module main ( cam= false  ) {
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
	if( cam  )
	{
		translate( strapLOC  ) rotate([0,0,90]) strap( );
	} else {
		}
	difference() {
	union()  {
		if( cam  )
		{
			color("white")  translate( TRcornerLOC  )  rounded_box( bumperDIM , R  );
			color("white")  translate( TLcornerLOC  )  rounded_box( bumperDIM , R  );
			
			
			
			
			translate( [ 0 , 54 , bumperH ] )  box( 78 , 37 , 4 );
			
			translate([ -34 , 57 , -4 ]) rotate([ 0 , 90-LeanA  + 8 , 0 ]) cylinder( r = 6, h = 4 , center = true );
			translate([ 34 , 57 , -4 ]) rotate([ 0 , 90-LeanA  + 8 , 0 ]) cylinder( r = 6, h = 4 , center = true );
		} else {
			color("white")  translate( BRcornerLOC  )  rounded_box( bumperDIM2 , R  );
			color("white")  translate( BLcornerLOC  )  rounded_box( bumperDIM2 , R  );
			translate( [ 0 , -52., bumperH   ] )  box( 40 ,30 , abs(bumperH) );
			
			translate([ -34 , -57 , -4 ]) rotate([ 0 , 90-LeanA  + 8 , 0 ]) cylinder( r = 6, h = 4 , center = true );
			translate([ 34 , -57 , -4 ]) rotate([ 0 , 90-LeanA  + 8 , 0 ]) cylinder( r = 6, h = 4 , center = true );
			}
	} union() {
		translate( strapLOC  ) rotate([0,0,90]) strap( );
		# translate([ 8 , 61 , -7 ])  cylinder( r1 = 10, r2=3, h = 15 , center = true );
		
		
		phone();
		translate( [ 0 , 0 , -6] )  charger();
		
		
		// speaker hole
		translate( [ -23 , -80, 1.5] ) rotate( [ 0 ,  0 , -20 ] )box( 13 , 30 , 5 );
		//speaker hole
		translate( [ 23 , -80, 1.5] )   rotate( [ 0 ,  0 , 20 ] )box( 13 , 30 , 5 );
		
		translate([ -45 , 0 , -10 ]) rotate([ 0 , -LeanA , 0 ]) translate([0,0,-15]) box( 20, 200, 50 ) ;
		translate([ 45 , 0 , -10 ]) rotate([ 0 , LeanA , 0 ]) translate([0,0,-15]) box( 20, 200, 50 ) ;
		} }
	}
//  Export  Date: 03:29:08 PM - 19:Jan:2025...


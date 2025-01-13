include <C:\Users\luisr\OneDrive\Desktop\SCAD_Modules\modules.scad>
	include <E:\Users\luisr\OneDrive\Desktop\SCAD_Modules\modules.scad>
	use <.\Funct Builds\Zipper.scad>
	
R = 7;
phoneH  = 8;
% translate( [ 0 , 0 , 50] )  phone();
module phone( ) {
	scrDIM = [ 29 , 44 , 12  ] ;
	M = 5;
	scrMARGIN  = [ M, M , 0  ] ;
	phoneDIM = [ 71 , 146 , phoneH  ] ;
	cameraLOC = [ 23.9 , 50.,  -10 ] ;
	difference()
	union() {
		rounded_box( phoneDIM , R  );
		color("yellow")  translate( cameraLOC ) cam();
		color("blue")  translate( [0, 0 ,  6 ] )  rounded_box( phoneDIM - scrMARGIN ,R  );
	} union() {
		}
	}
module cam( ) {
	cameraDIM =[20 , 44 , 14 ] ;
	translate( cameraLOC )  rounded_box( cameraDIM , R  );
	translate( [ -R/2+.5, 15 , 0 ] )  box( 2*R , 2*R , 15 );
	translate( [ R/2-.5, -15 , 0 ] )  box( 2*R , 2*R , 15 );
	}
module charger( R=49.5, H = 10 ) {
	translate([ 0 , 0 , 0 ]) rotate([ 0 , 0 , 0 ]) cylinder( r = R, h =H , center = true );
	}

main( );
module main ( cam= false  ) {
	bumperDIM = [ 26 , 52 , 12  ] ;
	bumperDIM2 = [ 29 ,40 , 12  ] ;
	bumperMARG = 4;
	bumperH = -2;
	bumperX = 21 + bumperMARG ;
	bumperY = bumperDIM[1] - 5 + bumperMARG ;
	
	BRcornerLOC  = [ -(bumperX - 2 ) , -(bumperY+4) ,  bumperH ] ;
	BLcornerLOC  = [ (bumperX - 2 ) , -(bumperY+4) ,  bumperH ] ;
	
	TRcornerLOC  = [ -(bumperX) , (bumperY) ,  bumperH ] ;
	TLcornerLOC  = [ (bumperX) , (bumperY) ,  bumperH ] ;
	strapLOC  = [ -25 ,0 , -7  ] ;
	difference() {
	union()  {
		if( cam  )
		{
			color("white")  translate( TRcornerLOC  )  rounded_box( bumperDIM , R  );
			color("white")  translate( TLcornerLOC  )  rounded_box( bumperDIM , R  );
			translate( [ 0 ,54.5, bumperH  ] )  box( 37 ,25 , 4 );
		} else {
			color("white")  translate( BRcornerLOC  )  rounded_box( bumperDIM2 , R  );
			color("white")  translate( BLcornerLOC  )  rounded_box( bumperDIM2 , R  );
			translate( [ 0 , -52., bumperH   ] )  box( 40 ,30 , 2 );
			}
	}# union() {
		translate( strapLOC  ) rotate([0,0,90]) strap( );
		
		
		
		phone();
		translate( [ 0 , 0 , -6] )  charger();
		
		
		translate( [ -23 , 80, 1.5] ) rotate( [ 0 ,  0 , 20 ] )box( 13 , 30 , 5 );
		translate( [ -23 , -80, 1.5] ) rotate( [ 0 ,  0 , -20 ] )box( 13 , 30 , 5 );
		translate( [ 23 , 80, 1.5] )   rotate( [ 0 ,  0 , -20 ] )box( 13 , 30 , 5 );
		translate( [ 23 , -80, 1.5] )   rotate( [ 0 ,  0 , 20 ] )box( 13 , 30 , 5 );
	
		} }
	}
//  Export  Date: 04:24:56 PM - 13:Jan:2025...


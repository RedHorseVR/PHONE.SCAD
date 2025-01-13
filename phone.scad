include <C:\Users\luisr\OneDrive\Desktop\SCAD_Modules\modules.scad>
	include <E:\Users\luisr\OneDrive\Desktop\SCAD_Modules\modules.scad>
	use <.\Funct Builds\Zipper.scad>
	
R = 7;
phoneH  = 8;
module phone( ) {
	difference()
	union() {
		rounded_box( [71 , 146 , phoneH  ] , R  );
		translate( [ 20.5 , 50.5,  -2.5 ] )  rounded_box( [29 , 44 , phoneH  + 2  ] , R  );
	} union() {
		}
	}
main( );
module main ( cam= false  ) {
	DIM = [ 29 , 44 , 12  ] ;
	if( cam  )
	{
		difference() {
		union()  {
			color("white")  translate( [ -(20.5 + 5) , (50.5 + 5) ,  -2 ] )  rounded_box( DIM , R  );
		}# union() {
			shiftX = 2;
			shiftY = shiftX;
			phone();
			color("white")  translate( [ -(20 - shiftX ) , (50 - shiftY ) ,  -1.9  ] )  rounded_box( DIM ,R   );
			# translate( [ -(20 - shiftX+1 ) , (50 - shiftY+1 ) ,  -2.8  ] )  rounded_box( DIM ,R   );
			color("white")  translate( [ -(20 - shiftX ) , (50 - shiftY ) ,  -3  ] )  rounded_box( DIM ,R   );
			
			} }
	} else {
		difference() {
		union()  {
			color("white")  translate( [ -(20.5 + 5) , (50.5 + 5) ,  -2 ] )  rounded_box( DIM , R  );
		}# union() {
			translate( [ 0 , 62 , -4] )  strap( );
			translate([ 0 , 0 , 0 ]) rotate([ 0 , 0 , 0 ]) cylinder( r = 51, h = 5 , center = true );
			shiftX = 2;
			shiftY = shiftX;
			phone();
			color("white")  translate( [ -(20 - shiftX ) , (50 - shiftY ) ,  4 ] )  rounded_box( DIM ,R  );
			
			translate( [ -23 , 80, 1.5] )
			union()
			{
				rotate( [ 0 ,  0 , 20 ] )
				box( 13 , 30 , 5 );
				}
			} }
		}
	}
//  Export  Date: 09:55:46 PM - 12:Jan:2025...


include <E:\Users\luisr\OneDrive\Desktop\SCAD_Modules\modules.scad>



strap( 1.5  );
module strap( h=1.5 , L=54  ) {
	W=8 ;
	difference(){
	union(){
		translate( [ L/2 , W/2 , 0 ] )  ridge( h = h ) ;
		translate( [ L/2+15 , -W/2, 0 ] )  rotate( [0,0,180] ) ridge(h=h) ;
		box( L + 30 , W  , h );
		translate( [ -L/2-15 , W/2, 0 ] )  ridge(h=h) ;
		translate( [ -L/2 , -W/2, 0 ] )  rotate( [0,0,180] ) ridge(h=h) ;
	} #union(){
		} }
	}
module ridge( Base= 3 , h= 5 , N = 5  ) {
	path = [[0, 0]];
	R = 2;
	tri = [[0, 0], [Base, 0], [ Base/R, Base]];
	for (i = [0:N-1]) {
		translate( [ i*Base, 0 , 0 ] )
		linear_extrude(height = h )
		polygon(points = tri );
		}
	
	
	
	
	echo("------------------------");
	echo(path);
	
	
	
	
	}






main();
module main ( ) {


}



//  Export  Date: 03:20:28 PM - 15:Jan:2025...


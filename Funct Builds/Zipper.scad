include <E:\Users\luisr\OneDrive\Desktop\SCAD_Modules\modules.scad>

translate( [ 0 , -10, 0 ] )  strap( 2 , L= 22.5 );
translate( [ 0 , 10, 0 ] )  strap( 2 );
strap( 2 , L = 21 );
module strap( h=5 , L=22  ) {
	W=3 ;
	difference(){
	union(){
		translate( [ L/2 , 1.5, 0 ] )  ridge( h = h ) ;
		translate( [ L/2+15 , -1.5, 0 ] )  rotate( [0,0,180] ) ridge(h=h) ;
		box( L + 30 , W  , h );
		translate( [ -L/2-15 , 1.5, 0 ] )  ridge(h=h) ;
		translate( [ -L/2 , -1.5, 0 ] )  rotate( [0,0,180] ) ridge(h=h) ;
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



//  Export  Date: 12:44:01 AM - 13:Jan:2025...


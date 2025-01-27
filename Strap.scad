include <E:\Users\luisr\OneDrive\Desktop\SCAD_Modules\modules.scad>



strap( 1.5  );
module strap( h=1., L=60  ) {
	W=8 ;
	difference(){
	union(){
		translate( [ L/2 , W/2 , 0 ] )  ridge( h = h ) ;
		translate( [ L/2+15 , -W/2, 0 ] )  rotate( [0,0,180] ) ridge(h=h) ;
		box( L + 30 , W  , h );
		
		
		translate( [ -L/2 -10 , -W/2, 0 ] )  cylinder( r = 5, h=h) ;
		translate( [ -L/2 -10 , W/2, 0 ] )  cylinder( r = 5, h=h) ;
		
		translate( [ 0 , 0 , -1] )  ring( inner_rad = 19 , wall_thick = 2 , high = h+ 1  );
		translate( [ 0 , 0 , .0 ] ) cylinder( r= 19 , h = 1  );
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



//  Export  Date: 03:20:44 PM - 19:Jan:2025...


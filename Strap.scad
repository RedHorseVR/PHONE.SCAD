include <E:\Users\luisr\OneDrive\Desktop\SCAD_Modules\modules.scad>
$fn=120;

//translate( [ 0 , -10, 0 ] )  strap( 2 , L= 22.5 );
//translate( [ 0 , 10, 0 ] )  strap( 2 );
//TEE( );
//TEE( 45  );
TEE( 55  );
module TEE(  L=35  ) { 
	W=15 ;
	t = 3;
	difference(){
	union(){
		cylinder( r= W/2 , h = L  );
		cylinder( r= W+4 , h = t/2  );
	} #union(){
		translate( [ 0 , 0 , .0 ] ) cylinder( r= W/2-t , h = L+t  );
		translate( [ 0 , 0 , L-t/2  ] ) cylinder( r1= W/2-t/2 , r2= W*1.5, h = 2*t  );
		} }
	}
//strap( 1.5  );
module strap( h=1., L=60  ) {//module strap( h=1., L=64  ) {
	W=8 ;
	difference(){
	union(){
		translate( [ L/2 , W/2 , 0 ] )  ridge( h = h ) ;
		translate( [ L/2+15 , -W/2, 0 ] )  rotate( [0,0,180] ) ridge(h=h) ;
		box( L + 30 , W  , h );
		//translate( [ -L/2-15 , W/2, 0 ] )  ridge(h=h) ;
		//translate( [ -L/2 , -W/2, 0 ] )  rotate( [0,0,180] ) ridge(h=h) ;
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
	tri = [[0, 0], [Base, 0], [ Base/R, Base]];// // Define the triangle vertices tri = [[0, 0], [3, 0], [1.5, 3]];//
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



//  Export  Date: 03:59:20 PM - 18:Oct:2025...


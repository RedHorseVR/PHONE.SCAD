include <..\SCAD_Modules\modules.scad>

module ballsock(  T = [ 0, 8, 0 ] , R = [ 90, 0, 0 ] ) {
	translate( [ 0 , 8, 0 ] )  rotate( [90, 0, 0 ])   import( "ball_socket.stl" );
	}
//  ballsock();
base( A  );
translate( [ 25, 0 , 0 ] )  base( A  );
translate( [ -25, 0 , 0 ] )  base( A  );
translate( [ 0 , 0 , 2.5] )  cube( [ 50 , 50 , 5 ] , center=true );
module base(    ) { 
	L = 4*25;
	T = 5 ;
	H = .5 * 25;
	difference(){
	union(){
		translate( [ 0 , -L/2, L - 25 ] )  wedge(T=T,L=L,h = H );
		color("white")  color("red")  box( T , L , 3*25 );
	} #union(){// } union() {
		
		} }
	}
//  Export  Date: 01:49:32 PM - 19:Oct:2025...


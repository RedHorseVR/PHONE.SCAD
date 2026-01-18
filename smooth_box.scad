R = 7;
bumperTHICK = 15;
bumperDIM = [ 29 , 40 , bumperTHICK ] ;
//color("blue")  translate( [ 0 , 0 , 0] )   rounded_box( bumperDIM , R  );
color("red")  smooth_box( bumperDIM , R   );

module smooth_box(d, r, s=4) {//smooth_box with consistent dimensions and alignment
	if(s == 0) {//no edge smoothing, use standard rounded_box
		translate( [ -d[0]/2 , -d[1]/2 , 0 ] )
		linear_extrude(height = d[2] )
		minkowski() {
			translate([r,r]) square([d[0]-2*r, d[1]-2*r]);// ////
			circle(r);// ////
			}
	} else {//use 3D minkowski with dimension and position compensation
		translate( [ -d[0]/2 + s , -d[1]/2 + s , s ] )//compensate for sphere offset
		minkowski() {//3D minkowski with sphere
			linear_extrude(height = d[2] - 2*s )//reduce height for sphere
			minkowski() {//2D minkowski for corners
				translate([r,r]) square([d[0]-2*r-2*s, d[1]-2*r-2*s]);// ////compensate for sphere
				circle(r);// ////
				}
			sphere(r = s);// ////sphere for edge smoothing
			}
		}
	}
module rounded_box(d,r) {//// //////
	translate( [ -d[0]/2 , -d[1]/2 , 0 ] )
	linear_extrude(height = d[2] )
	minkowski() {//// //////
		translate([r,r]) square([d[0]-2*r, d[1]-2*r]);// ////
		circle(r);// ////
		}//// //////
	}//// //////

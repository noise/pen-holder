segs=20;
h = 100;

module mag_hole() {
  rotate([90,0,0]){   
    linear_extrude(2, slices=30){
      scale([1,1,1])
        circle(d=11);
    }
  }
}
  
module holder() {
    difference() {
      // main spiral outside
      linear_extrude(h, convexity=10, twist=105, slices=15, scale=1.5){
        circle(r=30, $fn=10);
      }
      union() {  
        // inside cut
        translate([0,0,3])
        linear_extrude(h+20, convexity=10, twist=0, slices=15, scale=1.5){
          difference() {
              circle(r=28);
              translate([0,20,0]) square([60,20], center=true);
          }
        }
        // back cut
        linear_extrude(h+20, convexity=10, twist=0, slices=15, scale=1.5){
          translate([0,24,0]) square([60,20], center=true);
        }
        // magnet cuts
        translate([-20,19.0,80]) mag_hole();
        translate([20,19.0,80]) mag_hole();
        translate([0,15.5,20]) mag_hole();
        
      }
  }
}

holder();

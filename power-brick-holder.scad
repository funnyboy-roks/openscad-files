// Holder for laptop charger power brick

width = 60;
height = 35;
depth = 150;

wall_thicc = 2;

difference() {
    union() {
        translate([-wall_thicc, 0, -wall_thicc])
            cube([width + wall_thicc*2, depth, height+wall_thicc]);
        translate([-15, 0, height-wall_thicc])
            cube([width, depth, wall_thicc]);
    }

    // cylinder(height*2, 2, 2);

    translate([0, -0.01, 0.01]) {
        cube([width, depth*2, height]);
        translate([15, 0, 15])
            cube([width, depth*2, height]);
    }
}

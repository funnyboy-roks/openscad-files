// A small box designed hold some ink cartridges

use <./lamy-t10.scad>;

interior_x = 20;
interior_y = 57;
interior_z = 73;

wall_thicc = 2;

case_x = interior_x + wall_thicc*2;
case_y = interior_y + wall_thicc*2;
case_z = interior_z + wall_thicc*1;

bump_inset = 5;

$fn = 10;

// case
union() {
    difference() {
        cube([case_x, case_y, case_z]);

        // interior
        translate([wall_thicc, wall_thicc, wall_thicc])
            cube([interior_x, interior_y, interior_z + .1]);

        // thumb hole
        translate([wall_thicc, wall_thicc + interior_y/2 - (interior_y*.75/2), -5])
            cube([interior_x, interior_y*.75, 10]);
    }

    // bump
    translate([interior_x + wall_thicc + .25, wall_thicc, interior_z + wall_thicc - bump_inset])
        rotate([-90, 0, 0])
        cylinder(interior_y, 1);
}

// case with lamy t10 clip
translate([50, 0, 0])
union() {
    translate([wall_thicc, case_y/2 + comb_width()/2, case_z/2 - 15])
        rotate([90, 0, -90])
        comb();

    translate([wall_thicc, case_y/2 + comb_width()/2, case_z/2 + 15])
        rotate([90, 0, -90])
        comb();

    difference() {
        cube([case_x, case_y, case_z]);

        // interior
        translate([wall_thicc, wall_thicc, wall_thicc])
            cube([interior_x, interior_y, interior_z + .1]);

        // thumb hole
        translate([wall_thicc, wall_thicc + interior_y/2 - (interior_y*.75/2), -5])
            cube([interior_x, interior_y*.75, 10]);
    }

    // bump
    translate([interior_x + wall_thicc + .25, wall_thicc, interior_z + wall_thicc - bump_inset])
        rotate([-90, 0, 0])
        cylinder(interior_y, 1);
}

// drawer
translate([100, 0, 0]) {
    difference() {
        tolerance = .4;
        translate([tolerance / 2, tolerance / 2, tolerance / 2])
            cube([interior_z - tolerance, interior_y - tolerance, interior_x - tolerance - .5]);

        // interior
        translate([wall_thicc, wall_thicc, wall_thicc])
            cube([interior_z - wall_thicc*2, interior_y - wall_thicc*2, interior_x - wall_thicc + 2]);

        // thumb cutout
        cutout_size = interior_z/2;
        translate([interior_z - wall_thicc - .1, interior_y / 2 - cutout_size/2 - .1, interior_x-wall_thicc*3 - .1])
            cube([wall_thicc + .2, cutout_size + .2, wall_thicc*3 + .2]);

        // bump cutout
        translate([interior_z - bump_inset, -.1, 0])
            rotate([-90, 0, 0])
            cylinder(interior_y + .2, 1);
    }
}

// // cartridge
// translate([60, wall_thicc + .1, 10])
//     rotate([-90, 0, 0])
//     %cylinder(52.5, 7 / 2, 7 / 2, $fn=80);

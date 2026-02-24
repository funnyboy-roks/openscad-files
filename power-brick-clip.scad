// A pair of clips for holding a power brick

clip_width = 15;
wall_thicc = 2;

brick_width = 52;
brick_height = 33.5;

$fn=70;

module clip() {
    difference() {
        linear_extrude(clip_width) union() {
            square([wall_thicc, brick_height + wall_thicc]);
            translate([-15, brick_height])
                square([15, wall_thicc]);

            rotate(1)
                union() {
                    square([brick_width + 20, wall_thicc]);
                    polygon(points = [
                            [brick_width + wall_thicc, wall_thicc - .01],
                            [brick_width + wall_thicc, wall_thicc + 5 - .01],
                            [brick_width + 20,         wall_thicc - .01],
                    ]);
                }
        }

        translate([-7.5, brick_height + wall_thicc*1.5, clip_width/2])
        rotate([90, 0, 0])
        cylinder(h=wall_thicc*2, d=4);
    }
}

union() {
    clip();
    translate([wall_thicc, wall_thicc, 0])
        rotate(1)
        cube([brick_width, 10, wall_thicc]);
    translate([wall_thicc, wall_thicc, 0])
        cube([5, brick_height, wall_thicc]);
}

translate([brick_width + 50, 0, 0])
union() {
    clip();
    translate([0, 0, clip_width - wall_thicc]) {
        translate([wall_thicc, wall_thicc, 0])
            rotate(1)
            cube([brick_width, 10, wall_thicc]);
        translate([wall_thicc, wall_thicc, 0])
            cube([5, brick_height, wall_thicc]);
    }
}

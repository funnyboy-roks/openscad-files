wire_diameter = 2.7;
clip_width = 2;
clip_padding = 5;
platform_width = 111;
platform_height = 0.5;
clip_offset = 27.6;
pole_size = 26;
spacing = 50;

clip_outside = 4;
clip_size = wire_diameter + clip_outside;

module clip(pos) {
    color("blue")
    translate(pos)
    translate([clip_width, 0, 0])
    rotate([0, -90, 0])
    linear_extrude(clip_width) {
        difference() {
            square([wire_diameter + .5, clip_size]);
            
            translate([(wire_diameter) / 2, clip_size/2, 0])
            circle(wire_diameter / 2, $fn=15);
            
            translate([1 + (wire_diameter + 2) / 2, clip_size/2, 0])
            square([4, wire_diameter - .5], center = true);
        }
    }
}

union() {
    //cube([2, 50+2+wire_diameter, 2]);
    difference() {
        platform_depth = clip_offset + 50 + 50 + clip_size + spacing/2+clip_size/2;
        echo(platform_depth)
        cube([platform_width, platform_depth, platform_height]);

        // // cutout for pole (bottom left)
        // translate([-.001, -.001]) // slight offset so no outside there
        // color("red")
        // union() {
        //     cutout_height = 10;
        //
        //     translate([pole_size/2, pole_size/2])
        //         cylinder(cutout_height, pole_size/2, pole_size/2, center=true);
        //
        //     translate([0, 0, -cutout_height/2]) {
        //         cube([pole_size/2, pole_size  , cutout_height]);
        //         cube([pole_size  , pole_size/2, cutout_height]);
        //     }
        // }

        // // cutout for pole (bottom right)
        // translate([.001, .001]) // slight offset so no outside there
        // color("red")
        // union() {
        //     cutout_height = 10;

        //     translate([platform_width - pole_size/2, pole_size/2])
        //         cylinder(cutout_height, pole_size/2, pole_size/2, center=true);

        //     translate([platform_width - pole_size, 0, -cutout_height/2]) {
        //         translate([pole_size/2, 0])
        //             cube([pole_size/2, pole_size, cutout_height]);
        //         cube([pole_size  , pole_size/2, cutout_height]);
        //     }
        // }
    }

    for (x = [clip_padding, platform_width - clip_padding - clip_width]) {
        for (y = [0:2]) {
            clip([x, clip_offset + spacing * y, platform_height]);
        }
    }
}

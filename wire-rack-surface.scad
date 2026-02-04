// Surface for a wire rack

wire_diameter = 2.7;
clip_width = 2;
clip_padding = 5;
platform_width = 181;
platform_height = 0.5;
clip_offset = 26.5; // center of first clip from end
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
    platform_depth = clip_offset + spacing + spacing + clip_size + (spacing/2-clip_size/2) + 22.4/2;
    echo(platform_depth = platform_depth);
    cube([platform_width, platform_depth, platform_height]);

    for (x = [clip_padding, platform_width/2 - clip_width/2, platform_width - clip_padding - clip_width]) {
        for (y = [0:2]) {
            clip([x, clip_offset + spacing * y, platform_height]);
        }
    }
}

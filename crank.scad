// Crank for https://www.thingiverse.com/thing:264769

bar_width = 15;
bar_height = 5;
bar_length = 50;

$fn=100;

difference() {
    union() {
        cylinder(9 + bar_height, d=6.6, $fn=6);
        translate([0, -bar_width/2, 0])
            cube([bar_length, bar_width, bar_height]);
        cylinder(bar_height, d=bar_width);
        translate([bar_length, 0, 0])
            cylinder(bar_height, d=bar_width);
    }

    translate([bar_length, 0, bar_height-2])
        cylinder(10, d=bar_width-2);
    translate([bar_length, 0, -1])
        cylinder(10, d=bar_width-6);
}

clearance = .3;

union() {
    translate([bar_length, 0, bar_height-2 + clearance])
        cylinder(2, d=bar_width-2 - clearance*2);

    knob_height = 30;

    translate([bar_length, 0, -knob_height - clearance])
        cylinder(knob_height, d=bar_width-2 - clearance*2);

    translate([bar_length, 0, -knob_height + bar_height])
        cylinder(knob_height, d=bar_width-6 - clearance*2);
}
